// //
// //  PhrygianScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  弗里吉亚音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Phrygian Scale Comprehensive Tests")
// struct PhrygianScaleTests {

//     // MARK: - Helper Methods

//     /// 验证弗里吉亚音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
//     func verifyPhrygianScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .phrygian)
//         let notes = scale.allNotes()

//         #expect(notes.count == 7)

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

//     /// C 弗里吉亚音阶（C Db Eb F G Ab Bb）
//     @Test("C Phrygian")
//     func testCPhrygian() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C,  0, 60),  // C
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70)  // Bb
//         ])
//     }

//     /// C# 弗里吉亚音阶（C# D E F# G# A B）
//     @Test("C# Phrygian")
//     func testCSharpPhrygian() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C,  1, 61),  // C#
//             (.D,  0, 62),  // D
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  0, 69),  // A
//             (.B,  0, 71)  // B
//         ])
//     }

//     /// Cb 弗里吉亚音阶（Cb Dbb Ebb Fb Gb Abb Bbb）
//     @Test("Cb Phrygian")
//     func testCFlatPhrygian() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69)  // Bbb
//         ])
//     }

//     /// C## 弗里吉亚音阶（C## D# E# F## G## A# B#）
//     @Test("C## Phrygian")
//     func testCDoubleSharpPhrygian() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C,  2, 62),  // C##
//             (.D,  1, 63),  // D#
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  1, 70),  // A#
//             (.B,  1, 72)  // B#
//         ])
//     }

//     /// Cbb 弗里吉亚音阶（Cbb Dbbb Ebbb Fbb Gbb Abbb Bbbb）
//     @Test("Cbb Phrygian")
//     func testCDoubleFlatPhrygian() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68)  // Bbbb
//         ])
//     }

//     /// C### 弗里吉亚音阶（C### D## E## F### G### A## B##）
//     @Test("C### Phrygian")
//     func testCTripleSharpPhrygian() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C,  3, 63),  // C###
//             (.D,  2, 64),  // D##
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  2, 71),  // A##
//             (.B,  2, 73)  // B##
//         ])
//     }

//     /// Cbbb 弗里吉亚音阶（Cbbb D E Fbbb Gbbb A B）
//     @Test("Cbbb Phrygian")
//     func testCTripleFlatPhrygian() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.D, -4, 58),  // D
//             (.E, -4, 60),  // E
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -4, 65),  // A
//             (.B, -4, 67)  // B
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 弗里吉亚音阶（D Eb F G A Bb C）
//     @Test("D Phrygian")
//     func testDPhrygian() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D,  0, 62),  // D
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72)  // C
//         ])
//     }

//     /// D# 弗里吉亚音阶（D# E F# G# A# B C#）
//     @Test("D# Phrygian")
//     func testDSharpPhrygian() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D,  1, 63),  // D#
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  0, 71),  // B
//             (.C,  1, 73)  // C#
//         ])
//     }

//     /// Db 弗里吉亚音阶（Db Ebb Fb Gb Ab Bbb Cb）
//     @Test("Db Phrygian")
//     func testDFlatPhrygian() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71)  // Cb
//         ])
//     }

//     /// D## 弗里吉亚音阶（D## E# F## G## A## B# C##）
//     @Test("D## Phrygian")
//     func testDDoubleSharpPhrygian() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D,  2, 64),  // D##
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  1, 72),  // B#
//             (.C,  2, 74)  // C##
//         ])
//     }

//     /// Dbb 弗里吉亚音阶（Dbb Ebbb Fbb Gbb Abb Bbbb Cbb）
//     @Test("Dbb Phrygian")
//     func testDDoubleFlatPhrygian() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70)  // Cbb
//         ])
//     }

//     /// D### 弗里吉亚音阶（D### E## F### G### A### B## C###）
//     @Test("D### Phrygian")
//     func testDTripleSharpPhrygian() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D,  3, 65),  // D###
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  2, 73),  // B##
//             (.C,  3, 75)  // C###
//         ])
//     }

//     /// Dbbb 弗里吉亚音阶（Dbbb E Fbbb Gbbb Abbb B Cbbb）
//     @Test("Dbbb Phrygian")
//     func testDTripleFlatPhrygian() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.E, -4, 60),  // E
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67),  // B
//             (.C, -3, 69)  // Cbbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 弗里吉亚音阶（E F G A B C D）
//     @Test("E Phrygian")
//     func testEPhrygian() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E,  0, 64),  // E
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  0, 72),  // C
//             (.D,  0, 74)  // D
//         ])
//     }

//     /// E# 弗里吉亚音阶（E# F# G# A# B# C# D#）
//     @Test("E# Phrygian")
//     func testESharpPhrygian() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E,  1, 65),  // E#
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  1, 73),  // C#
//             (.D,  1, 75)  // D#
//         ])
//     }

