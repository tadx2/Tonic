//
//  Voicing.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

public struct Voicing: Hashable {
    public let shortName: String
    public let descriptionTitle: String
    public let descriptionDetail: String
    public let type: VoicingType
    public let degreeInts: Set<ChordDegreeInt>
    public let positions: Set<DegreeNotePosition>

    public init(
        shortName: String, descriptionTitle: String, descriptionDetail: String, type: VoicingType,
        position: Set<DegreeNotePosition>
    ) {
        self.shortName = shortName
        self.descriptionTitle = descriptionTitle
        self.type = type
        self.degreeInts = Set(position.map { $0.degreeInt })
        self.positions = position
        self.descriptionDetail = descriptionDetail
    }
}

extension Voicing {

    // Voicing 中传入一个和弦，获取到位置信息与Note的对应关系
    public func positionToNote(by chord: Chord) -> [DegreeNotePosition: Note] {
        var result: [DegreeNotePosition: Note] = [:]
        for position in positions {
            if let note = chord.getNote(by: position.degreeInt) {
                var adjustedNote = note
                adjustedNote.octave += position.octaveDiff
                result[position] = adjustedNote
            }
        }
        return result
    }

    // 把 Voicing 中的 position 转成 PitchInt
    public func positionToPitch(by chord: Chord) -> [DegreeNotePosition: PitchInt] {
        return positionToNote(by: chord).mapValues { $0.pitch }
    }

    // 返回所有 PitchInt拿出来组成一个
    public func allPitches(by chord: Chord) -> Set<PitchInt> {
        return Set(positionToPitch(by: chord).values)
    }

    // 由 [DegreeNotePosition: Note] 转成 [PitchInt: [DegreeNotePosition]] 因为一个音高可能对应多个位置
    // 例如A： voicing position: [ .init(degreeInt: 2, octaveDiff: 0), .init(degreeInt: 9, octaveDiff: -1)] , Chord 是一个sus2 add9和弦
    // 那么生成的 [DegreeNotePosition: Note]  中会出现两个key不同（position不同），但是Note.Pitch相同的值
    // 生成[PitchInt: [DegreeNotePosition]] 这样保证一个音高，可以拿到对应的位置
    public func pitchToPosition(by chord: Chord) -> [PitchInt: [DegreeNotePosition]] {
        var result: [PitchInt: [DegreeNotePosition]] = [:]
        for (position, note) in positionToNote(by: chord) {
            result[note.pitch, default: []].append(position)
        }
        return result
    }

    // 根据 pitchToPosition 结果进行排序 返回二维数组
    // [DegreeNotePosition] 内部按照 degreeInt 升序排序
    // 外部按照 PitchInt 升序排序（也就是 [DegreeNotePosition] 对应的key ）
    // 但是实际情况从用户层面会杜绝这个情况。在设置位置的时候，就会让用户确定，这个音是哪一个音，不会让用户设置多个音高相同的位置
    public func sortedDegreeNotePosition(by chord: Chord) -> [[DegreeNotePosition]] {
        let pitchToPos = pitchToPosition(by: chord)

        // 按 PitchInt 升序排序
        let sortedPitches = pitchToPos.keys.sorted()

        // 对每个 pitch 对应的 positions 按 degreeInt 升序排序
        return sortedPitches.map { pitch in
            pitchToPos[pitch]!.sorted { $0.degreeInt < $1.degreeInt }
        }
    }

    // sortedDegreeNotePosition 转成字符串
    // 压缩二维数据成字符串，返回 "1-（2/9）-5" 这样的形式
    public func sortedDegreeNotePositionDescription(by chord: Chord) -> String {
        let sorted = sortedDegreeNotePosition(by: chord)
        return sorted.map { positions in
            let degreeInts = positions.map { String($0.degreeInt) }.joined(separator: "/")
            // 如果 positions.count > 1 用 "/" 把元素分开，并加上括号 比如这样 "（2/9）"
            // 如果 positions.count == 1 直接返回
            if positions.count > 1 {
                return "（\(degreeInts)）"
            } else {
                return degreeInts
            }
        }.joined(separator: "-")
    }
}

extension Voicing {

    public enum VoicingType {
        case triad, triadSus2, triadSus4
        case seventh, seventhSus2, seventhSus4
        case sixth, sixthSus2, sixthSus4
        case shell
        case test
    }

    public struct DegreeNotePosition: Hashable {

