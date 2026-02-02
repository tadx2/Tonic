// //
// //  PentatonicMinorScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  五声小调音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Pentatonic Minor Scale Comprehensive Tests")
// struct PentatonicMinorScaleTests {

//     // MARK: - Helper Methods

//     /// 验证五声小调音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 5 个音符 (letter, accidental, pitch)
//     func verifyPentatonicMinorScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .pentatonicMinor)
//         let notes = scale.allNotes()

//         #expect(notes.count == 5)

//         for (index, expected) in expectedNotes.enumerated() {
//             let note = notes[index]
//             #expect(note.letter == expected.0,
//                    "Note \(index + 1): expected letter \(expected.0.rawValue), got \(note.letter.rawValue)")
//             #expect(note.accidental == expected.1,
//                    "Note \(index + 1): expected accidental \(expected.1), got \(note.accidental)")
//             #expect(note.pitch == expected.2,
//                    "Note \(index + 1): expected pitch \(expected.2), got \(note.pitch)")
//         }
//     }

//     // MARK: - C 音的 7 种变化

//     /// C 五声小调（C Eb F G Bb）
//     @Test("C Pentatonic Minor")
//     func testCPentatonicMinor() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, 0, 60),   // C
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.B, -1, 70)   // Bb
//         ])
//     }

//     /// C# 五声小调（C# E F# G# B）
//     @Test("C# Pentatonic Minor")
//     func testCSharpPentatonicMinor() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, 1, 61),  // C#
//             (.E, 0, 64),  // E
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.B, 0, 71)   // B
//         ])
//     }

//     /// Cb 五声小调（Cb Ebb Fb Gb Bbb）
//     @Test("Cb Pentatonic Minor")
//     func testCFlatPentatonicMinor() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.B, -2, 69)   // Bbb
//         ])
//     }

//     /// C## 五声小调（C## E# F## G## B#）
//     @Test("C## Pentatonic Minor")
//     func testCDoubleSharpPentatonicMinor() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, 2, 62),  // C##
//             (.E, 1, 65),  // E#
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.B, 1, 72)   // B#
//         ])
//     }

//     /// Cbb 五声小调（Cbb Ebbb Fbb Gbb Bbbb）
//     @Test("Cbb Pentatonic Minor")
//     func testCDoubleFlatPentatonicMinor() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.B, -3, 68)   // Bbbb
//         ])
//     }

//     /// C### 五声小调（C### E## F### G### B##）
//     @Test("C### Pentatonic Minor")
//     func testCTripleSharpPentatonicMinor() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, 3, 63),  // C###
//             (.E, 2, 66),  // E##
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.B, 2, 73)   // B##
//         ])
//     }

//     /// Cbbb 五声小调（Cbbb Ebbbb Fbbb Gbbb Bbbbb）
//     @Test("Cbbb Pentatonic Minor")
//     func testCTripleFlatPentatonicMinor() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.E, -4, 60),  // Ebbbb
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.B, -4, 67)   // Bbbbb
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 五声小调（D F G A C）
//     @Test("D Pentatonic Minor")
//     func testDPentatonicMinor() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, 0, 62),  // D
//             (.F, 0, 65),  // F
//             (.G, 0, 67),  // G
//             (.A, 0, 69),  // A
//             (.C, 0, 72)   // C
//         ])
//     }

//     /// D# 五声小调（D# F# G# A# C#）
//     @Test("D# Pentatonic Minor")
//     func testDSharpPentatonicMinor() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, 1, 63),  // D#
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.C, 1, 73)   // C#
//         ])
//     }

//     /// Db 五声小调（Db Fb Gb Ab Cb）
//     @Test("Db Pentatonic Minor")
//     func testDFlatPentatonicMinor() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.C, -1, 71)   // Cb
//         ])
//     }

//     /// D## 五声小调（D## F## G## A## C##）
//     @Test("D## Pentatonic Minor")
//     func testDDoubleSharpPentatonicMinor() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, 2, 64),  // D##
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.C, 2, 74)   // C##
//         ])
//     }

//     /// Dbb 五声小调（Dbb Fbb Gbb Abb Cbb）
//     @Test("Dbb Pentatonic Minor")
//     func testDDoubleFlatPentatonicMinor() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.C, -2, 70)   // Cbb
//         ])
//     }

//     /// D### 五声小调（D### F### G### A### C###）
//     @Test("D### Pentatonic Minor")
//     func testDTripleSharpPentatonicMinor() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, 3, 65),  // D###
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.C, 3, 75)   // C###
//         ])
//     }

//     /// Dbbb 五声小调（Dbbb Fbbb Gbbb Abbb Cbbb）
//     @Test("Dbbb Pentatonic Minor")
//     func testDTripleFlatPentatonicMinor() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.C, -3, 69)   // Cbbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 五声小调（E G A B D）
//     @Test("E Pentatonic Minor")
//     func testEPentatonicMinor() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, 0, 64),  // E
//             (.G, 0, 67),  // G
//             (.A, 0, 69),  // A
//             (.B, 0, 71),  // B
//             (.D, 0, 74)   // D
//         ])
//     }

