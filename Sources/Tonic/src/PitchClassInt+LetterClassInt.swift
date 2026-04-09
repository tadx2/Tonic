//
//  PitchClassInt+LetterClassInt.swift
//  Tonic
//
//  Created by 小汤汤 on 4/9/26.
//

import Foundation

public typealias PitchClassInt = Int
public typealias LetterClassInt = Int

/// PossibleNote
public extension PitchClassInt {
    enum PossibleNotePriority {
        case flat, sharp
    }

    func getPossibleNotes(priority: PossibleNotePriority = .flat) -> [Note] {
        let octave = self.octave
        let pitchInOctave = semitoneClass

        return switch (pitchInOctave, priority) {
        case (0, _): [
                Note(letter: .C, octave: octave),
            ]
        case (1, .flat): [
                Note(letter: .D, accidental: -1, octave: octave),
                Note(letter: .C, accidental: 1, octave: octave),
            ]
        case (1, .sharp): [
                Note(letter: .C, accidental: 1, octave: octave),
                Note(letter: .D, accidental: -1, octave: octave),
            ]
        case (2, _): [
                Note(letter: .D, octave: octave),
            ]
        case (3, .flat): [
                Note(letter: .E, accidental: -1, octave: octave),
                Note(letter: .D, accidental: 1, octave: octave),
            ]
        case (3, .sharp): [
                Note(letter: .D, accidental: 1, octave: octave),
                Note(letter: .E, accidental: -1, octave: octave),
            ]
        case (4, _): [
                Note(letter: .E, octave: octave),
            ]
        case (5, _): [
                Note(letter: .F, octave: octave),
            ]
        case (6, .flat): [
                Note(letter: .G, accidental: -1, octave: octave),
                Note(letter: .F, accidental: 1, octave: octave),
            ]
        case (6, .sharp): [
                Note(letter: .F, accidental: 1, octave: octave),
                Note(letter: .G, accidental: -1, octave: octave),
            ]
        case (7, _): [
                Note(letter: .G, octave: octave),
            ]
        case (8, .flat): [
                Note(letter: .A, accidental: -1, octave: octave),
                Note(letter: .G, accidental: 1, octave: octave),
            ]
        case (8, .sharp): [
                Note(letter: .G, accidental: 1, octave: octave),
                Note(letter: .A, accidental: -1, octave: octave),
            ]
        case (9, _): [
                Note(letter: .A, octave: octave),
            ]
        case (10, .flat): [
                Note(letter: .B, accidental: -1, octave: octave),
                Note(letter: .A, accidental: 1, octave: octave),
            ]
        case (10, .sharp): [
                Note(letter: .A, accidental: 1, octave: octave),
                Note(letter: .B, accidental: -1, octave: octave),
            ]
        case (11, _): [
                Note(letter: .B, octave: octave),
            ]
        default: []
        }
    }
}
