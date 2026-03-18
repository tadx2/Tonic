//
//  ChordSymbol.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

public struct ChordSymbol: Hashable, Sendable {
    
    public let rootNoteLetter: ChordSymbolElement?
    public let rootNoteAcc: ChordSymbolElementGroup

    public var quality: ChordSymbolElementGroup
    
    public var sus: ChordSymbolElementGroup
    
    public var additions: [ChordSymbolElementGroup]

    public init(
        rootNoteLetter: ChordSymbolElement? = nil,
        rootNoteAcc: ChordSymbolElementGroup = [],
        quality: ChordSymbolElementGroup = [],
        sus: ChordSymbolElementGroup = [],
        additions: [ChordSymbolElementGroup] = [],
    ) {
        self.quality = quality
        self.sus = sus
        self.additions = additions
        self.rootNoteLetter = rootNoteLetter
        self.rootNoteAcc = rootNoteAcc
    }

}

extension ChordSymbol {
    
    /// 将扁平的 `ChordSymbolElementInputGroup`（如 `[.flat, .nine, .sharp, .eleven]`）
    /// 按"(若干 acc) + 数字"规则拆分为多个 group。
    ///
    /// - 每当遇到一个**数字**元素，就把它与它前面积累的所有 accidental 合为一组。
    /// - 例：`[.flat, .nine, .sharp, .eleven, .flat, .thirteen]`
    ///   → `[ [.flat, .nine], [.sharp, .eleven], [.flat, .thirteen] ]`
    /// - 若 `inputs` 为 `nil`，返回 `nil`；若 `inputs` 为空，返回 `[]`。
//    public static func convertChordInputElementToAdditions(_ inputs: ChordSymbolElementInputGroup?) -> [ChordSymbolElementInputGroup]? {
//
//        guard let inputs = inputs else { return nil }
//
//        var result: [ChordSymbolElementInputGroup] = []
//        var currentGroup: ChordSymbolElementInputGroup = []
//
//        for element in inputs {
//            currentGroup.append(element)
//            // 数字类型：遇到数字就封闭当前 group
//            if element.isNumber {
//                result.append(currentGroup)
//                currentGroup = []
//            }
//        }
//
//        // 如果末尾有孤立的 acc（没有跟数字），也作为一组追加（容错处理）
//        if !currentGroup.isEmpty {
//            result.append(currentGroup)
//        }
//
//        return result
//    }
}

extension ChordSymbol {

