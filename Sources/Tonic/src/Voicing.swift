//
//  Voicing.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

public struct Voicing: Equatable, Hashable{
    public let nameEN: String  // 英文名
    public let nameShort: String
    public var position: Set<Position>  // 位置数据

    public init(
        nameEN: String, nameShort: String,
        position: Set<Position>
    ) {
        self.nameEN = nameEN
        self.position = position
        self.nameShort = nameShort
    }

    public var voicingActiveDegree: Set<Set<ChordDegreeInt>> {
        // 拿到 voicingOriChordDegree 如果是 [1，3，5，7]
        // 3音可以被 2/4 替换 7音可以被 6音替换
        // 则可以生成
        // 替换6音的情况：[1，3，5，7] ， [1，3，5，6]
        // 替换2音的情况：[1，2，5，7] ， [1，2，5，6]
        // 替换4音的情况：[1，4，5，7] ， [1，4，5，6]

        // Voicing 原本有哪些 Chord Degree 组成一个集合
        let voicingOriChordDegree = Set(self.position.map { $0.degreeInt })

        // 基础度数：移除可能发生变化的 3 音和 7 音
        let baseDegrees = voicingOriChordDegree.subtracting([3, 7])

        // 3 音的可能变体：如果有 3，则可以是 [3, 2, 4]；如果没有，则为空
        let thirdVariants: [ChordDegreeInt] = voicingOriChordDegree.contains(3) ? [3, 2, 4] : []

        // 7 音的可能变体：如果有 7，则可以是 [7, 6]；如果没有，则为空
        let seventhVariants: [ChordDegreeInt] = voicingOriChordDegree.contains(7) ? [7, 6] : []

        var result: Set<Set<ChordDegreeInt>> = []

        // 构建组合
        // 如果 variants 不为空，就遍历它的选项。如果为空，就视为 "无变化/无添加"（即当前循环只执行一次：nil）
        let thirdLoop: [ChordDegreeInt?] = thirdVariants.isEmpty ? [nil] : thirdVariants.map { $0 }
        let seventhLoop: [ChordDegreeInt?] =
            seventhVariants.isEmpty ? [nil] : seventhVariants.map { $0 }

        for t in thirdLoop {
            for s in seventhLoop {
                var currentSet = baseDegrees
                if let tVal = t { currentSet.insert(tVal) }
                if let sVal = s { currentSet.insert(sVal) }
                result.insert(currentSet)
            }
        }

        return result
    }
}

extension Voicing {
    public struct Position: Hashable {
        public var degreeInt: ChordDegreeInt
        public var octaveDiff: Int

        public init(degreeInt: ChordDegreeInt, octaveDiff: Int) {
            self.degreeInt = degreeInt
            self.octaveDiff = octaveDiff
        }
    }
}

// MARK: - VoicingType 枚举
public enum VoicingType: CaseIterable {

    // MARK: - 三个音的和弦 Voicings Basic
    case threeNoteRootPosition
    case threeNoteFirstInversion
    case threeNoteSecondInversion
    case threeNoteDrop2

    // MARK: - 四个音的和弦 Voicings Basic
    case fourNoteRootPosition
    case fourNoteFirstInversion
    case fourNoteSecondInversion
    case fourNoteThirdInversion
    case fourNoteDrop2
    case fourNoteDrop3
    case fourNoteDrop2And3

    // MARK: - 四个音的和弦 Voicings Shell
    case fourNoteShellVoicingA
    case fourNoteShellVoicingB
    case fourNoteShellVoicingA_Rootless
    case fourNoteShellVoicingB_Rootless

    // 返回对应的 Voicing 实例
    public var voicing: Voicing {
        switch self {

        // MARK: - 三个音的和弦 Voicings
        case .threeNoteRootPosition:
            return Voicing(
                nameEN: "Traid Root Position ",
                nameShort: "Traid.RP",

                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ]
            )

        case .threeNoteFirstInversion:
            return Voicing(
                nameEN: "Traid First Inversion",
                nameShort: "Traid.Inv.1",

                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ]
            )

        case .threeNoteSecondInversion:
            return Voicing(
                nameEN: "Traid Second Inversion",
                nameShort: "Traid.Inv.2",

                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                ]
            )

        case .threeNoteDrop2:
            return Voicing(
                nameEN: "Traid Drop 2ed Note",
                nameShort: "Traid.Drop2",

                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ]
            )

        // MARK: - 4个音的和弦 Voicings
        case .fourNoteRootPosition:
            return Voicing(
                nameEN: "Seventh Root Position",
                nameShort: "Seventh.RP",

                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ]
            )

        case .fourNoteFirstInversion:
            return Voicing(
                nameEN: "Seventh First Inversion",
                nameShort: "Seventh.Inv.1",

                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ]
            )

        case .fourNoteSecondInversion:
            return Voicing(
                nameEN: "Seventh Second Inversion",
                nameShort: "Seventh.Inv.2",

                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                ]
            )

        case .fourNoteThirdInversion:
            return Voicing(
                nameEN: "Seventh Third Inversion",
                nameShort: "Seventh.Inv.3",

                position: [
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ]
            )

        case .fourNoteDrop2:
            return Voicing(
                nameEN: "Drop 2ed Note",
                nameShort: "Seventh.Drop2",

                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ]
            )

        case .fourNoteDrop3:
            return Voicing(
                nameEN: "Seventh Drop 3rd Note",
                nameShort: "Seventh.Drop3",

                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ]
            )

        case .fourNoteDrop2And3:
            return Voicing(
                nameEN: "Seventh Drop 2ed&3rd Note",
                nameShort: "Seventh.Drop2&3",

                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ]
            )

        // MARK: - Shell Voicings
        case .fourNoteShellVoicingA:
            return Voicing(
                nameEN: "Shell Voicing type A",
                nameShort: "Shell",

                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ]
            )

        case .fourNoteShellVoicingB:
            return Voicing(
                nameEN: "Shell Voicing type B",
                nameShort: "Shell",

                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 1),
                ]
            )

        case .fourNoteShellVoicingA_Rootless:
            return Voicing(
                nameEN: "Rootless Shell Voicing A",
                nameShort: "Rootless Shell",

                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ]
            )

        case .fourNoteShellVoicingB_Rootless:
            return Voicing(
                nameEN: "Rootless Shell Voicing B",
                nameShort: "Rootless Shell",

                position: [
                    .init(degreeInt: 7, octaveDiff: -1),
                    .init(degreeInt: 3, octaveDiff: 0),
                ]
            )
        }
    }
}
