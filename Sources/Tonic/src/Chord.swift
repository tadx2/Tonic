//
//  Chord.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

import Foundation

public struct Chord {
    
    // RootNote
    public var rootNote: Note
    
    // intervals
    public var rawIntervals: [Interval] // 原始的interval
    public var finalIntervals: [Interval] { // 考虑到sus与six的情况后的interval
        var intervals = [.P1] + rawIntervals
        
        if let isSus {
            intervals.removeAll(where: { $0.degreeInt == 3 })
            intervals.append(isSus ? .M2 : .P4)
        }
        
        if isSix == true {
            intervals.removeAll(where: { $0.degreeInt == 7 })
            intervals.append(.M6)
        }
        
        return intervals
    }
    
    // Voicing
    public var voicing: Voicing?
    
    // Sus & Six 6和弦本质上是对七音的替换
    public var isSus: Bool? = nil
    public var isSix: Bool? = nil
    
    // 根据音程构造和弦
    public init(rootNote: Note = Note(), intervals: [Interval] = [.M3, .P5], voicing: Voicing? = nil, isSus: Bool? = nil, isSix: Bool? = nil) {
        self.rootNote = rootNote
        self.rawIntervals = intervals
        self.voicing = voicing
        self.isSus = isSus
        self.isSix = isSix
    }
    
    // 根据预设构造和弦
    public init(rootNote: Note = Note(), basicChordType: ChordTraidType = .major, voicing: Voicing? = nil, isSus: Bool? = nil, isSix: Bool? = nil) {
        self.rootNote = rootNote
        self.rawIntervals = basicChordType.intervals
        self.voicing = voicing
        self.isSus = isSus
        self.isSix = isSix
    }
}


extension Chord {
 
    public func getNoteAll() -> [Note: Interval] {
        var notes: [Note: Interval] = [:]
        
        if let voicing = voicing {
            for (degree, octaveDiff) in voicing.position {
                // Normalize degree to 0-6 to match 1, 8, 15... or 2, 9...
                let targetDegreeIndex = (degree - 1) % 7
                
                // Find matching interval in finalIntervals
                // We pick the last match if multiple exist to be consistent with "coverage" logic, 
                // though usually there's only one per pitch class.
                if let interval = finalIntervals.first(where: { ($0.degreeInt - 1) % 7 == targetDegreeIndex }) {
                    var note = rootNote + interval
                    note.octave += octaveDiff
                    notes[note] = interval
                }
            }
        } else {
            for interval in finalIntervals {
                let note = rootNote + interval
                notes[note] = interval
            }
        }
        
        return notes
    }
    
    // 根据 getNoteAll() 的返回数据 生成  [PitchInt: String]  PitchInt 为note 的pitch，String 为 interval的description（音程名）
    public func getPitchIntIntervalDescription() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in getNoteAll() {
            result[note.pitch] = interval.description
        }
        return result
    }
    
    // 根据 getNoteAll() 的返回数据 生成  [PitchInt: String]  PitchInt 为note 的pitch，String 为 interval的descriptionNumber（音程数字名）
    public func getPitchIntIntervalDescriptionNumber() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in getNoteAll() {
            result[note.pitch] = interval.descriptionNumber
        }
        return result
    }
    
    // 根据 getNoteAll() 的返回数据 生成  [PitchInt: String]  PitchInt 为note 的pitch，String 为 note的description（音名）
    public func getPitchIntNoteDescription() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, _) in getNoteAll() {
            result[note.pitch] = note.description
        }
        return result
    }
    
    // 返回所有 和弦note 的 pitch
    public func getPitchIntList() -> [PitchInt] {
        return getNoteAll().keys.map { $0.pitch }.sorted()
    }
    
    // 返回所有 和弦note 的 pitch(set形式)
    public func getPitchIntSet() -> Set<PitchInt> {
        return Set(getNoteAll().keys.map { $0.pitch })
    }
    
}

extension Chord {
    /// Get all available degree integers of the current chord
    public func getChordDegreeIntAll() -> [ChordDegreeInt] {
        return finalIntervals.map { $0.degreeInt }
    }

    /// Check if the voicing type can be applied to this chord
    public func canApplyVoicing(by voicingType: VoicingType) -> Bool {
        let availableDegrees = getChordDegreeIntAll()
        let voicing = voicingType.voicing
        for (degree, _) in voicing.position {
            let targetDegreeIndex = (degree - 1) % 7
            // Check if availableDegrees contains a degree matching this degree (mod 7)
            if !availableDegrees.contains(where: { ($0 - 1) % 7 == targetDegreeIndex }) {
                return false
            }
        }
        return true
    }
}
