//
//  ModeType.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

public typealias ModalClass = Int

public protocol ModeType: Hashable{
    var mode: Mode { get }
    func modesSecondary() -> [any ModeType]
}

extension ModeType {
    public func modeSecondary(at modalClass: ModalClass) -> any ModeType {
        let modes = self.modesSecondary()
        let count = modes.count

        // 先转成 0-based index
        let zeroBased = (modalClass - 1) % count

        // 修正负数
        let normalized = (zeroBased + count) % count

        return modes[normalized]
    }
}

// MARK: -  基本调式

public enum ModeTypeMain: ModeType, CaseIterable {

    case majorNatural

    case minorNatural

    case minorHarmonic

    case minorMelodic

    case minorMelodicAscending

    case minorMelodicDescending

    public var mode: Mode {
        switch self {

        // Major
        case .majorNatural:
            Mode(
                description: "Natural Major",
                intervals: [.P1, .M2, .M3, .P4, .P5, .M6, .M7])

        // Minor
        case .minorNatural:
            Mode(
                description: "Natural Minor",
                intervals: [.P1, .M2, .m3, .P4, .P5, .m6, .m7])
        case .minorHarmonic:
            Mode(
                description: "Harmonic Minor",
                intervals: [.P1, .M2, .m3, .P4, .P5, .m6, .M7])

        case .minorMelodic:
            Mode(
                description: "Melodic Minor",
                intervals: [.P1, .M2, .m3, .P4, .P5, .M6, .M7])

        case .minorMelodicAscending:
            Mode(
                description: "Melodic Minor Ascending",
                intervals: [.P1, .M2, .m3, .P4, .P5, .M6, .M7])

        case .minorMelodicDescending:
            Mode(
                description: "Melodic Minor Descending",
                intervals: [.P1, .M2, .m3, .P4, .P5, .m6, .m7])
        }

    }

    public func modesSecondary() -> [any ModeType] {
        switch self {
        case .majorNatural:
            return [
                ModeTypeChurch.ionian,
                ModeTypeChurch.dorian,
                ModeTypeChurch.phrygian,
                ModeTypeChurch.lydian,
                ModeTypeChurch.mixolydian,
                ModeTypeChurch.aeolian,
                ModeTypeChurch.locrian,
            ]
        case .minorNatural:
            return [
                ModeTypeChurch.aeolian,
                ModeTypeChurch.locrian,
                ModeTypeChurch.ionian,
                ModeTypeChurch.dorian,
                ModeTypeChurch.phrygian,
                ModeTypeChurch.lydian,
                ModeTypeChurch.mixolydian,
            ]
        case .minorHarmonic:
            return [
                ModeTypeChurch.harmonicMinorMode,
                ModeTypeChurch.locrianNatural6,
                ModeTypeChurch.ionianAugmented,
                ModeTypeChurch.dorianSharp4,
                ModeTypeChurch.phrygianDominant,
                ModeTypeChurch.lydianSharp2,
                ModeTypeChurch.ultraLocrian,
            ]
        case .minorMelodic:
            return [
                ModeTypeChurch.melodicMinorMode,
                ModeTypeChurch.dorianFlat2,
                ModeTypeChurch.lydianAugmented,
                ModeTypeChurch.lydianDominant,
                ModeTypeChurch.mixolydianFlat6,
                ModeTypeChurch.locrianNatural2,
                ModeTypeChurch.superLocrian,
            ]
        case .minorMelodicAscending:
            return [
                ModeTypeChurch.melodicMinorMode,
                ModeTypeChurch.dorianFlat2,
                ModeTypeChurch.lydianAugmented,
                ModeTypeChurch.lydianDominant,
                ModeTypeChurch.mixolydianFlat6,
                ModeTypeChurch.locrianNatural2,
                ModeTypeChurch.superLocrian,
            ]
        case .minorMelodicDescending:
            return [
                ModeTypeChurch.aeolian,
                ModeTypeChurch.locrian,
                ModeTypeChurch.ionian,
                ModeTypeChurch.dorian,
                ModeTypeChurch.phrygian,
                ModeTypeChurch.lydian,
                ModeTypeChurch.mixolydian,
            ]
        }
    }

}

// MARK: -  教会调式

public enum ModeTypeChurch: ModeType, CaseIterable {

    // majorNatural 对应的 modes
    case ionian, dorian, phrygian, lydian, mixolydian, aeolian, locrian

    // minorNatural 对应的 modes (与 majorNatural 相同，只是起始位置不同)
    // 复用 aeolian, locrian, ionian, dorian, phrygian, lydian, mixolydian

    // minorHarmonic 对应的 modes
    case harmonicMinorMode, locrianNatural6, ionianAugmented, dorianSharp4, phrygianDominant,
        lydianSharp2, ultraLocrian

    // minorMelodic / minorMelodicAscending 对应的 modes
    case melodicMinorMode, dorianFlat2, lydianAugmented, lydianDominant, mixolydianFlat6,
        locrianNatural2, superLocrian

    // minorMelodicDescending 对应的 modes (与 minorNatural 相同)
    // 复用 aeolian, locrian, ionian, dorian, phrygian, lydian, mixolydian