//     /// E# 五声小调（E# G# A# B# D#）
//     @Test("E# Pentatonic Minor")
//     func testESharpPentatonicMinor() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, 1, 65),  // E#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.D, 1, 75)   // D#
//         ])
//     }

//     /// Eb 五声小调（Eb Gb Ab Bb Db）
//     @Test("Eb Pentatonic Minor")
//     func testEFlatPentatonicMinor() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.D, -1, 73)   // Db
//         ])
//     }

//     /// E## 五声小调（E## G## A## B## D##）
//     @Test("E## Pentatonic Minor")
//     func testEDoubleSharpPentatonicMinor() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, 2, 66),  // E##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.D, 2, 76)   // D##
//         ])
//     }

//     /// Ebb 五声小调（Ebb Gbb Abb Bbb Dbb）
//     @Test("Ebb Pentatonic Minor")
//     func testEDoubleFlatPentatonicMinor() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.D, -2, 72)   // Dbb
//         ])
//     }

//     /// E### 五声小调（E### G### A### B### D###）
//     @Test("E### Pentatonic Minor")
//     func testETripleSharpPentatonicMinor() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, 3, 67),  // E###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.D, 3, 77)   // D###
//         ])
//     }

//     /// Ebbb 五声小调（Ebbb Gbbb Abbb Bbbb Dbbb）
//     @Test("Ebbb Pentatonic Minor")
//     func testETripleFlatPentatonicMinor() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.D, -3, 71)   // Dbbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 五声小调（F Ab Bb C Eb）
//     @Test("F Pentatonic Minor")
//     func testFPentatonicMinor() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, 0, 65),   // F
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.E, -1, 75)   // Eb
//         ])
//     }

//     /// F# 五声小调（F# A B C# E）
//     @Test("F# Pentatonic Minor")
//     func testFSharpPentatonicMinor() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, 1, 66),  // F#
//             (.A, 0, 69),  // A
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.E, 0, 76)   // E
//         ])
//     }

//     /// Fb 五声小调（Fb Abb Bbb Cb Ebb）
//     @Test("Fb Pentatonic Minor")
//     func testFFlatPentatonicMinor() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.E, -2, 74)   // Ebb
//         ])
//     }

//     /// F## 五声小调（F## A# B# C## E#）
//     @Test("F## Pentatonic Minor")
//     func testFDoubleSharpPentatonicMinor() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, 2, 67),  // F##
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.E, 1, 77)   // E#
//         ])
//     }

//     /// Fbb 五声小调（Fbb Abbb Bbbb Cbb Ebbb）
//     @Test("Fbb Pentatonic Minor")
//     func testFDoubleFlatPentatonicMinor() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.E, -3, 73)   // Ebbb
//         ])
//     }

//     /// F### 五声小调（F### A## B## C### E##）
//     @Test("F### Pentatonic Minor")
//     func testFTripleSharpPentatonicMinor() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, 3, 68),  // F###
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.E, 2, 78)   // E##
//         ])
//     }

//     /// Fbbb 五声小调（Fbbb Abbbb Bbbbb Cbbb Ebbbb）
//     @Test("Fbbb Pentatonic Minor")
//     func testFTripleFlatPentatonicMinor() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.A, -4, 65),  // Abbbb
//             (.B, -4, 67),  // Bbbbb
//             (.C, -3, 69),  // Cbbb
//             (.E, -4, 72)   // Ebbbb
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 五声小调（G Bb C D F）
//     @Test("G Pentatonic Minor")
//     func testGPentatonicMinor() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, 0, 67),   // G
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.F, 0, 77)    // F
//         ])
//     }

//     /// G# 五声小调（G# B C# D# F#）
//     @Test("G# Pentatonic Minor")
//     func testGSharpPentatonicMinor() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, 1, 68),  // G#
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.D, 1, 75),  // D#
//             (.F, 1, 78)   // F#
//         ])
//     }

//     /// Gb 五声小调（Gb Bbb Cb Db Fb）
//     @Test("Gb Pentatonic Minor")
//     func testGFlatPentatonicMinor() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.F, -1, 76)   // Fb
//         ])
//     }

//     /// G## 五声小调（G## B# C## D## F##）
//     @Test("G## Pentatonic Minor")
//     func testGDoubleSharpPentatonicMinor() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, 2, 69),  // G##
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.D, 2, 76),  // D##
//             (.F, 2, 79)   // F##
//         ])
//     }

//     /// Gbb 五声小调（Gbb Bbbb Cbb Dbb Fbb）
//     @Test("Gbb Pentatonic Minor")
//     func testGDoubleFlatPentatonicMinor() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.F, -2, 75)   // Fbb
//         ])
//     }

