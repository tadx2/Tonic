//
//  ChordSymbol.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

public struct ChordSymbol: Hashable, Sendable {

    public var root: Note?
    public var main: ChordSymbolElement?
    public var sus: ChordSymbolElement?
    public var additions: [ChordSymbolElement]

    public init(
        _ main: ChordSymbolElement? = nil,
        sus: ChordSymbolElement? = nil,
        additions: [ChordSymbolElement] = [],
        root: Note? = nil
    ) {
        self.root = root
        self.main = main
        self.sus = sus
        self.additions = additions
    }

}

extension ChordSymbol {

    // ChordSymbol 与 Chord 对应关系
    // 一个symbol对应N个Chord， 例如 M13 这两个和弦记号，指向的和弦包括 含有 9音 或者 11音，或者同时9音和11音， 或者压根就没有9音或者11音 的和弦
    public static let ChordSymbolSearchChordsDictionary: [ChordSymbol: [Chord]] = {

        let allChord = IntervalPreset().intervals.map {
            Chord(root: .C3, intervals: $0)
        }

        var result: [ChordSymbol: [Chord]] = [:]

        for chord in allChord {
            guard let chordSymbols = chord.symbols else { continue }
            for chordSymbol in chordSymbols {
                // 不同和弦可能共享同一个 symbol
                result[chordSymbol, default: []].append(chord)
            }
        }

        return result
    }()

    // ChordSymbolInputElementSet 与 ChordSymbol 对应关系
    // 一个 Set可以对应N个 ChordSymbol。 例如： [.flat, .flat, .seven, .sus, .flat, .five] 可以对应： bb7sus(b5)/b5sus(bb7)/sus(b5, bb7)
    public static let ChordSymbolInputElementSetSearchChordSymbolDictionary:
        [Set<ChordSymbolElement>: [ChordSymbol]] = {
            let allChordSymbols = Self.ChordSymbolSearchChordsDictionary.keys

            var result: [Set<ChordSymbolElement>: [ChordSymbol]] = [:]
            for chordSymbol in allChordSymbols {
                let chordSymbolSet = Set(chordSymbol.flatChordSymbolElements)
                result[chordSymbolSet, default: []].append(chordSymbol)
            }
            return result
        }()

}

extension ChordSymbol {

    /// 和弦名的书写方式，在没有考虑到tension的时候，已经由 ChordSymbolBaseCase 指定好了 多个表达方式
    /// 但是，考虑到Tension的时候，又可以采取以下写法:
    internal var rephraseSymbols: [ChordSymbol] {
        var result = [rephraseSeventh, rephraseSixNine].compactMap { $0 }
        if let altSymbols = rephraseAlt {
            result.append(contentsOf: altSymbols)
        }
        return result
    }

    private var preferredSeventhExtension: ChordSymbolElement? {
        if additions.contains(.thirteen) { return .thirteen }
        if additions.contains(.eleven) { return .eleven }
        if additions.contains(.nine) { return .nine }
        return nil
    }

    private static func mergedTensionRemovals(for target: ChordSymbolElement) -> Set<
        ChordSymbolElement
    > {
        switch target {
        case .thirteen:
            [.nine, .eleven, .thirteen]
        case .eleven:
            [.nine, .eleven]
        case .nine:
            [.nine]
        default:
            []
        }
    }

    /// 写法: **Tension 合并**（例如 `C7(add9)` 可考虑合并表达）
    ///
    /// 该属性用于判断当前和弦是否“具备改写为 Seventh 合并写法”的前置条件。
    ///
    /// 判定规则（两者都必须满足）：
    /// 1. `main` 必须是可升阶的七和弦之一：
    ///    `.seven / .major7 / .minor7 / .minorMajor7 / .augmented7 / .diminished7`
    /// 2. `additions` 中至少包含一个可被合并的高位张力音：
    ///    `.nine / .eleven / .thirteen`
    ///
    /// 语义说明：
    /// - `true`：仅表示“可以进入 Seventh 合并改写流程”。
    /// - `false`：表示当前不满足合并前提，应保持原写法。
    ///
    /// 示例：
    /// - `main = .seven`, `additions = [.nine]` -> `true`
    /// - `main = .major7`, `additions = [.nine]` -> `true`
    /// - `main = .seven`, `additions = [.flat9]` -> `false`（当前规则只接受 9/11/13）
    var canRephraseSeventh: Bool {
        guard
            let baseMain = main,
            baseMain.canMergedTensionSymbol,
            let target = preferredSeventhExtension
        else { return false }
        return baseMain.addMergedTensionSymbol(tensionSymbol: target) != nil
    }

    /// 将 `7(add9/add11/add13)` 合并为 `9/11/13` 主符号写法。
    ///
    /// 规则：
    /// - 优先级 `13 > 11 > 9`（存在更高扩展时，直接采用更高主符号）。
    /// - 被合并的自然扩展（9/11/13）会从 `additions` 移除。
    /// - 其他 additions（如 `b9/#11`）保留不变。
    ///
    /// 例子：
    /// - `7 + [9]` -> `9`
    /// - `7 + [9, 11]` -> `11`
    /// - `7 + [9, 11, 13, b9]` -> `13 + [b9]`
    var rephraseSeventh: ChordSymbol? {
        guard
            let baseMain = main,
            baseMain.canMergedTensionSymbol,
            let target = preferredSeventhExtension,
            let mergedMain = baseMain.addMergedTensionSymbol(tensionSymbol: target)
        else { return nil }

        var result = self
        result.main = mergedMain
        let removeAdditions = Self.mergedTensionRemovals(for: target)
        result.additions.removeAll { removeAdditions.contains($0) }
        return result
    }

