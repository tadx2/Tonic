//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

public struct Chord {
    public let chordRaw: ChordRaw
    public let voicing: Voicing?

    // voicing == nil 表示没有voicing 表示原位
    public init(chordRaw: ChordRaw, voicing: Voicing? = nil ) {
        self.chordRaw = chordRaw
        self.voicing = voicing
    }
}

extension Chord {

    /// 获取经过 voicing 过滤后的音符列表
    /// - 如果有 voicing，返回 voicing 指定的音符（包括八度调整）
    /// - 如果没有 voicing（nil），返回和弦的所有原位音符
    public var filterVoicedNote: [Note] {
        if let voicing = voicing {
            // 有 voicing，根据 voicing.position 获取指定的音符
            return voicing.position.compactMap { (degree, octaveDiff) in
                // 从 chordRaw 获取对应度数的音符
                if var note = chordRaw.getNote(by: degree) {
                    // 调整八度
                    note.octave += octaveDiff
                    return note
                }
                return nil
            }
        } else {
            // 没有 voicing，返回所有原位音符
            return chordRaw.inUsedDegreeInt.compactMap { degree in
                chordRaw.getNote(by: degree)
            }
        }
    }

    /// 获取经过 voicing 过滤后的音高集合
    public var filterVoicedPitches: Set<PitchInt> {
        Set(filterVoicedNote.map { $0.pitch })
    }

    /// 获取经过 voicing 过滤后的音程字典
    /// - Returns: 字典，键为音高，值为音程描述字符串
    public func getFilteredPitchIntervalDict() -> [PitchInt: String] {
        let notes = filterVoicedNote
        var result: [PitchInt: String] = [:]

        for note in notes {
            // 找到对应的度数
            if let degree = chordRaw.inUsedDegreeInt.first(where: { degree in
                if let dnaIndex = degree.chordDnaRawIndex,
                   let dna = chordRaw.dnaRaw[dnaIndex] {
                    return (dna + chordRaw.rootNote.pitch) % 12 == note.pitch % 12
                }
                return false
            }),
               let interval = chordRaw.getInterval(chordDegreeInt: degree) {
                result[note.pitch] = interval.description
            }
        }

        return result
    }

    /// 获取经过 voicing 过滤后的音名字典
    /// - Returns: 字典，键为音高，值为音名字符串
    public func getFilteredPitchNoteNameDict() -> [PitchInt: String] {
        let notes = filterVoicedNote
        var result: [PitchInt: String] = [:]

        for note in notes {
            result[note.pitch] = note.name
        }

        return result
    }

    /// 获取经过 voicing 过滤后的数字音名字典
    /// - Returns: 字典，键为音高，值为数字音名字符串
    public func getFilteredPitchNumberNoteNameDict() -> [PitchInt: String] {
        let notes = filterVoicedNote
        var result: [PitchInt: String] = [:]

        for note in notes {
            // 找到对应的度数
            if let degree = chordRaw.inUsedDegreeInt.first(where: { degree in
                if let dnaIndex = degree.chordDnaRawIndex,
                   let dna = chordRaw.dnaRaw[dnaIndex] {
                    return (dna + chordRaw.rootNote.pitch) % 12 == note.pitch % 12
                }
                return false
            }),
               let numberNoteName = chordRaw.getNumberNoteName(by: degree) {
                result[note.pitch] = numberNoteName
            }
        }

        return result
    }
}


// 预设
extension Chord {

    /// 和弦类型枚举
    public enum ChordBasicType: String {
        case triad   = "3th_chord"      // 三和弦
        case seventh = "7th_chord"    // 七和弦
        case sixth   = "6th_chord"      // 六和弦
    }

    /// 获取指定类型的所有和弦
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - chordClass: 和弦类型，如果为 nil 则返回所有和弦
    /// - Returns: 和弦数组
    public static func getChordList(rootNote: Note, type: ChordBasicType? = nil) -> [Chord] {
        let filteredList: [ChordBasicInfo]

        if let type {
            filteredList = ChordBasicInfoList.filter { $0.firstClass == type.rawValue }
        } else {
            filteredList = ChordBasicInfoList
        }

        return filteredList.map { basicInfo in
            // 将 DNA 填充到 10 个元素（ChordRaw 需要 10 个元素来容纳扩展音）
            var paddedDNA = basicInfo.DNA
            while paddedDNA.count < 10 {
                paddedDNA.append(nil)
            }

            let chordRaw = ChordRaw(rootNote: rootNote, dnaRaw: paddedDNA)
            return Chord(chordRaw: chordRaw)
        }
    }
}
