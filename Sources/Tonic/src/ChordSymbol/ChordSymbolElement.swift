//
//  ChordSymbolElement.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public enum ChordSymbolElement: Hashable,CaseIterable, Sendable {

    // note
    case C, D, E, F, G, A, B
    
    // Acc
    case flat, sharp
    
    // quality & sus
    case major, minor, augmented, diminished, sus, halfDiminished, alt
    
    // Number
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

}

//case separator

