//
//  PitchInt+Chord.swift
//
//  Created by 小汤汤 on 2025/5/2.
//

import Foundation

/// PitchString
public extension Chord {
    /// 返回**和弦内每个音**的音高与音名
    var pitchString: [PitchString] {
        noteToIntervalRaw.keys.map { note in
            let pitchInt: PitchInt = note.pitch
            let noteName = note.name
            return PitchString(pitchInt: pitchInt, noteName: noteName)
        }
    }
    
    /// 返回**根音**对应的音高与音名
    var pitchStringRnNote: PitchString {
        PitchString(pitchInt: noteRoot.pitch, noteName: noteRoot.name)
    }
}
