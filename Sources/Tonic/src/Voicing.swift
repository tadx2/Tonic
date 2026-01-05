//
//  Voicing.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

// degreeInt 代表用这个和弦的第几个音
// octaveDiff 代表这个音所在的octave 与 rootNote所在的octave的相对位置
public typealias VoicingPosition = [(degreeInt: ChordDegreeInt, octaveDiff: Int)]

public struct Voicing: Equatable {
    public let name: String // 英文名
    public let position: VoicingPosition // 位置数据

    public init(name: String, position: VoicingPosition) {
        self.name = name
        self.position = position
    }

    public static func == (lhs: Voicing, rhs: Voicing) -> Bool {
        guard lhs.name == rhs.name, lhs.position.count == rhs.position.count else { return false }
        for (left, right) in zip(lhs.position, rhs.position) {
            if left.degreeInt != right.degreeInt || left.octaveDiff != right.octaveDiff {
                return false
            }
        }
        return true
    }

    /// 返回排序后的度数序列。
    /// 排序规则：首先比较 octaveDiff，如果相同则比较 degreeInt，均从小到大排列。
    public var sortedPosition: [ChordDegreeInt] {
        position.sorted {
            if $0.octaveDiff != $1.octaveDiff {
                return $0.octaveDiff < $1.octaveDiff
            }
            return $0.degreeInt < $1.degreeInt
        }.map { $0.degreeInt }
    }
}

// MARK: - VoicingType 枚举
public enum VoicingType: CaseIterable {
    // MARK: - 三和弦 Voicings (Triad Voicings)
    case triadRootPosition           // 三和弦根音位置 (密集排列): 1-3-5
    case triadFirstInversion         // 三和弦第一转位 (密集排列): 3-5-1
    case triadSecondInversion        // 三和弦第二转位 (密集排列): 5-1-3
    case triadDrop2                  // 三和弦 Drop2 (开放排列): 3-1-5
    case triadRootlessA              // 三和弦无根音 (只有三音和五音): 3-5
    case triadRootlessB              // 三和弦无根音 (只有三音和五音): 5-3

    // MARK: - 七和弦 Voicings (Seventh Chord Voicings)
    case seventhRootPosition         // 七和弦根音位置 (密集排列): 1-3-5-7
    case seventhFirstInversion       // 七和弦第一转位 (密集排列): 3-5-7-1
    case seventhSecondInversion      // 七和弦第二转位 (密集排列): 5-7-1-3
    case seventhThirdInversion       // 七和弦第三转位 (密集排列): 7-1-3-5
    case seventhDrop2                // 七和弦 Drop2: 5-1-3-7
    case seventhDrop3                // 七和弦 Drop3: 3-1-5-7
    case seventhDrop2And3            // 七和弦 Drop2&4: 1-5-7-3

    // MARK: - Shell Voicings (3-7 Voicings)
    case shellVoicingA               // Shell Voicing A型: 1-3-7 (根音位置)
    case shellVoicingB               // Shell Voicing B型: 1-7-3 (三音在上方八度)
    case shellVoicingA_Rootless      // Rootless Shell Voicing A型: 3-7
    case shellVoicingB_Rootless      // Rootless Shell Voicing B型: 7-3 (三音在上方八度)

    // 返回对应的 Voicing 实例
    public var voicing: Voicing {
        switch self {
        // MARK: - 三和弦 Voicings
        case .triadRootPosition:
            return Voicing(
                name: "Triad Root Position",
                position: [
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0)
                ]
            )

        case .triadFirstInversion:
            return Voicing(
                name: "Triad First Inversion",
                position: [
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0),
                    (degreeInt: 1, octaveDiff: 1)
                ]
            )

        case .triadSecondInversion:
            return Voicing(
                name: "Triad Second Inversion",
                position: [
                    (degreeInt: 5, octaveDiff: 0),
                    (degreeInt: 1, octaveDiff: 1),
                    (degreeInt: 3, octaveDiff: 1)
                ]
            )

        case .triadDrop2:
            return Voicing(
                name: "Triad Drop 2",
                position: [
                    (degreeInt: 3, octaveDiff: -1),
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0)
                ]
            )

        case .triadRootlessA:
            return Voicing(
                name: "Triad Rootless A",
                position: [
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0)
                ]
            )

        case .triadRootlessB:
            return Voicing(
                name: "Triad Rootless B",
                position: [
                    (degreeInt: 5, octaveDiff: -1),
                    (degreeInt: 3, octaveDiff: 0)
                ]
            )

        // MARK: - 七和弦 Voicings
        case .seventhRootPosition:
            return Voicing(
                name: "Seventh Root Position",
                position: [
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0)
                ]
            )

        case .seventhFirstInversion:
            return Voicing(
                name: "Seventh First Inversion",
                position: [
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0),
                    (degreeInt: 1, octaveDiff: 1)
                ]
            )

        case .seventhSecondInversion:
            return Voicing(
                name: "Seventh Second Inversion",
                position: [
                    (degreeInt: 5, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0),
                    (degreeInt: 1, octaveDiff: 1),
                    (degreeInt: 3, octaveDiff: 1)
                ]
            )

        case .seventhThirdInversion:
            return Voicing(
                name: "Seventh Third Inversion",
                position: [
                    (degreeInt: 7, octaveDiff: 0),
                    (degreeInt: 1, octaveDiff: 1),
                    (degreeInt: 3, octaveDiff: 1),
                    (degreeInt: 5, octaveDiff: 1)
                ]
            )

        case .seventhDrop2:
            return Voicing(
                name: "Seventh Drop 2",
                position: [
                    (degreeInt: 5, octaveDiff: -1),
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0)
                ]
            )

        case .seventhDrop3:
            return Voicing(
                name: "Seventh Drop 3",
                position: [
                    (degreeInt: 3, octaveDiff: -1),
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 5, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0)
                ]
            )

        case .seventhDrop2And3:
            return Voicing(
                name: "Seventh Drop 2&3",
                position: [
                    (degreeInt: 3, octaveDiff: -1),
                    (degreeInt: 5, octaveDiff: -1),
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0)
                ]
            )

        // MARK: - Shell Voicings
        case .shellVoicingA:
            return Voicing(
                name: "Shell Voicing A",
                position: [
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0)
                ]
            )

        case .shellVoicingB:
            return Voicing(
                name: "Shell Voicing B",
                position: [
                    (degreeInt: 1, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0),
                    (degreeInt: 3, octaveDiff: 1)
                ]
            )

        case .shellVoicingA_Rootless:
            return Voicing(
                name: "Rootless Shell Voicing A",
                position: [
                    (degreeInt: 3, octaveDiff: 0),
                    (degreeInt: 7, octaveDiff: 0)
                ]
            )

        case .shellVoicingB_Rootless:
            return Voicing(
                name: "Rootless Shell Voicing B",
                position: [
                    (degreeInt: 7, octaveDiff: -1),
                    (degreeInt: 3, octaveDiff: 0)
                ]
            )
        }
    }
}
