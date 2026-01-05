import Testing
import Foundation
@testable import Tonic

@Suite("Chord Tests")
struct ChordTests {

    @Test("ChordTraidType Intervals")
    func testChordTraidTypeIntervals() {
        #expect(ChordTraidType.major.intervals == [.M3, .P5])
        #expect(ChordTraidType.majorAugFifth.intervals == [.M3, .A5])
        #expect(ChordTraidType.majorFlatFifth.intervals == [.M3, .d5])
        #expect(ChordTraidType.minor.intervals == [.m3, .P5])
        #expect(ChordTraidType.minorAugFifth.intervals == [.m3, .A5])
        #expect(ChordTraidType.minorFlatFifth.intervals == [.m3, .d5])
    }
    
    @Test("Chord Note Generation")
    func testChordNoteGeneration() {
        let rootNote = Note(letter: .C, accidental: 0, octave: 4)
        let cMajor = Chord(rootNote: rootNote, intervals: ChordTraidType.major.intervals)
        let notes = cMajor.getNoteAll()
        
        // C Major: C4, E4, G4. 
        #expect(notes.count == 3)
        
        let noteC4 = rootNote
        let noteE4 = Note(letter: .E, accidental: 0, octave: 4)
        let noteG4 = Note(letter: .G, accidental: 0, octave: 4)
        
        #expect(notes.keys.contains(noteC4))
        #expect(notes.keys.contains(noteE4))
        #expect(notes.keys.contains(noteG4))
        
        #expect(notes[noteC4] == .P1)
        #expect(notes[noteE4] == .M3)
        #expect(notes[noteG4] == .P5)
    }

    @Test("Chord Note PitchInt String Generation")
    func testChordNotePitchIntStringGeneration() {
        let rootNote = Note(letter: .C, accidental: 0, octave: 4) // Pitch 60
        let cMajor = Chord(rootNote: rootNote, intervals: ChordTraidType.major.intervals)
        let pitchIntStrings = cMajor.getPitchIntIntervalDescription()
        
        #expect(pitchIntStrings.count == 3)
        #expect(pitchIntStrings[60] == "P1")
        #expect(pitchIntStrings[64] == "M3")
        #expect(pitchIntStrings[67] == "P5")
    }

    @Test("Chord with Voicing")
    func testChordVoicing() {
        let rootNote = Note(letter: .C, accidental: 0, octave: 4) // C4
        // C Major Triad: C, E, G (1, 3, 5)
        
        // Triad First Inversion Voicing: 3, 5, 1 (+1 octave)
        // Expect: E4, G4, C5
        let voicing = VoicingType.triadFirstInversion.voicing
        let cMajorInverted = Chord(rootNote: rootNote, basicChordType: .major, voicing: voicing)
        let notes = cMajorInverted.getNoteAll()
        
        #expect(notes.count == 3)
        
        let e4 = Note(letter: .E, accidental: 0, octave: 4)
        let g4 = Note(letter: .G, accidental: 0, octave: 4)
        let c5 = Note(letter: .C, accidental: 0, octave: 5)
        
        #expect(notes[e4] != nil)
        #expect(notes[g4] != nil)
        #expect(notes[c5] != nil)
        
        #expect(notes[e4]?.description == "M3")
        #expect(notes[g4]?.description == "P5")
        #expect(notes[c5]?.description == "P1")
        
        // Check pitches
        let pitches = cMajorInverted.getPitchIntList()
        // E4=64, G4=67, C5=72
        #expect(pitches == [64, 67, 72])
    }


    @Test("Chord Names")
    func testChordNames() {
        #expect(ChordTraidType.major.cnName == "大三")
        #expect(ChordTraidType.majorAugFifth.cnName == "增三")
        #expect(ChordTraidType.minorFlatFifth.cnName == "减三")
        
        #expect(ChordTraidType.major.enName == "major triad")
        #expect(ChordTraidType.majorAugFifth.enName == "augmented triad")
        #expect(ChordTraidType.minorFlatFifth.enName == "diminished triad")
    }
}
