//
//  Chord.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

public struct Chord {

    // note
    public var noteRoot: Note  // 根音
    public var noteBase: Note?  // 基音

    // intervals
    // 传入进来的原始音程，已经加上了 .P1(根音)
    public var intervalsRaw: Set<Interval>  // 原始音程

    // Voicing
    public var voicingPitchIntSet: Set<PitchInt>

    // noteToInterval
    public var noteToIntervalRaw: [Note: Interval]

    // 音程构造1.
    public init(
        root: Note = Note(), intervals: Set<Interval> = [.M3, .P5],
        voicingPitchIntSet: Set<PitchInt> = [],
        base: Note? = nil
    ) {

        self.noteRoot = root
        self.noteBase = base
        self.voicingPitchIntSet = voicingPitchIntSet

        let intervalsWithRoot = intervals.union([.P1])
        self.intervalsRaw = intervalsWithRoot

        // noteToIntervalRaw
        // 原始音程与 root 的音程关系生成note
        var noteToIntervalRaw: [Note: Interval] = [:]
        for interval in intervalsWithRoot {
            let note = root + interval
            noteToIntervalRaw[note] = interval
        }
        self.noteToIntervalRaw = noteToIntervalRaw
    }

    // 音程构造2.
    public init(
        root: Note = Note(), intervals: Set<Interval> = [.M3, .P5], voicing: Voicing?,
        base: Note? = nil
    ) {
        // 直接赋值基本属性，避免重复构造 noteToIntervalRaw
        self.noteRoot = root
        self.noteBase = base

        let intervalsWithRoot = intervals.union([.P1])
        self.intervalsRaw = intervalsWithRoot

        // 构建 noteToIntervalRaw（只构建一次）
        var noteToIntervalRaw: [Note: Interval] = [:]
        // 同时构建 degreeInt -> Note 的映射，用于 voicing 计算
        var degreeToNote: [Int: Note] = [:]

        for interval in intervalsWithRoot {
            let note = root + interval
            noteToIntervalRaw[note] = interval
            degreeToNote[interval.degreeInt] = note
        }
        self.noteToIntervalRaw = noteToIntervalRaw

        // 根据 voicing 计算 voicingPitchIntSet
        // 如果 voicing 为空，直接设置为 nil；否则进行计算
        if let voicing = voicing {
            var pitchIntSet: Set<PitchInt> = []
            for position in voicing.position {
                if let note = degreeToNote[position.degreeInt] {
                    // 计算最终音高：原始音高 + 八度偏移 * 12
                    let finalPitch = note.pitch + (position.octaveDiff * 12)
                    pitchIntSet.insert(finalPitch)
                }
            }
            self.voicingPitchIntSet = pitchIntSet
        } else {
            self.voicingPitchIntSet = []
        }
    }

}

// Pitch & Degree - Set
extension Chord {

    // 原始和弦PitchIntSet
    public func getPitchIntSetRaw() -> Set<PitchInt> {
        let pitchInts = Set(noteToIntervalRaw.keys.map { $0.pitch })
        return pitchInts
    }

    // 原始和弦ChordDegreeIntSet
    public func getDegreeIntSetRaw() -> Set<ChordDegreeInt> {
        let degreeInts = Set(noteToIntervalRaw.values.map { $0.degreeInt })
        return degreeInts
    }
}

// Dict
extension Chord {

    public func getPitchIntToIntervalStrRaw() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in noteToIntervalRaw {
            result[note.pitch] = interval.description
        }
        return result
    }

    public func getPitchIntToIntervalStrNumRaw() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in noteToIntervalRaw {
            result[note.pitch] = interval.descriptionNumber
        }
        return result
    }

    public func getPitchIntToNoteNameStrRaw() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, _) in noteToIntervalRaw {
            result[note.pitch] = note.description
        }
        return result
    }

}

extension Chord {

    // 根据PitchInt获取NoteToIntervalRaw
    // 结果不唯一，因为和弦音程中可能存在多个音程的音高相同
    public func getNoteToIntervalRaw(by pitch: PitchInt) -> [Note: Interval] {
        var result: [Note: Interval] = [:]
        let targetPitchClass = pitch % 12
        for (note, interval) in noteToIntervalRaw {
            if note.pitch % 12 == targetPitchClass {
                result[note] = interval
            }
        }
        return result
    }
}

extension Chord {
    public func getAvalibleVoicing() -> [Voicing] {
        // 根据VoicingType中的所有 Voicing 的 voicingActiveDegree 匹配可以运用的 voicing
        var result: [Voicing] = []
        for voicingType in VoicingType.allCases {
            if voicingType.voicing.voicingActiveDegree.contains(where: { $0.isSubset(of: getDegreeIntSetRaw() ) }) {
                result.append(voicingType.voicing)
            }
        }
        return result
    }
}

// ChordName - Raw( 根据原始音程计算出来的和弦名)
extension Chord {

    // noteInterval 中 interval 过滤出来与 ChordBasicType 中符合条件的 name做比较找出 基本和弦名 ChordNameBasic
    private var basicInfo: ChordBasicInfo? {
        let currentIntervals = Set(intervalsRaw.filter { $0.degreeInt != 1 && $0.degreeInt <= 7 })
        return ChordTypeBasic.allCases.first { $0.info.intervals == currentIntervals }?.info
    }

    public var rawNameBasic: String? {
        guard let basicInfo else { return nil }
        return basicInfo.baseName
    }

    public var rawNameTension: [Interval] {
        // 获取到 9/11/13度的音程
        // 返回 音程对应的数字音名 注意顺序/注意唯一
        let tensions = intervalsRaw.filter { $0.degreeInt > 7 }
        return Array(Set(tensions)).sorted { $0.degreeInt < $1.degreeInt }
    }

    public var rawNameFull: String? {

        guard let rawNameBasic else { return nil }

        var name = rawNameBasic

        // TODO：简写情况
        // 情况1. ["M7", "7"] 用 [.M9, .P11, .M13]
        // 情况2. ["m7"] 用 [.M9, .P11, .m13]

        var currentTension = rawNameTension

        var shorthands: Set<Interval> = []
        if ["M7", "7", "m7"].contains(name) {
            shorthands = [.M9, .P11, .M13]
        }
//        else if ["m7"].contains(name) {
//            shorthands = [.M9, .P11, .m13]
//        }

        let foundShorthands = currentTension.filter { shorthands.contains($0) }

        if !foundShorthands.isEmpty {
            let maxShorthand = foundShorthands.max(by: { $0.degreeInt < $1.degreeInt })!
            name = String(name.dropLast()) + String(maxShorthand.degreeInt)
            currentTension.removeAll(where: { shorthands.contains($0) })
        }

        let addition = (basicInfo?.baseNameAddition ?? []) + currentTension

        if !addition.isEmpty {
            let additionStr = addition.map { $0.descriptionNumber }.joined(separator: " ")
            name += "(\(additionStr))"
        }

        if let noteBase = noteBase,
            noteBase.letter != noteRoot.letter || noteBase.accidental != noteRoot.accidental
        {
            name += "/\(noteBase.description)"
        }

        return name
    }
}
