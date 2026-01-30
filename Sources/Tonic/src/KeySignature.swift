//
//  KeySignature.swift
//  Tonic
//
//  Created by 小汤汤 on 1/16/26.
//


public struct KeySignature : Sendable, Equatable{
    let letter: Letter
    let accidental: Accidental
}

// Preset
extension KeySignature {
    public static let cMajor = KeySignature(letter: .C, accidental:  0)
}

// Description
extension KeySignature: CustomStringConvertible {
    public var description: String {
        let note = Note(letter: self.letter, accidental: self.accidental)
        return note.name
    }
}

