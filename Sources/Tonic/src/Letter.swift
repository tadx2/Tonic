//
//  Letter.swift
//  test6
//
//  Created by 小汤汤 on 2025/5/2.
//

public enum Letter: Int, Equatable, CaseIterable, Sendable {
    case C = 0
    case D, E, F, G, A, B
}

// MARK: - Class

public extension Letter {
    /// Letter 对应的 pitch级数（ 以 C 为起点）等于 semitone 半音数
    /// C=0, D=2, E=4, F=5, G=7, A=9, B=11
    var pitchClass: PitchClassInt {
        switch self {
        case .C: return 0
        case .D: return 2
        case .E: return 4
        case .F: return 5
        case .G: return 7
        case .A: return 9
        case .B: return 11
        }
    }

    /// Letter 对应的 letter自己的级数（以C为起点）
    var letterClass: LetterClassInt {
        rawValue
    }
}

// MARK: - Calculate

public extension Letter {
    /// Letter 移动几个单位后的结果，相对关系
    func shifted(by letterClassDiff: LetterClassInt) -> (
        letter: Letter, octaveDiff: Octave
    ) {
        let totalValue = rawValue + letterClassDiff
        let octaveDiff = totalValue >= 0 ? totalValue / 7 : (totalValue - 6) / 7
        let newRawValue = (totalValue % 7 + 7) % 7
        return (Letter(rawValue: newRawValue)!, octaveDiff)
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
