//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

public struct ChordName: Sendable {

    private let basicName: String?
    private let basicNameShort: String?

    private let basicNameAddition: [Interval]
    private let tensionAddition: [Interval]

    private let baseNoteName: String?

    private let rootNote: Note

    public init(chord: Chord) {

        let currentIntervals = Set(
            chord.intervalsRaw.filter { $0.degreeInt != 1 && $0.degreeInt <= 7 })
        let chordTypeBasic = ChordTypeBasic.allCases.first(where: {
            $0.info.intervals == currentIntervals
        })?.info

        self.basicName = chordTypeBasic?.basicName
        self.basicNameShort = chordTypeBasic?.shortName
        self.basicNameAddition = chordTypeBasic?.basicNameAddition ?? []

        let tensions = chord.intervalsRaw.filter { $0.degreeInt > 7 }
        self.tensionAddition = Array(Set(tensions)).sorted { $0.degreeInt < $1.degreeInt }

        if chord.noteRoot.name != chord.noteBase?.name {
            self.baseNoteName = chord.noteBase?.name
        } else {
            self.baseNoteName = nil
        }

        self.rootNote = chord.noteRoot
    }

}

extension ChordName {

    // 是否能被简写？
    var canMerged: Bool {
        ["M7", "7", "m7"].contains(self.basicName)
    }

    // 可以用来简写的tension
    var canMergedTension: [Interval]? {

        guard basicName != nil else { return nil }

        guard !tensionAddition.isEmpty else { return nil }

        let shorthands: Set<Interval> = [.M9, .P11, .M13]

        if canMerged {
            return tensionAddition.filter { shorthands.contains($0) }
        } else {
            return nil
        }

    }

    // 最大简写的目标
    var maxMergedTension: Interval? {
        guard let canMergedTension else { return nil }
        return canMergedTension.max(by: { $0.degreeInt < $1.degreeInt })
    }

    // 1. 基本和弦名
    func getBasicName(isMergeTension: Bool, isShort: Bool) -> String? {
        guard let basicName else { return nil }

        var _basicName = basicName

        if isShort, let basicNameShort {
            _basicName = basicNameShort
        }

        if isMergeTension, let maxMergedTension {
            _basicName = String(_basicName.dropLast()) + String(maxMergedTension.degreeInt)
        }

        // 特殊情况，如果是大七简写后 “△7” 参与 merged 后还是 “△7” 一般直接写 “△” 就好了
        if _basicName == "△7" {
            _basicName = "△"
        }

        return _basicName

    }

    // 2. 括号中的音程
    func getAddition(isMergeTension: Bool) -> [Interval] {

        var _tensionAddition = tensionAddition

        if isMergeTension, let canMergedTension {
            _tensionAddition.removeAll(where: { canMergedTension.contains($0) })
        }

        return basicNameAddition + _tensionAddition  // 括号里面最终的音程
    }

}

extension ChordName {

    public func getChordNameString(
        isShowRootNote: Bool = true,
        isMergeTension: Bool = false,
        isShort: Bool = false,
    ) -> String {
        guard let _basicName = getBasicName(isMergeTension: isMergeTension, isShort: isShort) else {
            return "nil"
        }

        let additions = getAddition(isMergeTension: isMergeTension)

        var result: String = self.rootNote.name

        if isShowRootNote {
            result += _basicName
        }

        if !additions.isEmpty {
            let additionStr = additions.map { $0.descriptionNumber }.joined(separator: " ")
            result += "(\(additionStr))"
        }

        if let baseNoteName {
            result += "/\(baseNoteName)"
        }

        return result

    }

}
