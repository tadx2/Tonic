//
//  ModalScale.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

public struct ModalScale: Hashable {
    
    public typealias ScaleClass = Int
    
    public let tonic: Note
    
    public let mode: Mode
    
    public init( _ tonic: Note = .C3, mode: Mode ) {
        self.tonic = tonic
        self.mode = mode
    }
    
}


// Note
extension ModalScale {
    
    public func getNote( scaleClass: ScaleClass ) -> Note {
        
        let intervalsCount = self.mode.intervals.count
        
        let scaleClassNormalized = (scaleClass - 1) % intervalsCount
        
        let octavePlus = (scaleClass - 1)  / intervalsCount
        
        let targetInterval = self.mode.intervals[ scaleClassNormalized ]
        
        let targetNote = self.tonic.shifted(by: targetInterval)
        
        return Note(noteClass: targetNote.noteClass, octave: targetNote.octave + octavePlus)
        
    }
    
    // 返回标准的N组音列
    public func getNoteSequence( countOctave: Int ) -> [Note] {
        
        guard countOctave > 0 else { return [] }
        
        var result: [Note] = []
        
        for targetOctave in self.tonic.octave...(self.tonic.octave + countOctave - 1) {
            
            let thisTonic = Note(noteClass: self.tonic.noteClass, octave: targetOctave)
            
            let thisModalScale = ModalScale(thisTonic, mode: self.mode)
            
            for targetScaleClass in 1...self.mode.intervals.count {
                result.append( thisModalScale.getNote( scaleClass: targetScaleClass) )
            }
            
        }
        
        return result
        
    }
    
    // 返回从几级开始的N个音列
    public func getNoteSequence( from startScaleClass: ScaleClass, count countScaleClass: Int) -> [Note] {
        
        guard countScaleClass > 0 else { return [] }
        
        let endScaleClass = startScaleClass + countScaleClass - 1
        
        var result: [Note] = []
        
        for scaleClass in startScaleClass...endScaleClass {
            result.append(self.getNote(scaleClass: scaleClass))
        }
        
        return result
    }
    
}

// Intervals
extension ModalScale {
    
    public func getIntervalsSequence(from startScaleClass: ScaleClass, count countScaleClass: Int) -> [Interval] {
        
        let noteSequence = self.getNoteSequence(from: startScaleClass, count: countScaleClass)
        
        guard let firstNote = noteSequence.first else { return [] }
        
        return noteSequence.compactMap { note in
            firstNote - note
        }
    }

}


// Description
extension ModalScale: CustomStringConvertible {
    public var description: String {
        "\(self.tonic.description) \(self.mode.description)"
    }
}
