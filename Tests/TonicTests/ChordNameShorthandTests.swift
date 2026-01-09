// import Foundation
// import Testing

// @testable import Tonic

// @Suite("Chord Name Shorthand Tests")
// struct ChordNameShorthandTests {

//     @Test("Triad - No Shorthand")
//     func testMajorTriadNoShorthand() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C Major + M9 + P11 + m13
//         let chord = Chord(root: rootNote, intervals: [.M3, .P5, .M9, .P11, .m13])
//         // Expected: M(9 11 b13) - triads don't use shorthand now
//         #expect(chord.finalChordName == "M(9 11 ♭13)")
//     }

//     @Test("Seventh Shorthand - Major 7")
//     func testMajor7Shorthand() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C M7 + m9 + P11 + m13
//         let chord = Chord(rootNote: rootNote, intervals: [.M3, .P5, .M7, .m9, .P11, .m13])
//         // Expected: M11(b9 b13)
//         #expect(chord.finalChordName == "M11(♭9 ♭13)")
//     }

//     @Test("Seventh Shorthand - Dominant 7")
//     func testDominant7Shorthand() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C 7 + M9
//         let chord = Chord(rootNote: rootNote, intervals: [.M3, .P5, .m7, .M9])
//         // Expected: 9
//         #expect(chord.finalChordName == "9")
//     }

//     @Test("Minor Seventh Shorthand")
//     func testMinor7Shorthand() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C m7 + M9 + P11 + M13
//         let chord = Chord(rootNote: rootNote, intervals: [.m3, .P5, .m7, .M9, .P11, .M13])
//         // Expected: m11(13)
//         // Shorthands for m7 are [.M9, .P11, .m13].
//         // M9, P11 are matched. Max is P11 -> m11.
//         // M13 is NOT matched, so it remains as tension (13).
//         #expect(chord.finalChordName == "m11(13)")
//     }

//     @Test("Minor Seventh Shorthand - m13")
//     func testMinor7Shorthand_m13() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C m7 + M9 + P11 + m13
//         let chord = Chord(rootNote: rootNote, intervals: [.m3, .P5, .m7, .M9, .P11, .m13])
//         // Expected: m13
//         // Shorthands for m7 are [.M9, .P11, .m13].
//         // All matched. Max is m13 -> m13.
//         #expect(chord.finalChordName == "m13")
//     }

//     @Test("Diminished Seventh - No Shorthand")
//     func testDim7NoShorthand() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C dim7 + M9
//         let chord = Chord(rootNote: rootNote, intervals: [.m3, .d5, .d7, .M9])
//         // Expected: dim7(9)
//         #expect(chord.finalChordName == "dim7(9)")
//     }

//     @Test("No Shorthand - Tension below 9")
//     func testNoShorthand() {
//         let rootNote = Note(letter: .C, accidental: 0, octave: 4)
//         // C M7 + A11 (not P11)
//         let chord = Chord(rootNote: rootNote, intervals: [.M3, .P5, .M7, .A11])
//         // Expected: M7(#11)
//         #expect(chord.finalChordName == "M7(♯11)")
//     }
// }
