//
//  Voicing.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

// degree 代表用这个和弦的第几个音
// octaveDiff 代表这个音所在的octave 与 rootNote所在的octave的相对位置
public typealias VoicingPosition = [(degree: ChordDegreeInt, octaveDiff: Int)]

public struct Voicing {
    public let cnName: String // 中文名
    public let enName: String // 英文名
    public let position: VoicingPosition // 位置数据
    public let chordType: String // 哪些和弦可以用这个voicing "3th_basic" & "7th_basic"

    public init(cnName: String, enName: String, position: VoicingPosition, chordType: String) {
        self.cnName = cnName
        self.enName = enName
        self.position = position
        self.chordType = chordType
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
    case seventhDrop2And4            // 七和弦 Drop2&4: 1-5-7-3

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
                cnName: "三和弦根音位置",
                enName: "Triad Root Position",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 3, octaveDiff: 0),
                    (degree: 5, octaveDiff: 0)
                ],
                chordType: "3th_basic"
            )

        case .triadFirstInversion:
            return Voicing(
                cnName: "三和弦第一转位",
                enName: "Triad First Inversion",
                position: [
                    (degree: 3, octaveDiff: 0),
                    (degree: 5, octaveDiff: 0),
                    (degree: 1, octaveDiff: 1)
                ],
                chordType: "3th_basic"
            )

        case .triadSecondInversion:
            return Voicing(
                cnName: "三和弦第二转位",
                enName: "Triad Second Inversion",
                position: [
                    (degree: 5, octaveDiff: 0),
                    (degree: 1, octaveDiff: 1),
                    (degree: 3, octaveDiff: 1)
                ],
                chordType: "3th_basic"
            )

        case .triadDrop2:
            return Voicing(
                cnName: "三和弦Drop2",
                enName: "Triad Drop2",
                position: [
                    (degree: 3, octaveDiff: -1),
                    (degree: 1, octaveDiff: 0),
                    (degree: 5, octaveDiff: 0)
                ],
                chordType: "3th_basic"
            )

        case .triadRootlessA:
            return Voicing(
                cnName: "三和弦无根音A",
                enName: "Triad Rootless A",
                position: [
                    (degree: 3, octaveDiff: 0),
                    (degree: 5, octaveDiff: 0)
                ],
                chordType: "3th_basic"
            )

        case .triadRootlessB:
            return Voicing(
                cnName: "三和弦无根音B",
                enName: "Triad Rootless B",
                position: [
                    (degree: 5, octaveDiff: -1),
                    (degree: 3, octaveDiff: 0)
                ],
                chordType: "3th_basic"
            )

        // MARK: - 七和弦 Voicings
        case .seventhRootPosition:
            return Voicing(
                cnName: "七和弦根音位置",
                enName: "Seventh Root Position",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 3, octaveDiff: 0),
                    (degree: 5, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0)
                ],
                chordType: "7th_basic"
            )

        case .seventhFirstInversion:
            return Voicing(
                cnName: "七和弦第一转位",
                enName: "Seventh First Inversion",
                position: [
                    (degree: 3, octaveDiff: 0),
                    (degree: 5, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0),
                    (degree: 1, octaveDiff: 1)
                ],
                chordType: "7th_basic"
            )

        case .seventhSecondInversion:
            return Voicing(
                cnName: "七和弦第二转位",
                enName: "Seventh Second Inversion",
                position: [
                    (degree: 5, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0),
                    (degree: 1, octaveDiff: 1),
                    (degree: 3, octaveDiff: 1)
                ],
                chordType: "7th_basic"
            )

        case .seventhThirdInversion:
            return Voicing(
                cnName: "七和弦第三转位",
                enName: "Seventh Third Inversion",
                position: [
                    (degree: 7, octaveDiff: 0),
                    (degree: 1, octaveDiff: 1),
                    (degree: 3, octaveDiff: 1),
                    (degree: 5, octaveDiff: 1)
                ],
                chordType: "7th_basic"
            )

        case .seventhDrop2:
            return Voicing(
                cnName: "七和弦Drop2",
                enName: "Seventh Drop2",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 3, octaveDiff: 0),
                    (degree: 5, octaveDiff: -1),
                    (degree: 7, octaveDiff: 0)
                ],
                chordType: "7th_basic"
            )

        case .seventhDrop3:
            return Voicing(
                cnName: "七和弦Drop3",
                enName: "Seventh Drop3",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 3, octaveDiff: -1),
                    (degree: 5, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0)
                ],
                chordType: "7th_basic"
            )

        case .seventhDrop2And4:
            return Voicing(
                cnName: "七和弦Drop2&3",
                enName: "Seventh Drop2&3",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 3, octaveDiff: -1),
                    (degree: 5, octaveDiff: -1),
                    (degree: 7, octaveDiff: 0)
                ],
                chordType: "7th_basic"
            )

        // MARK: - Shell Voicings
        case .shellVoicingA:
            return Voicing(
                cnName: "Shell和声A型",
                enName: "Shell Voicing A",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 3, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0)
                ],
                chordType: "7th_basic"
            )

        case .shellVoicingB:
            return Voicing(
                cnName: "Shell和声B型",
                enName: "Shell Voicing B",
                position: [
                    (degree: 1, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0),
                    (degree: 3, octaveDiff: 1)
                ],
                chordType: "7th_basic"
            )

        case .shellVoicingA_Rootless:
            return Voicing(
                cnName: "无根Shell和声A型",
                enName: "Rootless Shell Voicing A",
                position: [
                    (degree: 3, octaveDiff: 0),
                    (degree: 7, octaveDiff: 0)
                ],
                chordType: "7th_basic"
            )

        case .shellVoicingB_Rootless:
            return Voicing(
                cnName: "无根Shell和声B型",
                enName: "Rootless Shell Voicing B",
                position: [
                    (degree: 3, octaveDiff: 0),
                    (degree: 7, octaveDiff: -1)
                ],
                chordType: "7th_basic"
            )

        }
    }
}