    // ChordSymbol 与 Chord 对应关系
    // 一个symbol对应N个Chord， 例如 M13 这两个和弦记号，指向的和弦包括 含有 9音 或者 11音，或者同时9音和11音， 或者压根就没有9音或者11音 的和弦
//    public static let ChordSymbolSearchChordsDictionary: [ChordSymbol: [Chord]] = {
//
//        let allChord = IntervalPreset(type: .all, sus: .all, isWithTension: true).intervals.map {
//            Chord(root: .C3, intervals: $0)
//        }
//
//        var result: [ChordSymbol: [Chord]] = [:]
//
//        for chord in allChord {
//            guard let chordSymbols = chord.symbols else { continue }
//            for chordSymbol in chordSymbols {
//                // 不同和弦可能共享同一个 symbol
//                result[chordSymbol, default: []].append(chord)
//            }
//        }
//
//        return result
//    }()
//
//    // ChordSymbolInputElementSet 与 ChordSymbol 对应关系
//    // 一个 Set可以对应N个 ChordSymbol。 例如： [.flat, .flat, .seven, .sus, .flat, .five] 可以对应： bb7sus(b5)/b5sus(bb7)/sus(b5, bb7)
//    public static let ChordSymbolInputElementSetSearchChordSymbolDictionary:
//        [Set<ChordSymbolElement>: [ChordSymbol]] = {
//            let allChordSymbols = Self.ChordSymbolSearchChordsDictionary.keys
//
//            var result: [Set<ChordSymbolElement>: [ChordSymbol]] = [:]
//            for chordSymbol in allChordSymbols {
//                let chordSymbolSet = Set(chordSymbol.flatChordSymbolElements)
//                result[chordSymbolSet, default: []].append(chordSymbol)
//            }
//            return result
//        }()

}
//
//extension ChordSymbol {
//
//    /// 和弦名的书写方式，在没有考虑到tension的时候，已经由 ChordSymbolBaseCase 指定好了 多个表达方式
//    /// 但是，考虑到Tension的时候，又可以采取以下写法:
//    internal var rephraseSymbols: [ChordSymbol] {
//        var result = [rephraseSeventh, rephraseSixNine, rephraseWrongTension].compactMap { $0 }
//        if let altSymbols = rephraseAlt {
//            result.append(contentsOf: altSymbols)
//        }
//        return result
//    }
//
//    private var preferredSeventhExtension: ChordSymbolElement? {
//        if additions.contains(.thirteen) { return .thirteen }
//        if additions.contains(.eleven) { return .eleven }
//        if additions.contains(.nine) { return .nine }
//        return nil
//    }
//
//    private static func mergedTensionRemovals(for target: ChordSymbolElement) -> Set<
//        ChordSymbolElement
//    > {
//        switch target {
//        case .thirteen:
//            [.nine, .eleven, .thirteen]
//        case .eleven:
//            [.nine, .eleven]
//        case .nine:
//            [.nine]
//        default:
//            []
//        }
//    }
//
//    /// 写法: **Tension 合并**（例如 `C7(add9)` 可考虑合并表达）
//    ///
//    /// 该属性用于判断当前和弦是否“具备改写为 Seventh 合并写法”的前置条件。
//    ///
//    /// 判定规则（两者都必须满足）：
//    /// 1. `main` 必须是可升阶的七和弦之一：
//    ///    `.seven / .major7 / .minor7 / .minorMajor7 / .augmented7 / .diminished7`
//    /// 2. `additions` 中至少包含一个可被合并的高位张力音：
//    ///    `.nine / .eleven / .thirteen`
//    ///
//    /// 语义说明：
//    /// - `true`：仅表示“可以进入 Seventh 合并改写流程”。
//    /// - `false`：表示当前不满足合并前提，应保持原写法。
//    ///
//    /// 示例：
//    /// - `main = .seven`, `additions = [.nine]` -> `true`
//    /// - `main = .major7`, `additions = [.nine]` -> `true`
//    /// - `main = .seven`, `additions = [.flat9]` -> `false`（当前规则只接受 9/11/13）
//    var canRephraseSeventh: Bool {
//        guard
//            let baseMain = main,
//            baseMain.canMergedTensionSymbol,
//            let target = preferredSeventhExtension
//        else { return false }
//        return baseMain.addMergedTensionSymbol(tensionSymbol: target) != nil
//    }
//
//    /// 将 `7(add9/add11/add13)` 合并为 `9/11/13` 主符号写法。
//    ///
//    /// 规则：
//    /// - 优先级 `13 > 11 > 9`（存在更高扩展时，直接采用更高主符号）。
//    /// - 被合并的自然扩展（9/11/13）会从 `additions` 移除。
//    /// - 其他 additions（如 `b9/#11`）保留不变。
//    ///
//    /// 例子：
//    /// - `7 + [9]` -> `9`
//    /// - `7 + [9, 11]` -> `11`
//    /// - `7 + [9, 11, 13, b9]` -> `13 + [b9]`
//    var rephraseSeventh: ChordSymbol? {
//        guard
//            let baseMain = main,
//            baseMain.canMergedTensionSymbol,
//            let target = preferredSeventhExtension,
//            let mergedMain = baseMain.addMergedTensionSymbol(tensionSymbol: target)
//        else { return nil }
//
//        var result = self
//        result.main = mergedMain
//        let removeAdditions = Self.mergedTensionRemovals(for: target)
//        result.additions.removeAll { removeAdditions.contains($0) }
//        return result
//    }
//
//    /// 写法:  **69和弦简写**
//    /// 如果原本的和弦有一个 数字6（表示有一个6音），改造前又有一个additon为9，表示有一个 tension 9
//    /// 最终可以输出为69
//    var canRephraseSixNine: Bool {
//        (self.main?.canChangeToSixNineSymbol ?? false) && self.additions.contains(.nine)
//    }
//
//    /// 原本的情况是：
//    /// mainPart = ChordSymbolPartMain(keywords: [xxx], numberWithAcc: .six )
//    ///
//    /// 其实就是某个带6的和弦，
//    /// 改造后的和弦情况是：ChordSymbolPartMain(keywords: [xxx], numberWithAcc: .six, addition: [.nine, xxx])
//    /// return nil 表示不存在 可以改造的情况
//    var rephraseSixNine: ChordSymbol? {
//
//        guard self.canRephraseSixNine else { return nil }
//        guard let symbolSixNine = self.main?.changeToSixNineSymbol else { return nil }
//
//        var result = self
//
//        // 把 main 中原本6拿掉, 换成69。 再把addition的9拿掉
//        result.main = symbolSixNine
//
//        result.additions.removeAll { addition in
//            addition == .nine
//        }
//
//        return result
//    }
//
//    /// 写法： **Atl简写**
//    /// Alt和弦（Altered Chord，变化和弦）是爵士乐中一类重要的属七和弦变体，其核心特征是通过降五音（♭5）和降九音（♭9）等变化音，制造出强烈的紧张感和解决倾向
//    /// 在addition中包含任意 变化音 5/9/11/13，都认定为是一个Alt
//    ///
//    private static let AlteredAdditionsContain: [ChordSymbolElement] = [
//        .flat5, .sharp5, .flat9, .sharp9, .sharp11, .flat13, .sharp13,
//    ]
//
//    var canRephraseAlt: Bool {
//        (self.main == .seven) && (additions.contains { Self.AlteredAdditionsContain.contains($0) })
//    }
//
//    var rephraseAlt: [ChordSymbol]? {
//
//        guard canRephraseAlt else { return nil }
//
//        var sevenAlt = self
//
//        // 把main替换为 7Alt
//        sevenAlt.main = .sevenAlt
//
//        sevenAlt.additions.removeAll { addition in
//            Self.AlteredAdditionsContain.contains(addition)
//        }
//
//        var onlyAlt = self
//
//        // 把main替换为 7Alt
//        onlyAlt.main = .alt
//
//        onlyAlt.additions.removeAll { addition in
//            Self.AlteredAdditionsContain.contains(addition)
//        }
//
//        return [sevenAlt, onlyAlt]
//
//    }
//
//    /// 写法： **WrongTension**
//    /// 考虑到有的人会用 2来替代9， 4来替代11
//
//    /// 如果后续要新增映射（比如 flat11 → flat4），只需在字典里加一行，无需改动 canRephraseWrongTension 和 rephraseWrongTension 的逻辑。
//    private static let wrongTensionMap: [ChordSymbolElement: ChordSymbolElement] = [
//        .nine: .two,
//        .flat9: .flat2,
//        .sharp9: .sharp2,
//        .eleven: .four,
//        .sharp11: .sharp4,
//    ]
//
//    var canRephraseWrongTension: Bool {
//        additions.count == 1 && Self.wrongTensionMap.keys.contains(additions[0])
//    }
//
//    var rephraseWrongTension: ChordSymbol? {
//        guard canRephraseWrongTension,
//            let replacement = Self.wrongTensionMap[additions[0]]
//        else { return nil }
//
//        var result = self
//        result.additions = [replacement]
//        return result
//    }
//
//}

