//
//  Solfege.swift
//  Tonic
//
//  Created by 小汤汤 on 4/9/26.
//
// 唱名，用音程关系来生成一个唱名

import Foundation

public struct Solfege: CustomStringConvertible {
    let number: Int
    let accidental: Accidental
    let octaveDiff: Int
}

public extension Solfege {
    
    /// 唱名的完整字符串表示，包含升降号与八度点。
    ///
    /// - `octaveDiff == 0`：直接显示数字唱名，如 `1`、`2♯`
    /// - `octaveDiff > 0`：在数字后追加上方八度点，如 `1̇`、`1̈`
    /// - `octaveDiff < 0`：在数字后追加下方八度点，如 `1̣`、`1̤`
    ///
    /// 当前仅支持 `-3...3` 的八度范围，超出范围时返回错误占位字符串。
    var description: String {
        let numberString = String(number)
        let accidentalString = accidental.descriptionStrict

        switch octaveDiff {
        case 0:
            return numberString + accidentalString
        case 1:
            return numberString + "\u{0307}" + accidentalString
        case 2:
            return numberString + "\u{0308}" + accidentalString
        case 3:
            return numberString + "\u{0307}\u{0307}\u{0307}" + accidentalString
        case -1:
            return numberString + "\u{0323}" + accidentalString
        case -2:
            return numberString + "\u{0324}" + accidentalString
        case -3:
            return numberString + "\u{0323}\u{0323}\u{0323}" + accidentalString
        default:
            return "Solfege Error"
        }
    }
    
    /// 不带八度信息的唱名字符串，仅包含数字唱名与升降号。
    ///
    /// 例如：`1`、`2♭`、`4𝄪`
    var descriptionNoOctaveDot: String {
        let numberString = String(number)
        let accidentalString = accidental.descriptionStrict
        return numberString + accidentalString
    }

    static func generate(by interval: Interval) -> Solfege {
        // P1 -> number: 1, accidental = 0, octaveDiff = 0
        // M2 -> number: 2, accidental = 0, octaveDiff = 0
        // m2 -> number: 2, accidental = -1, octaveDiff = 0
        // P8 -> number: 1, accidental = 0, octaveDiff = 1
        // -m2 -> number: 7, accidental = 0, octaveDiff = -1 因为距离P1 小二度的音是 下一个八度的 7音
        // -P4 -> number: 5, accidental = 0, octaveDiff = -1
        // -P5 -> number: 4, accidental = 0, octaveDiff = -1

        let degreeOffset = (interval.degreeInt - 1) * (interval.direction == .up ? 1 : -1)
        let (letter, octave) = Letter.C.shifted(by: degreeOffset)
        let targetSemitones = interval.direction == .up ? interval.semitones : -interval.semitones
        let accidental = targetSemitones - (letter.pitchClass + octave * 12)

        return Solfege(
            number: letter.letterClass + 1,
            accidental: accidental,
            octaveDiff: octave
        )
    }
}