//     /// Eb 弗里吉亚音阶（Eb Fb Gb Ab Bb Cb Db）
//     @Test("Eb Phrygian")
//     func testEFlatPhrygian() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73)  // Db
//         ])
//     }

//     /// E## 弗里吉亚音阶（E## F## G## A## B## C## D##）
//     @Test("E## Phrygian")
//     func testEDoubleSharpPhrygian() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E,  2, 66),  // E##
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  2, 74),  // C##
//             (.D,  2, 76)  // D##
//         ])
//     }

//     /// Ebb 弗里吉亚音阶（Ebb Fbb Gbb Abb Bbb Cbb Dbb）
//     @Test("Ebb Phrygian")
//     func testEDoubleFlatPhrygian() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72)  // Dbb
//         ])
//     }

//     /// E### 弗里吉亚音阶（E### F### G### A### B### C### D###）
//     @Test("E### Phrygian")
//     func testETripleSharpPhrygian() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E,  3, 67),  // E###
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  3, 75),  // C###
//             (.D,  3, 77)  // D###
//         ])
//     }

//     /// Ebbb 弗里吉亚音阶（Ebbb Fbbb Gbbb Abbb Bbbb Cbbb Dbbb）
//     @Test("Ebbb Phrygian")
//     func testETripleFlatPhrygian() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71)  // Dbbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 弗里吉亚音阶（F Gb Ab Bb C Db Eb）
//     @Test("F Phrygian")
//     func testFPhrygian() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F,  0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.E, -1, 75)  // Eb
//         ])
//     }

//     /// F# 弗里吉亚音阶（F# G A B C# D E）
//     @Test("F# Phrygian")
//     func testFSharpPhrygian() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F,  1, 66),  // F#
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  0, 74),  // D
//             (.E,  0, 76)  // E
//         ])
//     }

//     /// Fb 弗里吉亚音阶（Fb Gbb Abb Bbb Cb Dbb Ebb）
//     @Test("Fb Phrygian")
//     func testFFlatPhrygian() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74)  // Ebb
//         ])
//     }

//     /// F## 弗里吉亚音阶（F## G# A# B# C## D# E#）
//     @Test("F## Phrygian")
//     func testFDoubleSharpPhrygian() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F,  2, 67),  // F##
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  1, 75),  // D#
//             (.E,  1, 77)  // E#
//         ])
//     }

//     /// Fbb 弗里吉亚音阶（Fbb Gbbb Abbb Bbbb Cbb Dbbb Ebbb）
//     @Test("Fbb Phrygian")
//     func testFDoubleFlatPhrygian() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73)  // Ebbb
//         ])
//     }

//     /// F### 弗里吉亚音阶（F### G## A## B## C### D## E##）
//     @Test("F### Phrygian")
//     func testFTripleSharpPhrygian() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F,  3, 68),  // F###
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  2, 76),  // D##
//             (.E,  2, 78)  // E##
//         ])
//     }

//     /// Fbbb 弗里吉亚音阶（Fbbb G A B Cbbb D E）
//     @Test("Fbbb Phrygian")
//     func testFTripleFlatPhrygian() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.G, -4, 63),  // G
//             (.A, -4, 65),  // A
//             (.B, -4, 67),  // B
//             (.C, -3, 69),  // Cbbb
//             (.D, -4, 70),  // D
//             (.E, -4, 72)  // E
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 弗里吉亚音阶（G Ab Bb C D Eb F）
//     @Test("G Phrygian")
//     func testGPhrygian() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G,  0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E, -1, 75),  // Eb
//             (.F,  0, 77)  // F
//         ])
//     }

//     /// G# 弗里吉亚音阶（G# A B C# D# E F#）
//     @Test("G# Phrygian")
//     func testGSharpPhrygian() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G,  1, 68),  // G#
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  0, 76),  // E
//             (.F,  1, 78)  // F#
//         ])
//     }

//     /// Gb 弗里吉亚音阶（Gb Abb Bbb Cb Db Ebb Fb）
//     @Test("Gb Phrygian")
//     func testGFlatPhrygian() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76)  // Fb
//         ])
//     }

//     /// G## 弗里吉亚音阶（G## A# B# C## D## E# F##）
//     @Test("G## Phrygian")
//     func testGDoubleSharpPhrygian() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G,  2, 69),  // G##
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  1, 77),  // E#
//             (.F,  2, 79)  // F##
//         ])
//     }

//     /// Gbb 弗里吉亚音阶（Gbb Abbb Bbbb Cbb Dbb Ebbb Fbb）
//     @Test("Gbb Phrygian")
//     func testGDoubleFlatPhrygian() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75)  // Fbb
//         ])
//     }

//     /// G### 弗里吉亚音阶（G### A## B## C### D### E## F###）
//     @Test("G### Phrygian")
//     func testGTripleSharpPhrygian() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G,  3, 70),  // G###
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  2, 78),  // E##
//             (.F,  3, 80)  // F###
//         ])
//     }

