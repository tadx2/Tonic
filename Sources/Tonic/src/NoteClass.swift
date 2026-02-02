//
//  NoteClass.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

// MARK: - NoteClass

/// 音名 (NoteClass)
///
/// 表示一个抽象的音名，不包含八度信息。
/// 由字母 (Letter) 和变音符号 (Accidental) 组成。
///
public struct NoteClass: Sendable {

    public var letter: Letter

    public var accidental: Accidental

    public init(letter: Letter, accidental: Accidental) {
        self.letter = letter
        self.accidental = accidental
    }
    
}

// MARK: - Class: Pitch & Letter

extension NoteClass {

    /// 音级
    ///
    /// 考虑到了 升降号
    /// C = 0, C♭ = -1, C♯/D♭ = 1, D = 2, ..., B = 11
    /// 
    public var pitchClass: PitchClassInt {
        letter.pitchClass + Int(accidental)
    }

    /// 音名等级
    ///
    /// 返回 0-6 的整数，表示音符的字母等级
    /// C=0, D=1, E=2, F=3, G=4, A=5, B=6
    ///
    public var letterClass: LetterClassInt {
        letter.rawValue
    }
    
}

// MARK: - Calculate

extension NoteClass {

    public func shifted(by interval: Interval) -> (
        noteClass: NoteClass, octaveDiff: Octave
    ) {
        
        let by = interval.direction == .up ? 1 : -1
        let shfteLetterClassInt = interval.degreeInt * by + -by
        let (targetLetter, octaveDiff) = self.letter.shifted( by: shfteLetterClassInt)

        // 这个时候只是生成一个标准的音，但是还没有确定 acc
        var targetNoteClass = NoteClass(letter: targetLetter, accidental: 0)

        // 音程对音符 造成的 pitch 的偏移, 如果向上就是相加，向下就是相减
        let targetPitchClass =
        self.pitchClass + (interval.direction == .up ? interval.semitones : -interval.semitones)

        // 此时 目标的 targetPitchClass 与 新的note 之间的 差就是需要 表示 的 acc
        let targetAccidental = targetPitchClass - ( targetNoteClass.pitchClass + octaveDiff * 12 )

        targetNoteClass.accidental = targetAccidental

        return (targetNoteClass, octaveDiff)
    }

    public static func + (lhs: NoteClass, rhs: Interval) -> NoteClass{
        lhs.shifted(by: rhs).noteClass
    }

    public static func - (lhs: NoteClass, rhs: Interval) -> NoteClass{
        lhs.shifted(by: -rhs).noteClass
    }

}


// MARK: - Hashable & Equatable

extension NoteClass: Hashable, Equatable {

    public static func == (lhs: NoteClass, rhs: NoteClass) -> Bool {
        lhs.letter == rhs.letter && lhs.accidental == rhs.accidental
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(letter)
        hasher.combine(accidental)
    }
    
}


// MARK: - Description

extension NoteClass: CustomStringConvertible {
    public var description: String {
        "\(letter)\(accidental.descriptionSimple)"
    }
}
