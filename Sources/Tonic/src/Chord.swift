//
//  Chord.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

public typealias ChordDegreeInt = Int

public struct Chord: Sendable, Equatable, Hashable {
    // note
    public var noteRoot: Note // 根音
    public var noteBass: Note? // 低音

    /// intervals
    public var intervalsRaw: Set<Interval> // 原始音程 // 传入进来的原始音程，已经加上了 .P1(根音)

    /// degree
    public var degreeInts: Set<ChordDegreeInt>

    /// pitch
    public var pitchIntsRaw: Set<PitchInt>

    /// noteToInterval
    public var noteToIntervalRaw: [Note: Interval]

    /// 音程构造
    public init(
        root: Note = Note(), intervals: Set<Interval> = [.M3, .P5],
        bass: Note? = nil
    ) {
        var validatedIntervals = intervals
        let degreeInts = Set(intervals.map { $0.degreeInt })

        // 条件1. 2音/3音/4音 必须至少包含1个
//        if !(degreeInts.contains(2) || degreeInts.contains(3) || degreeInts.contains(4)) {
//            validatedIntervals = []
//        }

        // 条件2. 6音与7音不能同时存在
        if degreeInts.contains(6), degreeInts.contains(7) {
            validatedIntervals = []
        }

        // 条件3. 必须包含一个 5度音
        if !degreeInts.contains(5) {
            validatedIntervals = []
        }

        noteRoot = root
        noteBass = bass

        let intervalsWithRoot = validatedIntervals.union([.P1])

        intervalsRaw = intervalsWithRoot
        self.degreeInts = Set(intervalsWithRoot.map { $0.degreeInt })

        // noteToIntervalRaw
        // 原始音程与 root 的音程关系生成note
        var noteToIntervalRaw: [Note: Interval] = [:]
        for interval in intervalsWithRoot {
            let note = root + interval
            noteToIntervalRaw[note] = interval
        }
        self.noteToIntervalRaw = noteToIntervalRaw

        // pitchInts
        pitchIntsRaw = Set(noteToIntervalRaw.keys.map { $0.pitch })
    }
}

/// 判断和弦的类型
public extension Chord {
    var isSus2: Bool {
        return degreeInts.contains(2)
    }

    var isSus4: Bool {
        return degreeInts.contains(4)
    }

    var isSus: Bool {
        return isSus2 || isSus4
    }

    var isSixth: Bool {
        return degreeInts.contains(6)
    }

    var isSeventh: Bool {
        return degreeInts.contains(7)
    }

    var isSixthOrSeventh: Bool {
        return isSixth || isSeventh
    }

    var isTension: Bool {
        // 改成 包含 9/11/13中任何一个
        return degreeInts.contains(9) || degreeInts.contains(11) || degreeInts.contains(13)
    }
}

/// Get Note
public extension Chord {
    /// 根据度数获取音符
    func getNote(by degreeInt: ChordDegreeInt) -> Note? {
        guard let interval = intervalsRaw.first(where: { $0.degreeInt == degreeInt }) else {
            return nil
        }
        return noteRoot + interval
    }

    /// 获取到修正后的BassNote
    func getNoteBass() -> Note? {
        // metaData中要设置BassNote
        guard let noteBass else { return nil }

        // 设置的noteBass要与 noteRoot不一样（letter与accidental都不一样）
        guard (noteBass.letter != noteRoot.letter) || (noteBass.accidental != noteRoot.accidental)
        else { return nil }

        var resultNote: Note?

        // bassNote的pitch一定比 noteRoot的pitch小
        // bassNote的可能性为 octave 0-8
        // 从 octave == -1 开始试，一直试到 最大的 bassNote
        for octave in -1 ... 8 {
            let note = Note(
                letter: noteBass.letter, accidental: noteBass.accidental, octave: octave
            )
            if note.pitch < noteRoot.pitch {
                resultNote = note
            }
        }

        return resultNote
    }
}

/// Dict
public extension Chord {
    func getPitchIntToIntervalStrRaw() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in noteToIntervalRaw {
            result[note.pitch] = interval.description
        }
        return result
    }

    func getPitchIntToIntervalStrNumRaw() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in noteToIntervalRaw {
            result[note.pitch] = interval.descriptionNumber
        }
        return result
    }

    func getPitchIntToNoteNameStrRaw() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, _) in noteToIntervalRaw {
            result[note.pitch] = note.description
        }
        return result
    }
}

public extension Chord {
    /// 根据PitchInt获取NoteToIntervalRaw
    /// 结果不唯一，因为和弦音程中可能存在多个音程的音高相同
    func getNoteToIntervalRaw(by pitch: PitchInt) -> [Note: Interval] {
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

/// ChordName - Raw( 根据原始音程计算出来的和弦名)
public extension Chord {
    /// noteInterval 中 interval 过滤出来与 ChordBasicType 中符合条件的 name做比较找出 基本和弦名 ChordNameBasic
    var basicInfo: ChordBasicInfo? {
        let currentIntervals = Set(intervalsRaw.filter { $0.degreeInt != 1 && $0.degreeInt <= 7 })
        return ChordTypeBasic.allCases.first { $0.info.intervals == currentIntervals }?.info
    }

    var rawNameBasic: String? {
        guard let basicInfo else { return nil }
        return basicInfo.basicName
    }

    var rawNameTension: [Interval] {
        // 获取到 9/11/13度的音程
        // 返回 音程对应的数字音名 注意顺序/注意唯一
        let tensions = intervalsRaw.filter { $0.degreeInt > 7 }
        return Array(Set(tensions)).sorted { $0.degreeInt < $1.degreeInt }
    }

    var rawNameFull: String? {
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

        let foundShorthands = currentTension.filter { shorthands.contains($0) }

        if !foundShorthands.isEmpty {
            let maxShorthand = foundShorthands.max(by: { $0.degreeInt < $1.degreeInt })!
            name = String(name.dropLast()) + String(maxShorthand.degreeInt)
            currentTension.removeAll(where: { shorthands.contains($0) })
        }

        let addition = (basicInfo?.basicNameAddition ?? []) + currentTension

        if !addition.isEmpty {
            let additionStr = addition.map { $0.descriptionNumber }.joined(separator: " ")
            name += "(\(additionStr))"
        }

        if let noteBass = noteBass,
           noteBass.letter != noteRoot.letter || noteBass.accidental != noteRoot.accidental
        {
            name += "/\(noteBass.description)"
        }

        return name
    }

    var rawNameFullAndRootNote: String? {
        guard let rawNameFull else { return nil }
        return noteRoot.name + rawNameFull
    }
}

public extension Chord {
    static let Empty: Chord = .init(root: .C4, intervals: [])
}

/// Consider Bass Note
public extension Chord {
    var pitchIntsRawWithBassNote: Set<PitchInt> {
        guard !isBassEqualToRoot, let bassNote = getNoteBass() else { return pitchIntsRaw }
        var result = pitchIntsRaw
        result.remove(noteRoot.pitch)
        result.insert(bassNote.pitch)
        return result
    }

    var isBassEqualToRoot: Bool {
        guard let noteBass else { return true }
        return (noteBass.letter == noteRoot.letter) && (noteBass.accidental == noteRoot.accidental)
    }
}