        public var degreeInt: ChordDegreeInt  // 这个和弦的几音

        public var octaveDiff: Int  // 与根音的相对octave关系

        public init(degreeInt: ChordDegreeInt, octaveDiff: Int) {
            self.degreeInt = degreeInt
            self.octaveDiff = octaveDiff
        }
    }
}

public enum VoicingType: CaseIterable {

    // MARK: - Triad
    case triad_rp
    case triad_inv_1
    case triad_inv_2
    case triad_drop_2

    // MARK: - Triad - sus2
    case triad_rp_sus_2
    case triad_inv_1_sus_2
    case triad_inv_2_sus_2
    case triad_drop_2_sus_2

    // MARK: - Triad - sus4
    case triad_rp_sus_4
    case triad_inv_1_sus_4
    case triad_inv_2_sus_4
    case triad_drop_2_sus_4

    // MARK: - sevneth
    case seventh_rp
    case seventh_inv_1
    case seventh_inv_2
    case seventh_inv_3
    case seventh_drop_2
    case seventh_drop_3
    case seventh_drop_23

    // MARK: - sevneth - sus2
    case seventh_rp_sus_2
    case seventh_inv_1_sus_2
    case seventh_inv_2_sus_2
    case seventh_inv_3_sus_2
    case seventh_drop_2_sus_2
    case seventh_drop_3_sus_2
    case seventh_drop_23_sus_2

    // MARK: - sevneth - sus4
    case seventh_rp_sus_4
    case seventh_inv_1_sus_4
    case seventh_inv_2_sus_4
    case seventh_inv_3_sus_4
    case seventh_drop_2_sus_4
    case seventh_drop_3_sus_4
    case seventh_drop_23_sus_4

    // MARK: - sixth
    case sixth_rp
    case sixth_inv_1
    case sixth_inv_2
    case sixth_inv_3
    case sixth_drop_2
    case sixth_drop_3
    case sixth_drop_23

    // MARK: - sixth - sus2
    case sixth_rp_sus_2
    case sixth_inv_1_sus_2
    case sixth_inv_2_sus_2
    case sixth_inv_3_sus_2
    case sixth_drop_2_sus_2
    case sixth_drop_3_sus_2
    case sixth_drop_23_sus_2

    // MARK: - sixth - sus4
    case sixth_rp_sus_4
    case sixth_inv_1_sus_4
    case sixth_inv_2_sus_4
    case sixth_inv_3_sus_4
    case sixth_drop_2_sus_4
    case sixth_drop_3_sus_4
    case sixth_drop_23_sus_4

    // MARK: - Shell
    case shell_a
    case shell_b
    case shell_a_rootless
    case shell_b_rootless

    // MARK: - Test
    case test