//     /// Gbbb 弗里吉亚音阶（Gbbb A B Cbbb Dbbb E Fbbb）
//     @Test("Gbbb Phrygian")
//     func testGTripleFlatPhrygian() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.A, -4, 65),  // A
//             (.B, -4, 67),  // B
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -4, 72),  // E
//             (.F, -3, 74)  // Fbbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 弗里吉亚音阶（A Bb C D E F G）
//     @Test("A Phrygian")
//     func testAPhrygian() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A,  0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  0, 77),  // F
//             (.G,  0, 79)  // G
//         ])
//     }

//     /// A# 弗里吉亚音阶（A# B C# D# E# F# G#）
//     @Test("A# Phrygian")
//     func testASharpPhrygian() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A,  1, 70),  // A#
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  1, 78),  // F#
//             (.G,  1, 80)  // G#
//         ])
//     }

//     /// Ab 弗里吉亚音阶（Ab Bbb Cb Db Eb Fb Gb）
//     @Test("Ab Phrygian")
//     func testAFlatPhrygian() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76),  // Fb
//             (.G, -1, 78)  // Gb
//         ])
//     }

//     /// A## 弗里吉亚音阶（A## B# C## D## E## F## G##）
//     @Test("A## Phrygian")
//     func testADoubleSharpPhrygian() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A,  2, 71),  // A##
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  2, 79),  // F##
//             (.G,  2, 81)  // G##
//         ])
//     }

//     /// Abb 弗里吉亚音阶（Abb Bbbb Cbb Dbb Ebb Fbb Gbb）
//     @Test("Abb Phrygian")
//     func testADoubleFlatPhrygian() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75),  // Fbb
//             (.G, -2, 77)  // Gbb
//         ])
//     }

//     /// A### 弗里吉亚音阶（A### B## C### D### E### F### G###）
//     @Test("A### Phrygian")
//     func testATripleSharpPhrygian() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A,  3, 72),  // A###
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  3, 80),  // F###
//             (.G,  3, 82)  // G###
//         ])
//     }

//     /// Abbb 弗里吉亚音阶（Abbb B Cbbb Dbbb Ebbb Fbbb Gbbb）
//     @Test("Abbb Phrygian")
//     func testATripleFlatPhrygian() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67),  // B
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -3, 74),  // Fbbb
//             (.G, -3, 76)  // Gbbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 弗里吉亚音阶（B C D E F# G A）
//     @Test("B Phrygian")
//     func testBPhrygian() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B,  0, 71),  // B
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  1, 78),  // F#
//             (.G,  0, 79),  // G
//             (.A,  0, 81)  // A
//         ])
//     }

//     /// B# 弗里吉亚音阶（B# C# D# E# F## G# A#）
//     @Test("B# Phrygian")
//     func testBSharpPhrygian() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B,  1, 72),  // B#
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  2, 79),  // F##
//             (.G,  1, 80),  // G#
//             (.A,  1, 82)  // A#
//         ])
//     }

//     /// Bb 弗里吉亚音阶（Bb Cb Db Eb F Gb Ab）
//     @Test("Bb Phrygian")
//     func testBFlatPhrygian() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F,  0, 77),  // F
//             (.G, -1, 78),  // Gb
//             (.A, -1, 80)  // Ab
//         ])
//     }

//     /// B## 弗里吉亚音阶（B## C## D## E## F### G## A##）
//     @Test("B## Phrygian")
//     func testBDoubleSharpPhrygian() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B,  2, 73),  // B##
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  3, 80),  // F###
//             (.G,  2, 81),  // G##
//             (.A,  2, 83)  // A##
//         ])
//     }

//     /// Bbb 弗里吉亚音阶（Bbb Cbb Dbb Ebb Fb Gbb Abb）
//     @Test("Bbb Phrygian")
//     func testBDoubleFlatPhrygian() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.G, -2, 77),  // Gbb
//             (.A, -2, 79)  // Abb
//         ])
//     }

//     /// B### 弗里吉亚音阶（B### C### D### E### F G### A###）
//     @Test("B### Phrygian")
//     func testBTripleSharpPhrygian() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B,  3, 74),  // B###
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  4, 81),  // F
//             (.G,  3, 82),  // G###
//             (.A,  3, 84)  // A###
//         ])
//     }

//     /// Bbbb 弗里吉亚音阶（Bbbb Cbbb Dbbb Ebbb Fbb Gbbb Abbb）
//     @Test("Bbbb Phrygian")
//     func testBTripleFlatPhrygian() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyPhrygianScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75),  // Fbb
//             (.G, -3, 76),  // Gbbb
//             (.A, -3, 78)  // Abbb
//         ])
//     }

// }
