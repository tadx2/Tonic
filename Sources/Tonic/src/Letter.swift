//
//  Letter.swift
//  Tonic
//

public enum Letter: Int, Equatable, CaseIterable, Sendable, Codable {
    case C = 0, D, E, F, G, A, B
}

// MARK: - Class

public extension Letter {
    /// 音高级数
    /// Letter 对应的 pitch级数（ 以 C 为起点）等于 semitone 半音数
    /// C=0, D=2, E=4, F=5, G=7, A=9, B=11
    var pitchClass: PitchClassInt {
        switch self {
        case .C: 0
        case .D: 2
        case .E: 4
        case .F: 5
        case .G: 7
        case .A: 9
        case .B: 11
        }
    }

    /// 音名级数
    /// Letter 对应的 letter自己的级数（以C为起点）
    var letterClass: LetterClassInt {
        rawValue
    }
}

// MARK: - Calculate

public extension Letter {
    
    /// 按音名级数移动并返回目标音名及相对八度变化。
    ///
    /// 每移动 7 个音名级数跨越一个八度；正数向上移动，负数向下移动。
    /// 例如，`B.shifted(by: 1)` 返回 `(.C, 1)`，
    /// `C.shifted(by: -1)` 返回 `(.B, -1)`。
    ///
    /// - Parameter letterClassOffset: 相对于当前音名的音名级数偏移量。
    /// - Returns: 移动后的音名，以及相对于当前音名跨越的八度数。
    func shifted(by letterClassOffset: LetterClassInt) -> (
        letter: Letter, octaveDiff: Octave
    ) {
        let (octaveDiff, letterClassRemainder) =
            letterClassOffset.quotientAndRemainder(dividingBy: 7)
        let shiftedLetterClass = rawValue + letterClassRemainder

        if shiftedLetterClass < 0 {
            return (Letter(rawValue: shiftedLetterClass + 7)!, octaveDiff - 1)
        }
        if shiftedLetterClass >= 7 {
            return (Letter(rawValue: shiftedLetterClass - 7)!, octaveDiff + 1)
        }
        return (Letter(rawValue: shiftedLetterClass)!, octaveDiff)
    }

    static func + (lhs: Letter, rhs: Int) -> Letter {
        lhs.shifted(by: rhs).letter
    }

    static func - (lhs: Letter, rhs: Int) -> Letter {
        lhs.shifted(by: -rhs).letter
    }
}

// MARK: - Description

extension Letter: CustomStringConvertible {
    public var description: String {
        switch self {
        case .C: "C"
        case .D: "D"
        case .E: "E"
        case .F: "F"
        case .G: "G"
        case .A: "A"
        case .B: "B"
        }
    }
}