    // 返回对应的 Voicing 实例
    public var voicing: Voicing {
        switch self {
        // MARK: - Triad
        case .triad_rp:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Triad Root Position",
                descriptionDetail: "A triad is in root position when the root note is the lowest note in the bass. You can also say this is the basic shape of a triad.",
                type: .triad,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ]
            )
        case .triad_inv_1:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Triad First Inversion",
                descriptionDetail: "Move the root up an octave, placing the third in the bass.",
                type: .triad,
                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ]
            )
        case .triad_inv_2:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Triad Second Inversion",
                descriptionDetail:
                    "Move the root and third up an octave, placing the fifth in the bass.",
                type: .triad,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                ]
            )
        case .triad_drop_2:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Triad Drop 2",
                descriptionDetail:
                    "Drop the second note from the top down by one octave for a more open sound. In a Drop2 chord, the '2' refers to the note that is the second highest note in the chord when it is in root position.",
                type: .triad,
                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ]
            )
        // MARK: - Triad - sus2
        case .triad_rp_sus_2:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Triad Root Position Sus2",
                descriptionDetail: "A triad in root position in which the third is replaced by a major second interval.",
                type: .triadSus2,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ])
        case .triad_inv_1_sus_2:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Triad First Inversion Sus2",
                descriptionDetail: "Move the root up an octave, placing the second chord tone in the bass.",
                type: .triadSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .triad_inv_2_sus_2:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Triad Second Inversion Sus2",
                descriptionDetail: "Move the root and second up an octave, placing the fifth in the bass.",
                type: .triadSus2,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 2, octaveDiff: 1),
                ])
        case .triad_drop_2_sus_2:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Triad Drop2 Sus2",
                descriptionDetail:
                    "Drop the second note from the top down by one octave for a more open sound. In a Drop2 chord, the '2' refers to the note that is the second highest in the chord when it is in root position. Sus2 refers to the third is replaced by a major second interval. ",
                type: .triadSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ])

        // MARK: - Triad - sus4
        case .triad_rp_sus_4:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Triad Sus4 Root Position",
                descriptionDetail: "A Sus4 triad in root position (1-4-5).",
                type: .triadSus4,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ])
        case .triad_inv_1_sus_4:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Triad Sus4 First Inversion",
                descriptionDetail: "Sus4 triad with the fourth in the bass (4-5-1).",
                type: .triadSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .triad_inv_2_sus_4:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Triad Sus4 Second Inversion",
                descriptionDetail: "Sus4 triad with the fifth in the bass (5-1-4).",
                type: .triadSus4,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 4, octaveDiff: 1),
                ])
        case .triad_drop_2_sus_4:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Triad Sus4 Drop 2",
                descriptionDetail:
                    "Open Sus4 voicing: drop the second note from the top an octave.",
                type: .triadSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                ])

        // MARK: - seventh
        case .seventh_rp:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Seventh Root Position",
                descriptionDetail: "A seventh chord in root position (1-3-5-7).",
                type: .seventh,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_inv_1:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Seventh First Inversion",
                descriptionDetail: "Seventh chord with the third in the bass (3-5-7-1).",
                type: .seventh,
                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .seventh_inv_2:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Seventh Second Inversion",
                descriptionDetail: "Seventh chord with the fifth in the bass (5-7-1-3).",
                type: .seventh,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                ])
        case .seventh_inv_3:
            return Voicing(
                shortName: "Inv.3",
                descriptionTitle: "Seventh Third Inversion",
                descriptionDetail: "Seventh chord with the seventh in the bass (7-1-3-5).",
                type: .seventh,
                position: [
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ])
        case .seventh_drop_2:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Seventh Drop 2",
                descriptionDetail:
                    "The second note from the top is dropped an octave for an open sound.",
                type: .seventh,
                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_drop_3:
            return Voicing(
                shortName: "Drop3",
                descriptionTitle: "Seventh Drop 3",
                descriptionDetail:
                    "The third note from the top is dropped an octave, often used on guitar.",
                type: .seventh,
                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_drop_23:
            return Voicing(
                shortName: "Drop2&3",
                descriptionTitle: "Seventh Drop 2 & 3",
                descriptionDetail:
                    "Both the second and third notes from the top are dropped an octave.",
                type: .seventh,
                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])

        // MARK: - seventh - sus2
        case .seventh_rp_sus_2:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Seventh Sus2 Root Position",
                descriptionDetail: "Sus2 seventh chord in root position (1-2-5-7).",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_inv_1_sus_2:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Seventh Sus2 First Inversion",
                descriptionDetail: "Sus2 seventh chord with the second in the bass (2-5-7-1).",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .seventh_inv_2_sus_2:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Seventh Sus2 Second Inversion",
                descriptionDetail: "Sus2 seventh chord with the fifth in the bass (5-7-1-2).",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 2, octaveDiff: 1),
                ])
        case .seventh_inv_3_sus_2:
            return Voicing(
                shortName: "Inv.3",
                descriptionTitle: "Seventh Sus2 Third Inversion",
                descriptionDetail: "Sus2 seventh chord with the seventh in the bass (7-1-2-5).",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 2, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ])
        case .seventh_drop_2_sus_2:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Seventh Sus2 Drop 2",
                descriptionDetail:
                    "Open Sus2 seventh voicing: second note from top dropped an octave.",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_drop_3_sus_2:
            return Voicing(
                shortName: "Drop3",
                descriptionTitle: "Seventh Sus2 Drop 3",
                descriptionDetail:
                    "Open Sus2 seventh voicing: third note from top dropped an octave.",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_drop_23_sus_2:
            return Voicing(
                shortName: "Drop2&3",
                descriptionTitle: "Seventh Sus2 Drop 2 & 3",
                descriptionDetail: "Open Sus2 seventh voicing: second and third notes dropped.",
                type: .seventhSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])

        // MARK: - seventh - sus4
        case .seventh_rp_sus_4:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Seventh Sus4 Root Position",
                descriptionDetail: "Sus4 seventh chord in root position (1-4-5-7).",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_inv_1_sus_4:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Seventh Sus4 First Inversion",
                descriptionDetail: "Sus4 seventh chord with the fourth in the bass (4-5-7-1).",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .seventh_inv_2_sus_4:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Seventh Sus4 Second Inversion",
                descriptionDetail: "Sus4 seventh chord with the fifth in the bass (5-7-1-4).",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 4, octaveDiff: 1),
                ])
        case .seventh_inv_3_sus_4:
            return Voicing(
                shortName: "Inv.3",
                descriptionTitle: "Seventh Sus4 Third Inversion",
                descriptionDetail: "Sus4 seventh chord with the seventh in the bass (7-1-4-5).",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 4, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ])
        case .seventh_drop_2_sus_4:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Seventh Sus4 Drop 2",
                descriptionDetail:
                    "Open Sus4 seventh voicing: second note from top dropped an octave.",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_drop_3_sus_4:
            return Voicing(
                shortName: "Drop3",
                descriptionTitle: "Seventh Sus4 Drop 3",
                descriptionDetail:
                    "Open Sus4 seventh voicing: third note from top dropped an octave.",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .seventh_drop_23_sus_4:
            return Voicing(
                shortName: "Drop2&3",
                descriptionTitle: "Seventh Sus4 Drop 2 & 3",
                descriptionDetail: "Open Sus4 seventh voicing: second and third notes dropped.",
                type: .seventhSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])

        // MARK: - sixth
        case .sixth_rp:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Sixth Root Position",
                descriptionDetail: "A sixth chord in root position (1-3-5-6).",
                type: .sixth,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_inv_1:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Sixth First Inversion",
                descriptionDetail: "Sixth chord with the third in the bass (3-5-6-1).",
                type: .sixth,
                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .sixth_inv_2:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Sixth Second Inversion",
                descriptionDetail: "Sixth chord with the fifth in the bass (5-6-1-3).",
                type: .sixth,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                ])
        case .sixth_inv_3:
            return Voicing(
                shortName: "Inv.3",
                descriptionTitle: "Sixth Third Inversion",
                descriptionDetail: "Sixth chord with the sixth in the bass (6-1-3-5).",
                type: .sixth,
                position: [
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 3, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ])
        case .sixth_drop_2:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Sixth Drop 2",
                descriptionDetail: "Open sixth voicing: second note from top dropped an octave.",
                type: .sixth,
                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_drop_3:
            return Voicing(
                shortName: "Drop3",
                descriptionTitle: "Sixth Drop 3",
                descriptionDetail: "Open sixth voicing: third note from top dropped an octave.",
                type: .sixth,
                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_drop_23:
            return Voicing(
                shortName: "Drop2&3",
                descriptionTitle: "Sixth Drop 2 & 3",
                descriptionDetail: "Open sixth voicing: second and third notes dropped an octave.",
                type: .sixth,
                position: [
                    .init(degreeInt: 3, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])

        // MARK: - sixth - sus2
        case .sixth_rp_sus_2:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Sixth Sus2 Root Position",
                descriptionDetail: "Sus2 sixth chord in root position (1-2-5-6).",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_inv_1_sus_2:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Sixth Sus2 First Inversion",
                descriptionDetail: "Sus2 sixth chord with the second in the bass (2-5-6-1).",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .sixth_inv_2_sus_2:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Sixth Sus2 Second Inversion",
                descriptionDetail: "Sus2 sixth chord with the fifth in the bass (5-6-1-2).",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 2, octaveDiff: 1),
                ])
        case .sixth_inv_3_sus_2:
            return Voicing(
                shortName: "Inv.3",
                descriptionTitle: "Sixth Sus2 Third Inversion",
                descriptionDetail: "Sus2 sixth chord with the sixth in the bass (6-1-2-5).",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 2, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ])
        case .sixth_drop_2_sus_2:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Sixth Sus2 Drop 2",
                descriptionDetail:
                    "Open Sus2 sixth voicing: second note from top dropped an octave.",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_drop_3_sus_2:
            return Voicing(
                shortName: "Drop3",
                descriptionTitle: "Sixth Sus2 Drop 3",
                descriptionDetail:
                    "Open Sus2 sixth voicing: third note from top dropped an octave.",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_drop_23_sus_2:
            return Voicing(
                shortName: "Drop2&3",
                descriptionTitle: "Sixth Sus2 Drop 2 & 3",
                descriptionDetail: "Open Sus2 sixth voicing: second and third notes dropped.",
                type: .sixthSus2,
                position: [
                    .init(degreeInt: 2, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])

        // MARK: - sixth - sus4
        case .sixth_rp_sus_4:
            return Voicing(
                shortName: "RP",
                descriptionTitle: "Sixth Sus4 Root Position",
                descriptionDetail: "Sus4 sixth chord in root position (1-4-5-6).",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_inv_1_sus_4:
            return Voicing(
                shortName: "Inv.1",
                descriptionTitle: "Sixth Sus4 First Inversion",
                descriptionDetail: "Sus4 sixth chord with the fourth in the bass (4-5-6-1).",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                ])
        case .sixth_inv_2_sus_4:
            return Voicing(
                shortName: "Inv.2",
                descriptionTitle: "Sixth Sus4 Second Inversion",
                descriptionDetail: "Sus4 sixth chord with the fifth in the bass (5-6-1-4).",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 4, octaveDiff: 1),
                ])
        case .sixth_inv_3_sus_4:
            return Voicing(
                shortName: "Inv.3",
                descriptionTitle: "Sixth Sus4 Third Inversion",
                descriptionDetail: "Sus4 sixth chord with the sixth in the bass (6-1-4-5).",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 6, octaveDiff: 0),
                    .init(degreeInt: 1, octaveDiff: 1),
                    .init(degreeInt: 4, octaveDiff: 1),
                    .init(degreeInt: 5, octaveDiff: 1),
                ])
        case .sixth_drop_2_sus_4:
            return Voicing(
                shortName: "Drop2",
                descriptionTitle: "Sixth Sus4 Drop 2",
                descriptionDetail:
                    "Open Sus4 sixth voicing: second note from top dropped an octave.",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 4, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_drop_3_sus_4:
            return Voicing(
                shortName: "Drop3",
                descriptionTitle: "Sixth Sus4 Drop 3",
                descriptionDetail:
                    "Open Sus4 sixth voicing: third note from top dropped an octave.",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])
        case .sixth_drop_23_sus_4:
            return Voicing(
                shortName: "Drop2&3",
                descriptionTitle: "Sixth Sus4 Drop 2 & 3",
                descriptionDetail: "Open Sus4 sixth voicing: second and third notes dropped.",
                type: .sixthSus4,
                position: [
                    .init(degreeInt: 4, octaveDiff: -1),
                    .init(degreeInt: 5, octaveDiff: -1),
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 6, octaveDiff: 0),
                ])

        // MARK: - shell
        case .shell_a:
            return Voicing(
                shortName: "Shell",
                descriptionTitle: "Shell Voicing Type A",
                descriptionDetail: "A standard shell voicing containing the root, 3rd, and 7th.",
                type: .shell,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .shell_b:
            return Voicing(
                shortName: "Shell",
                descriptionTitle: "Shell Voicing Type B",
                descriptionDetail: "Inverted shell voicing with the 7th below the 3rd.",
                type: .shell,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                    .init(degreeInt: 3, octaveDiff: 1),
                ])
        case .shell_a_rootless:
            return Voicing(
                shortName: "Rootless",
                descriptionTitle: "Rootless Shell A",
                descriptionDetail: "Guide tone voicing (3rd and 7th) without the root.",
                type: .shell,
                position: [
                    .init(degreeInt: 3, octaveDiff: 0),
                    .init(degreeInt: 7, octaveDiff: 0),
                ])
        case .shell_b_rootless:
            return Voicing(
                shortName: "Rootless",
                descriptionTitle: "Rootless Shell B",
                descriptionDetail: "Inverted guide tone voicing (7th and 3rd) without the root.",
                type: .shell,
                position: [
                    .init(degreeInt: 7, octaveDiff: -1),
                    .init(degreeInt: 3, octaveDiff: 0),
                ])

        case .test:
            return Voicing(
                shortName: "Test",
                descriptionTitle: "Test Voicing",
                descriptionDetail: "A voicing used for testing purposes (1-2-5-9).",
                type: .test,
                position: [
                    .init(degreeInt: 1, octaveDiff: 0),
                    .init(degreeInt: 2, octaveDiff: 0),
                    .init(degreeInt: 5, octaveDiff: 0),
                    .init(degreeInt: 9, octaveDiff: -1),
                ])
        }

    }
}
