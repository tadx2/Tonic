//
//  KeySignature.swift
//  Tonic
//
//  Created by 小汤汤 on 1/16/26.
//


public struct KeySignature : Sendable, Equatable{
    
    var noteClass: NoteClass
    
    var mode: Mode.ModeType_Natural // 调用的是自然大小描述
    
    public var letter: Letter {
        get { noteClass.letter }
        set { noteClass = NoteClass(letter: newValue, accidental: noteClass.accidental) }
    }

    public var accidental: Accidental {
        get { noteClass.accidental }
        set { noteClass = NoteClass(letter: noteClass.letter, accidental: newValue) }
    }
    
    public init(letter: Letter, accidental: Accidental, mode: Mode.ModeType_Natural) {
        self.noteClass = NoteClass(letter: letter, accidental: accidental)
        self.mode = mode
    }
    
    public init(noteClass: NoteClass, mode: Mode.ModeType_Natural) {
        self.noteClass = noteClass
        self.mode = mode
    }
    
}

// note
//extension KeySignature {
//    public noteClassList:
//}

// Preset
extension KeySignature {
    public static let cMajor = KeySignature(letter: .C, accidental:  0, mode: .major)
}

// Description
extension KeySignature: CustomStringConvertible {
    public var description: String {
        let note = Note(letter: self.letter, accidental: self.accidental)
        return note.name
    }
}
