//
//  ChordSymbolElement.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public enum ChordSymbolElement: Hashable, CaseIterable, Sendable {
    /// note
    case C, D, E, F, G, A, B

    /// Acc
    case flat, sharp

    /// quality & sus
    case major, minor, augmented, diminished, sus, halfDiminished, alt

    /// Number
    case two, four, five, six, seven, nine, eleven, thirteen

    public var isLetter: Bool {
        switch self {
        case .C, .D, .E, .F, .G, .A, .B:
            return true
        default:
            return false
        }
    }

    public var isNumber: Bool {
        switch self {
        case .two, .four, .five, .six, .seven, .nine, .eleven, .thirteen:
            return true
        default:
            return false
        }
    }

    public var isAccidental: Bool {
        switch self {
        case .flat, .sharp:
            return true
        default:
            return false
        }
    }

    public var toString: String {
        switch self {
        case .C: "C"
        case .D: "D"
        case .E: "E"
        case .F: "F"
        case .G: "G"
        case .A: "A"
        case .B: "B"
        case .flat: "♭"
        case .sharp: "♯"
        case .major: "M"
        case .minor: "m"
        case .augmented: "aug"
        case .diminished: "dim"
        case .sus: "sus"
        case .halfDiminished: "ø"
        case .alt: "alt"
        case .two: "2"
        case .four: "4"
        case .five: "5"
        case .six: "6"
        case .seven: "7"
        case .nine: "9"
        case .eleven: "11"
        case .thirteen: "13"
        }
    }
}