    /// 写法:  **69和弦简写**
    /// 如果原本的和弦有一个 数字6（表示有一个6音），改造前又有一个additon为9，表示有一个 tension 9
    /// 最终可以输出为69
    var canRephraseSixNine: Bool {
        (self.main?.canChangeToSixNineSymbol ?? false) && self.additions.contains(.nine)
    }

    /// 原本的情况是：
    /// mainPart = ChordSymbolPartMain(keywords: [xxx], numberWithAcc: .six )
    ///
    /// 其实就是某个带6的和弦，
    /// 改造后的和弦情况是：ChordSymbolPartMain(keywords: [xxx], numberWithAcc: .six, addition: [.nine, xxx])
    /// return nil 表示不存在 可以改造的情况
    var rephraseSixNine: ChordSymbol? {

        guard self.canRephraseSixNine else { return nil }
        guard let symbolSixNine = self.main?.changeToSixNineSymbol else { return nil }

        var result = self

        // 把 main 中原本6拿掉, 换成69。 再把addition的9拿掉
        result.main = symbolSixNine

        result.additions.removeAll { addition in
            addition == .nine
        }

        return result
    }

    /// 写法： **Atl简写**
    /// Alt和弦（Altered Chord，变化和弦）是爵士乐中一类重要的属七和弦变体，其核心特征是通过降五音（♭5）和降九音（♭9）等变化音，制造出强烈的紧张感和解决倾向
    /// 在addition中包含任意 变化音 5/9/11/13，都认定为是一个Alt
    ///
    private static let AlteredAdditionsContain: [ChordSymbolElement] = [ .flat5, .sharp5, .flat9, .sharp9, .sharp11, .flat13, .sharp13]
    
    var canRephraseAlt: Bool {
        (self.main == .seven) && ( additions.contains { Self.AlteredAdditionsContain.contains($0) } )
    }
   
    var rephraseAlt: [ChordSymbol]? {
        
        guard canRephraseAlt else { return nil }
        
        var sevenAlt = self

        // 把main替换为 7Alt
        sevenAlt.main = .sevenAlt

        sevenAlt.additions.removeAll { addition in
            Self.AlteredAdditionsContain.contains(addition)
        }
        
        var onlyAlt = self
        
        // 把main替换为 7Alt
        onlyAlt.main = .alt

        onlyAlt.additions.removeAll { addition in
            Self.AlteredAdditionsContain.contains(addition)
        }
        
        return [sevenAlt, onlyAlt]
        
    }
    //
    //    /// 写法： **WrongTension**
    //    /// 考虑到有的人会用 2来替代9， 4来替代11
    //    var canRephraseWrongTension: Bool {
    //        additions.contains { addition in
    //            addition.contains(.number(.nine)) || addition.contains(.number(.eleven))
    //        }
    //    }
    //
    //    var rephraseWrongTension: ChordSymbol? {
    //        guard canRephraseWrongTension else { return nil }
    //        var result = self
    //
    //        result.additions = result.additions.map { addition in
    //            addition.map { element in
    //                switch element {
    //                case .number(.nine):
    //                    return .number(.two)
    //                case .number(.eleven):
    //                    return .number(.four)
    //                default:
    //                    return element
    //                }
    //            }
    //        }
    //
    //        return result
    //    }

}

extension ChordSymbol {

    // 把ChordSymbol扁平化为一个ChordSymbolInputElement数据结构
    private var flatChordSymbolElements: [ChordSymbolElement] {
        return [self.main, self.sus].compactMap { $0 } + self.additions
    }

    //    public var flatChordSymbolElementsInput: [ChordSymbolElementInput] {
    //        var result:  [ChordSymbolElementInput] = []
    //        for element in flatChordSymbolElements {
    //            result.append(contentsOf: element.inputElements)
    //        }
    //        return result
    //    }
}

// displayString
extension ChordSymbol {
    //    public func displayString() -> String{
    //        let mainString = self.main.map{ element in
    //            return element.displayString()
    //        }.joined()
    //
    //        let susString = self.sus.map{ element in
    //            return element.displayString()
    //        }.joined()
    //
    //        var additionString = self.additions.map{ addition in
    //            addition.map{ $0.displayString() }.joined(separator: "")
    //        }.joined(separator: " ")
    //
    //        if !additionString.isEmpty {
    //            additionString = "(\(additionString))"
    //        }
    //
    //        return mainString + susString + additionString
    //    }
}

// public typealias ChordSymbolRelation = (chord: Chord, symbol: ChordSymbol)

//    public static func ChordSymbolElementSequenceDict() -> [ [ChordSymbolElementCase]:
//        [ChordSymbolRelation]]
//    {
//        let symbolDict = ChordSymbolSearchDict()
//        var result: [[ChordSymbolElementCase]: [ChordSymbolRelation]] = [:]
//
//        for (chordSymbol, chord) in symbolDict {
//            let flatElements = chordSymbol.flatInputSymbolElement
//            result[flatElements, default: []].append((chord: chord, symbol: chordSymbol))
//        }
//        return result
//    }