    public var mode: Mode {
        switch self {

        // majorNatural (Church Modes)
        case .ionian:
            Mode(
                description: "Ionian",
                intervals: [.P1, .M2, .M3, .P4, .P5, .M6, .M7])
        case .dorian:
            Mode(
                description: "Dorian",
                intervals: [.P1, .M2, .m3, .P4, .P5, .M6, .m7])
        case .phrygian:
            Mode(
                description: "Phrygian",
                intervals: [.P1, .m2, .m3, .P4, .P5, .m6, .m7])
        case .lydian:
            Mode(
                description: "Lydian",
                intervals: [.P1, .M2, .M3, .A4, .P5, .M6, .M7])
        case .mixolydian:
            Mode(
                description: "Mixolydian",
                intervals: [.P1, .M2, .M3, .P4, .P5, .M6, .m7])
        case .aeolian:
            Mode(
                description: "Aeolian",
                intervals: [.P1, .M2, .m3, .P4, .P5, .m6, .m7])
        case .locrian:
            Mode(
                description: "Locrian",
                intervals: [.P1, .m2, .m3, .P4, .d5, .m6, .m7])

        // minorHarmonic Modes
        case .harmonicMinorMode:
            Mode(
                description: "Harmonic Minor",
                intervals: [.P1, .M2, .m3, .P4, .P5, .m6, .M7])
        case .locrianNatural6:
            Mode(
                description: "Locrian ♮6",
                intervals: [.P1, .m2, .m3, .P4, .d5, .M6, .m7])
        case .ionianAugmented:
            Mode(
                description: "Ionian Augmented",
                intervals: [.P1, .M2, .M3, .P4, .A5, .M6, .M7])
        case .dorianSharp4:
            Mode(
                description: "Dorian #4",
                intervals: [.P1, .M2, .m3, .A4, .P5, .M6, .m7])
        case .phrygianDominant:
            Mode(
                description: "Phrygian Dominant",
                intervals: [.P1, .m2, .M3, .P4, .P5, .m6, .m7])
        case .lydianSharp2:
            Mode(
                description: "Lydian #2",
                intervals: [.P1, .A2, .M3, .A4, .P5, .M6, .M7])
        case .ultraLocrian:
            Mode(
                description: "Ultra Locrian",
                intervals: [.P1, .m2, .m3, .d4, .d5, .m6, .d7])

        // minorMelodic Modes
        case .melodicMinorMode:
            Mode(
                description: "Melodic Minor",
                intervals: [.P1, .M2, .m3, .P4, .P5, .M6, .M7])
        case .dorianFlat2:
            Mode(
                description: "Dorian ♭2",
                intervals: [.P1, .m2, .m3, .P4, .P5, .M6, .m7])
        case .lydianAugmented:
            Mode(
                description: "Lydian Augmented",
                intervals: [.P1, .M2, .M3, .A4, .A5, .M6, .M7])
        case .lydianDominant:
            Mode(
                description: "Lydian Dominant",
                intervals: [.P1, .M2, .M3, .A4, .P5, .M6, .m7])
        case .mixolydianFlat6:
            Mode(
                description: "Mixolydian ♭6",
                intervals: [.P1, .M2, .M3, .P4, .P5, .m6, .m7])
        case .locrianNatural2:
            Mode(
                description: "Locrian ♮2",
                intervals: [.P1, .M2, .m3, .P4, .d5, .m6, .m7])
        case .superLocrian:
            Mode(
                description: "Super Locrian",
                intervals: [.P1, .m2, .m3, .d4, .d5, .m6, .m7])
        }
    }

    /// 返回该 mode 所属的父调式的所有 modes，从当前 mode 开始排列
    public func modesSecondary() -> [any ModeType] {
        let all = parentModeTypeMain.modesSecondary()
        let offset = modalClass - 1  // 转 0-based
        return Array(all[offset...]) + Array(all[..<offset])
    }

    /// 该 church mode 在其父调式中的级数 (1-based)
    public var modalClass: ModalClass {
        switch self {
        case .ionian, .harmonicMinorMode, .melodicMinorMode: return 1
        case .dorian, .locrianNatural6, .dorianFlat2: return 2
        case .phrygian, .ionianAugmented, .lydianAugmented: return 3
        case .lydian, .dorianSharp4, .lydianDominant: return 4
        case .mixolydian, .phrygianDominant, .mixolydianFlat6: return 5
        case .aeolian, .lydianSharp2, .locrianNatural2: return 6
        case .locrian, .ultraLocrian, .superLocrian: return 7
        }
    }

    /// 该 church mode 所属的父调式
    public var parentModeTypeMain: ModeTypeMain {
        switch self {
        // majorNatural / minorNatural / minorMelodicDescending 共用
        case .ionian, .dorian, .phrygian, .lydian, .mixolydian, .aeolian, .locrian:
            return .majorNatural
        // minorHarmonic
        case .harmonicMinorMode, .locrianNatural6, .ionianAugmented, .dorianSharp4,
            .phrygianDominant, .lydianSharp2, .ultraLocrian:
            return .minorHarmonic
        // minorMelodic / minorMelodicAscending
        case .melodicMinorMode, .dorianFlat2, .lydianAugmented, .lydianDominant, .mixolydianFlat6,
            .locrianNatural2, .superLocrian:
            return .minorMelodic
        }
    }

}
