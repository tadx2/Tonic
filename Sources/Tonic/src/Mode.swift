//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

// 调试内级数
typealias ModeDegreeInt = Int

public struct Mode{
    
    let tonic: NoteClass
    let type: ModeType
    
    init(tonic: NoteClass, type: ModeType) {
        self.tonic = tonic
        self.type = type
    }
    
}

extension Mode {
    
    var noteClassSeries: [(noteClass: NoteClass, octaveDiff: Octave)] {
        type.intervals.map{  tonic.shifted(by: $0) }
    }
}


// Preset
extension Mode: Sendable{
    static let cNatural_Major = Mode(tonic: NoteClass(letter: .C, accidental: 0), type: .natural(.major))
}

extension Mode {
    
    public enum ModeType: Sendable {
        
        case natural(ModeType_Natural)
        case church(ModeType_Church)

        var intervals: [Interval] {
            switch self {
            case .natural(let t): return t.intervals
            case .church(let t):  return t.intervals
            }
        }

        var displayName: String {
            switch self {
            case .natural(let t): return t.rawValue.capitalized
            case .church(let t):  return t.rawValue.capitalized
            }
        }
    }

    public enum ModeType_Natural: String, Sendable {
        case major, minor

        var intervals: [Interval] {
            switch self {
            case .major:
                return [.P1, .M2, .M3, .P4, .P5, .M6, .M7]
            case .minor:
                return [.P1, .M2, .m3, .P4, .P5, .m6, .m7]
            }
        }
    }

    public enum ModeType_Church: String, Sendable {
        case ionian, dorian, phrygian, lydian, mixolydian, aeolian, locrian

        var intervals: [Interval] {
            switch self {
            case .ionian:
                return [.P1, .M2, .M3, .P4, .P5, .M6, .M7]
            case .dorian:
                return [.P1, .M2, .m3, .P4, .P5, .M6, .m7]
            case .phrygian:
                return [.P1, .m2, .m3, .P4, .P5, .m6, .m7]
            case .lydian:
                return [.P1, .M2, .M3, .A4, .P5, .M6, .M7]   // #4 = A4
            case .mixolydian:
                return [.P1, .M2, .M3, .P4, .P5, .M6, .m7]
            case .aeolian:
                return [.P1, .M2, .m3, .P4, .P5, .m6, .m7]
            case .locrian:
                return [.P1, .m2, .m3, .P4, .d5, .m6, .m7]   // b5 = d5
            }
        }
    }
}


