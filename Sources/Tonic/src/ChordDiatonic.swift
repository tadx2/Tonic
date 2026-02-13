//
//  ChordDiatonic.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

public struct ChordDiatonic {
    
    public let tonic: Note
    
    public let modeType: any ModeType
    
    public let type: ChordDiatonicType
    
    public init(tonic: Note, modeType: any ModeType, type: ChordDiatonicType) {
        self.tonic = tonic
        self.modeType = modeType
        self.type = type
    }
}



public enum ChordDiatonicType: Hashable {
    case traid, seventh, sixth, ninth, eleventh, thirteenth
    
    var modalClasses: [ModalClass] {
        switch self {
        case .traid:
            [1, 3, 5]
        case .seventh:
            [1, 3, 5, 7]
        case .ninth:
            [1, 3, 5, 7, 9]
        case .eleventh:
            [1, 3, 5, 7, 9, 11]
        case .thirteenth:
            [1, 3, 5, 7, 9, 11, 13]
        default:
            [1, 3, 5]
        }
    }
}

extension ChordDiatonic {
    
    public typealias ChordDiatonicClass = Int
    
    public func getDiatonicChord(at: ChordDiatonicClass ) -> Chord {
        
        let modalScale = ModalScale(self.tonic, mode: self.modeType.mode)
        
        let notes = self.type.modalClasses.map { modalClass in
            modalScale.getNote(scaleClass: at + modalClass - 1)
        }
        
        let firstNote = notes.first ?? .C0
        
        let intervals = notes.compactMap { componentNote in
            firstNote - componentNote
        }
        
        return Chord(root: firstNote, intervals: Set(intervals))
    }
    
    public func getDiatonicChordSequence() -> [Chord] {
        
        let sequenceRange = 0...(self.modeType.mode.intervals.count-1)
        
        var chords: [Chord] = []
        for index in sequenceRange {
            chords.append(getDiatonicChord(at: index + 1))
        }
        
        return chords
    }
    
}
