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
