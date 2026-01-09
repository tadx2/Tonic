// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Chord BaseNote Tests")
// struct ChordBaseNoteTests {

//     @Test("BaseNote Octave Adjustment")
//     func testBaseNoteOctaveAdjustment() {
//         // Root: C4 (60)
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // Intervals: Major Triad (P1, M3, P5) -> C4, E4, G4. (60, 64, 67)
//         // BaseNote: C5 (72). Should become C3 (48).
//         // Why C3?
//         // minPitch is 60.
//         // baseNote (72) >= 60.
//         // 72 -> 60 (octave -= 1)
//         // 60 >= 60.
//         // 60 -> 48 (octave -= 1)
//         // 48 < 60. Stop.
//         let baseNoteHigh = Note(letter: .C, accidental: 0, octave: 5)

//         let chord = Chord(rootNote: rootNote, intervals: [.M3, .P5], baseNote: baseNoteHigh)

//         let pitches = chord.getPitchIntSet()

//         // Expected: 60, 64, 67, 48.
//         #expect(pitches.contains(48))
//         #expect(!pitches.contains(72))
//         #expect(pitches.contains(60))
//     }

//     @Test("BaseNote No Adjustment Needed")
//     func testBaseNoteNoAdjustment() {
//          // Root: C4 (60)
//          let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//          // BaseNote: B3 (59). Min is C4 (60). 59 < 60. No change.
//          let baseNoteLow = Note(letter: .B, accidental: 0, octave: 3)

//          let chord = Chord(rootNote: rootNote, intervals: [.M3, .P5], baseNote: baseNoteLow)
//          let pitches = chord.getPitchIntSet()

//          #expect(pitches.contains(59))
//          #expect(pitches.contains(60))
//     }
// }
