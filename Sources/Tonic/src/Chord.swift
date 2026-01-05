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
//    public var intervals: Set<Interval>
    
    // Voicing
    public var voicing: Voicing?
    
    // Notes
    public var noteInterval: [Note:Interval]
    
    // 音程构造
    public init(rootNote: Note = Note(), intervals: Set<Interval> = [.M3, .P5], voicing: Voicing? = nil) {
        self.rootNote = rootNote
//        self.intervals = intervals.union([.P1])
        self.voicing = voicing
        
        
        var intervals = intervals.union([.P1])
        
        // 构成
        var noteInterval: [Note:Interval] = [:]
        if let voicing { // 存在 voicing
            
            // 如果voicing中有 2度音，意味着要去除原本的3度音，同时添加 大二度
            if (voicing.position.first(where: { $0.degreeInt == 2 }) != nil) {
                intervals = intervals.filter { $0.degreeInt != 3 }
                intervals.insert(.M2)
            }
            
            // 如果voicing中有 4度音，意味着要去除原本的3度音，同时添加 大二度
            if (voicing.position.first(where: { $0.degreeInt == 4 }) != nil) {
                intervals = intervals.filter { $0.degreeInt != 3 }
                intervals.insert(.P4)
            }
            
            // 如果voicing中有 6度音，意味着要去除原本的7度音，同时添加 大6度
            if (voicing.position.first(where: { $0.degreeInt == 6 }) != nil) {
                intervals = intervals.filter { $0.degreeInt != 7 }
                intervals.insert(.M6)
            }
            
            // 遍历 voicing.position
            for position in voicing.position {
                // intervals 中存在一个与 position 相同度数的 interval
                if let interval = intervals.first(where: { $0.degreeInt == position.degreeInt }) {
                    var note = rootNote + interval
                    note.octave += position.octaveDiff
                    noteInterval[note] = interval
                }
            }
            
        } else { // 不存在 voicing
            for interval in intervals {
                let note = rootNote + interval
                noteInterval[note] = interval
            }
        }
        self.noteInterval = noteInterval
    }
    
    // 预设构造
    public init(rootNote: Note = Note(), basicChordType: ChordTraidType = .major, voicing: Voicing? = nil) {
        self.init(rootNote: rootNote, intervals: basicChordType.intervals.union([.P1]), voicing: voicing )
    }

}

extension Chord {
    
    // 根据 intervalNotes 数据 生成  [PitchInt: String]  PitchInt 为 note 的 pitch，String 为 interval的description（音程名）
    public func getPitchIntIntervalDescription() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in noteInterval {
            result[note.pitch] = interval.description
        }
        return result
    }
    
    // 根据 intervalNotes 数据 生成  [PitchInt: String]  PitchInt 为note 的pitch，String 为 interval的descriptionNumber（音程数字名）
    public func getPitchIntIntervalDescriptionNumber() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, interval) in noteInterval {
            result[note.pitch] = interval.descriptionNumber
        }
        return result
    }
    
    // 根据 intervalNotes 数据 生成  [PitchInt: String]  PitchInt 为note 的pitch，String 为 note的 description（音名）
    public func getPitchIntNoteDescription() -> [PitchInt: String] {
        var result: [PitchInt: String] = [:]
        for (note, _) in noteInterval {
            result[note.pitch] = note.description
        }
        return result
    }
    
    // 返回所有 和弦note 的 pitch(set形式)
    public func getPitchIntSet() -> Set<PitchInt> {
        return Set(noteInterval.keys.map { $0.pitch })
    }
    
}

