//
//  KeySignature.swift
//  Tonic
//
//  Created by 小汤汤 on 1/16/26.
//


public struct KeySignature : Sendable, Equatable{
    
    var noteName: NoteClass
    
    var mode: Mode.ModeType_Natural // 调用的是自然大小描述
    
    public var letter: Letter {
        get { noteName.letter }
        set { noteName = NoteClass(letter: newValue, accidental: noteName.accidental) }
    }

    public var accidental: Accidental {
        get { noteName.accidental }
        set { noteName = NoteClass(letter: noteName.letter, accidental: newValue) }
    }
    
    public init(letter: Letter, accidental: Accidental, mode: Mode.ModeType_Natural) {
        self.noteName = NoteClass(letter: letter, accidental: accidental)
        self.mode = mode
    }
    
    public init(noteName: NoteClass, mode: Mode.ModeType_Natural) {
        self.noteName = noteName
        self.mode = mode
    }
    
}

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
