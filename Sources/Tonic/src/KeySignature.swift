//
//  KeySignature.swift
//  Tonic
//
//  Created by 小汤汤 on 1/16/26.
//


public struct KeySignature {
    
    public let noteClass: NoteClass
    
    public let type: KeySignatureType // 调用的是自然大小描述
    
    public init(noteClass: NoteClass, type: KeySignatureType) {
        self.noteClass = noteClass
        self.type = type
    }
    
}

public enum KeySignatureType {
    case major, minor
}

// Description
extension KeySignature: CustomStringConvertible {
    public var description: String {
        let note = Note(letter: self.noteClass.letter, accidental: self.noteClass.accidental)
        return note.name
    }
}
