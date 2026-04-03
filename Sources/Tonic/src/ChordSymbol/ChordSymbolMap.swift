//
//  ChordSymbolMap.swift
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

/// ** All  Chord Symbol  To Intervals Set 和弦符号 音程组集合 映射**
/// 从音程关系中获取到 allSymbolsSet(和弦的所有符号,加入包括改写后的) 形成一个 和弦符号到 多个音程集合 的映射
/// 算法特点： 一个ChordSymbol 至少对应一个 Intervals
/// 使用方式： let thisSymbolIntervalsSet = chordSymbolToIntervalsMap[chordsymbol]
public let chordSymbolToIntervalsSetMap: [ChordSymbol: Set<Intervals>] = {

    var result: [ChordSymbol: Set<Intervals>] = [:]

    // 从理论音程组合中，获取到每个音程的 symbol
    for intervals in tensionedIntervalsAll {
        for symbol in intervals.allSymbolsSet {
            // 有可能出现不同 音程组合，但是对应相同symbol 的情况
            result[symbol, default: []].insert(intervals)
        }
    }

    return result
}()

/// ** All  Chord Symbol  To Intervals  和弦符号 *最可能* 音程组 映射**
public let chordSymbolToIntervalsMap: [ChordSymbol: Intervals] = {

    var result: [ChordSymbol: Intervals] = [:]

    for (chordSymbol, intervalsSet) in chordSymbolToIntervalsSetMap {
        if intervalsSet.count == 1 {
            // 这是唯一映射，是因为字典下标赋值本来就要求一个 Value?，这里正好是 Intervals?
            result[chordSymbol] = Array(intervalsSet).first
        } else if intervalsSet.count > 1 {
            let sortedByCount = intervalsSet.sortedByCount()

            // 这是多映射情况，只考虑两种情况

            if chordSymbol.quality.contains(.alt) { // 1. Alt
                // 这个时候，判断标准是，第一个是#5，且音程数量最少的那组音程
                let intervals = sortedByCount.first(where: { $0.contains(.A5) })
                result[chordSymbol] = intervals
            } else { // 2. 非Alt，就是简写情况。导致 例如 13 可以表示 N 个和弦
                // 因为按照个数排序了，导致现在返回的就是 只加这个音的音程
                result[chordSymbol] = sortedByCount.first
            }
        }
    }

    return result
}()

/// **All Valid Chord Symbol Bodies**
/// `chordSymbolToIntervalsDictionary` 的 keys 作为合法 body 集合
public let validSymbolsBody: Set<ChordSymbol> = Set(chordSymbolToIntervalsSetMap.keys)

/// **All Valid Chord Symbol Mains**
/// 从合法 body 投影出 `quality + sus` 组成的 main 集合
public let validSymbolsMain: Set<ChordSymbol> = Set(validSymbolsBody.map(\.main))

// MARK: - BlurBody（模糊匹配）

// ## 背景
// `ChordSymbol` 的 `body`（= quality + sus + additions）是精确匹配的：
// additions 的顺序不同就会被视为不同的和弦符号。
// 例如 `M7(♭9)(♯11)` 和 `M7(♯11)(♭9)` 虽然音乐含义相同，但 body 不相等。
//
// ## 解决方案：BlurBody
// `ChordSymbolBlurBody` 将 additions 从有序数组 `[ChordSymbolElementGroup]`
// 转为无序集合 `Set<ChordSymbolElementGroup>`，从而忽略 addition 的排列顺序，
// 只关心"有哪些 addition"，实现模糊匹配。
//
// ## 核心流程（finalIntervals）
// 1. `bluredBody`  — 将当前符号转为模糊表示（忽略 addition 顺序）
// 2. `isBluredBodyValid` — 在 `validSymbolsBluredBody` 集合中查找，判断是否存在这种和弦
// 3. `deBluredBody` — 将 additions 按数字大小重新排序，还原为标准顺序的精确 body
// 4. 用标准化后的 body 去 `chordSymbolToIntervalsMap` 查找对应的音程组
//
// ## 使用场景
// - `ChordSymbolLint.blured`：在 main 合法的前提下，用模糊匹配判断整个 body 是否有效
// - `LeadSheetEditorView`：通过 `finalIntervals == nil` 高亮无效和弦

public extension ChordSymbol {
    /// 模糊 Body：忽略 additions 顺序的和弦 body 表示
    /// - `quality` 和 `sus` 保持不变
    /// - `additions` 转为 `Set`，使 `(♭9)(♯11)` 与 `(♯11)(♭9)` 相等
    struct ChordSymbolBlurBody: Hashable, Sendable {
        let quality: ChordSymbolElementGroup
        let sus: ChordSymbolElementGroup
        let additonsSet: Set<ChordSymbolElementGroup>
    }

    /// 将当前符号转为模糊 body（additions 无序化）
    var bluredBody: ChordSymbolBlurBody {
        ChordSymbolBlurBody(quality: quality, sus: sus, additonsSet: Set(additions))
    }

    /// 将模糊 body 还原为标准化的精确 body（additions 按数字升序排列）
    /// 用于在 `chordSymbolToIntervalsMap` 中精确查找
    var deBluredBody: ChordSymbol {
        var result = body
        result.additions = additions.sorted {
            let lhs = $0.first(where: { $0.isNumber })?.numberOrder ?? 0
            let rhs = $1.first(where: { $0.isNumber })?.numberOrder ?? 0
            return lhs < rhs
        }
        return result
    }

    /// 模糊匹配是否合法：当前和弦的模糊 body 是否存在于预设的合法集合中
    var isBluredBodyValid: Bool {
        validSymbolsBluredBody.contains(bluredBody)
    }

    /// 最终音程组：先通过模糊匹配验证合法性，再用标准化 body 精确查找音程
    /// - Returns: 对应的 `Intervals`；若模糊匹配不通过则返回 `nil`
    var finalIntervals: Intervals? {
        guard isBluredBodyValid else { return nil }
        return chordSymbolToIntervalsMap[deBluredBody]
    }
}

/// 所有合法和弦符号的模糊 body 集合（由 `validSymbolsBody` 映射生成）
public let validSymbolsBluredBody: Set<ChordSymbol.ChordSymbolBlurBody> = Set(validSymbolsBody.map { $0.bluredBody })
