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