//     /// G### 五声小调（G### B## C### D### F###）
//     @Test("G### Pentatonic Minor")
//     func testGTripleSharpPentatonicMinor() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, 3, 70),  // G###
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.D, 3, 77),  // D###
//             (.F, 3, 80)   // F###
//         ])
//     }

//     /// Gbbb 五声小调（Gbbb Bbbbb Cbbb Dbbb Fbbb）
//     @Test("Gbbb Pentatonic Minor")
//     func testGTripleFlatPentatonicMinor() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.B, -4, 67),  // Bbbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.F, -3, 74)   // Fbbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 五声小调（A C D E G）
//     @Test("A Pentatonic Minor")
//     func testAPentatonicMinor() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, 0, 69),  // A
//             (.C, 0, 72),  // C
//             (.D, 0, 74),  // D
//             (.E, 0, 76),  // E
//             (.G, 0, 79)   // G
//         ])
//     }

//     /// A# 五声小调（A# C# D# E# G#）
//     @Test("A# Pentatonic Minor")
//     func testASharpPentatonicMinor() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, 1, 70),  // A#
//             (.C, 1, 73),  // C#
//             (.D, 1, 75),  // D#
//             (.E, 1, 77),  // E#
//             (.G, 1, 80)   // G#
//         ])
//     }

//     /// Ab 五声小调（Ab Cb Db Eb Gb）
//     @Test("Ab Pentatonic Minor")
//     func testAFlatPentatonicMinor() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.G, -1, 78)   // Gb
//         ])
//     }

//     /// A## 五声小调（A## C## D## E## G##）
//     @Test("A## Pentatonic Minor")
//     func testADoubleSharpPentatonicMinor() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, 2, 71),  // A##
//             (.C, 2, 74),  // C##
//             (.D, 2, 76),  // D##
//             (.E, 2, 78),  // E##
//             (.G, 2, 81)   // G##
//         ])
//     }

//     /// Abb 五声小调（Abb Cbb Dbb Ebb Gbb）
//     @Test("Abb Pentatonic Minor")
//     func testADoubleFlatPentatonicMinor() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.G, -2, 77)   // Gbb
//         ])
//     }

//     /// A### 五声小调（A### C### D### E### G###）
//     @Test("A### Pentatonic Minor")
//     func testATripleSharpPentatonicMinor() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, 3, 72),  // A###
//             (.C, 3, 75),  // C###
//             (.D, 3, 77),  // D###
//             (.E, 3, 79),  // E###
//             (.G, 3, 82)   // G###
//         ])
//     }

//     /// Abbb 五声小调（Abbb Cbbb Dbbb Ebbb Gbbb）
//     @Test("Abbb Pentatonic Minor")
//     func testATripleFlatPentatonicMinor() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.G, -3, 76)   // Gbbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 五声小调（B D E F# A）
//     @Test("B Pentatonic Minor")
//     func testBPentatonicMinor() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, 0, 71),  // B
//             (.D, 0, 74),  // D
//             (.E, 0, 76),  // E
//             (.F, 1, 78),  // F#
//             (.A, 0, 81)   // A
//         ])
//     }

//     /// B# 五声小调（B# D# E# F## A#）
//     @Test("B# Pentatonic Minor")
//     func testBSharpPentatonicMinor() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, 1, 72),  // B#
//             (.D, 1, 75),  // D#
//             (.E, 1, 77),  // E#
//             (.F, 2, 79),  // F##
//             (.A, 1, 82)   // A#
//         ])
//     }

//     /// Bb 五声小调（Bb Db Eb F Ab）
//     @Test("Bb Pentatonic Minor")
//     func testBFlatPentatonicMinor() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, 0, 77),   // F
//             (.A, -1, 80)   // Ab
//         ])
//     }

//     /// B## 五声小调（B## D## E## F### A##）
//     @Test("B## Pentatonic Minor")
//     func testBDoubleSharpPentatonicMinor() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, 2, 73),  // B##
//             (.D, 2, 76),  // D##
//             (.E, 2, 78),  // E##
//             (.F, 3, 80),  // F###
//             (.A, 2, 83)   // A##
//         ])
//     }

//     /// Bbb 五声小调（Bbb Dbb Ebb Fb Abb）
//     @Test("Bbb Pentatonic Minor")
//     func testBDoubleFlatPentatonicMinor() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.A, -2, 79)   // Abb
//         ])
//     }

//     /// B### 五声小调（B### D### E### F#### A###）
//     @Test("B### Pentatonic Minor")
//     func testBTripleSharpPentatonicMinor() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, 3, 74),  // B###
//             (.D, 3, 77),  // D###
//             (.E, 3, 79),  // E###
//             (.F, 4, 81),  // F####
//             (.A, 3, 84)   // A###
//         ])
//     }

//     /// Bbbb 五声小调（Bbbb Dbbb Ebbb Fbb Abbb）
//     @Test("Bbbb Pentatonic Minor")
//     func testBTripleFlatPentatonicMinor() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyPentatonicMinorScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75),  // Fbb
//             (.A, -3, 78)   // Abbb
//         ])
//     }
// }