extension ChordSymbol {

    // 把ChordSymbol扁平化为一个ChordSymbolInputElement数据结构
//    private var flatChordSymbolElements: [ChordSymbolElement] {
//        return [self.main, self.sus].compactMap { $0 } + self.additions
//    }

    /// 把 ChordSymbol 反序列化为键盘输入序列 [ChordSymbolElementInput]
    /// 包含 root（字母 + 升降号）、main、sus（带 separator）、additions（带 separator）
//    public var flatChordSymbolElementsInput: [ChordSymbolElementInput] {
//        var result: [ChordSymbolElementInput] = self.root + self.main + self.sus
//
//        for addition in self.additions {
//            result.append(contentsOf: addition)
//        }
//
//        return self.root + result
//    }
}

// nine: [ChordSymbolElementInput] = [.nine]
// flat9: [ChordSymbolElementInput] = [.flat, .nine]
// sharp9: [ChordSymbolElementInput] = [.sharp, .nine]
// eleven: [ChordSymbolElementInput] = [.eleven]
// sharp11: [ChordSymbolElementInput] = [.sharp, .eleven]
// thirteen: [ChordSymbolElementInput] = [.thirteen]
// flat13: [ChordSymbolElementInput] = [.flat, .thirteen]
// sharp13: [ChordSymbolElementInput] = [.sharp, .thirteen]
// flat5: [ChordSymbolElementInput] = [.flat, .five]
// sharp5: [ChordSymbolElementInput] = [.sharp, .five]
// seven: [ChordSymbolElementInput] = [.seven]
// flatFlat7: [ChordSymbolElementInput] = [.flat, .flat, .seven]


