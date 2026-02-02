// //
// //  LydianScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  利底亚音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Lydian Scale Comprehensive Tests")
// struct LydianScaleTests {

//     // MARK: - Helper Methods

//     /// 验证利底亚音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
//     func verifyLydianScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .lydian)
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

//     /// C 利底亚音阶（C D E F# G A B）
//     @Test("C Lydian")
//     func testCLydian() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C,  0, 60),  // C
//             (.D,  0, 62),  // D
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71)  // B
//         ])
//     }

//     /// C# 利底亚音阶（C# D# E# F## G# A# B#）
//     @Test("C# Lydian")
//     func testCSharpLydian() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C,  1, 61),  // C#
//             (.D,  1, 63),  // D#
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72)  // B#
//         ])
//     }

//     /// Cb 利底亚音阶（Cb Db Eb F Gb Ab Bb）
//     @Test("Cb Lydian")
//     func testCFlatLydian() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70)  // Bb
//         ])
//     }

//     /// C## 利底亚音阶（C## D## E## F### G## A## B##）
//     @Test("C## Lydian")
//     func testCDoubleSharpLydian() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C,  2, 62),  // C##
//             (.D,  2, 64),  // D##
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73)  // B##
//         ])
//     }

//     /// Cbb 利底亚音阶（Cbb Dbb Ebb Fb Gbb Abb Bbb）
//     @Test("Cbb Lydian")
//     func testCDoubleFlatLydian() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69)  // Bbb
//         ])
//     }

//     /// C### 利底亚音阶（C### D### E### F G### A### B###）
//     @Test("C### Lydian")
//     func testCTripleSharpLydian() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C,  3, 63),  // C###
//             (.D,  3, 65),  // D###
//             (.E,  3, 67),  // E###
//             (.F,  4, 69),  // F
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  3, 74)  // B###
//         ])
//     }

//     /// Cbbb 利底亚音阶（Cbbb Dbbb Ebbb Fbb Gbbb Abbb Bbbb）
//     @Test("Cbbb Lydian")
//     func testCTripleFlatLydian() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68)  // Bbbb
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 利底亚音阶（D E F# G# A B C#）
//     @Test("D Lydian")
//     func testDLydian() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D,  0, 62),  // D
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73)  // C#
//         ])
//     }

//     /// D# 利底亚音阶（D# E# F## G## A# B# C##）
//     @Test("D# Lydian")
//     func testDSharpLydian() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D,  1, 63),  // D#
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74)  // C##
//         ])
//     }

//     /// Db 利底亚音阶（Db Eb F G Ab Bb C）
//     @Test("Db Lydian")
//     func testDFlatLydian() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72)  // C
//         ])
//     }

//     /// D## 利底亚音阶（D## E## F### G### A## B## C###）
//     @Test("D## Lydian")
//     func testDDoubleSharpLydian() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D,  2, 64),  // D##
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75)  // C###
//         ])
//     }

//     /// Dbb 利底亚音阶（Dbb Ebb Fb Gb Abb Bbb Cb）
//     @Test("Dbb Lydian")
//     func testDDoubleFlatLydian() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71)  // Cb
//         ])
//     }

//     /// D### 利底亚音阶（D### E### F G A### B### C）
//     @Test("D### Lydian")
//     func testDTripleSharpLydian() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D,  3, 65),  // D###
//             (.E,  3, 67),  // E###
//             (.F,  4, 69),  // F
//             (.G,  4, 71),  // G
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  4, 76)  // C
//         ])
//     }

//     /// Dbbb 利底亚音阶（Dbbb Ebbb Fbb Gbb Abbb Bbbb Cbb）
//     @Test("Dbbb Lydian")
//     func testDTripleFlatLydian() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70)  // Cbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 利底亚音阶（E F# G# A# B C# D#）
//     @Test("E Lydian")
//     func testELydian() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75)  // D#
//         ])
//     }

//     /// E# 利底亚音阶（E# F## G## A## B# C## D##）
//     @Test("E# Lydian")
//     func testESharpLydian() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76)  // D##
//         ])
//     }

//     /// Eb 利底亚音阶（Eb F G A Bb C D）
//     @Test("Eb Lydian")
//     func testEFlatLydian() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74)  // D
//         ])
//     }

//     /// E## 利底亚音阶（E## F### G### A### B## C### D###）
//     @Test("E## Lydian")
//     func testEDoubleSharpLydian() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77)  // D###
//         ])
//     }

//     /// Ebb 利底亚音阶（Ebb Fb Gb Ab Bbb Cb Db）
//     @Test("Ebb Lydian")
//     func testEDoubleFlatLydian() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73)  // Db
//         ])
//     }

//     /// E### 利底亚音阶（E### F G A B### C D）
//     @Test("E### Lydian")
//     func testETripleSharpLydian() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E,  3, 67),  // E###
//             (.F,  4, 69),  // F
//             (.G,  4, 71),  // G
//             (.A,  4, 73),  // A
//             (.B,  3, 74),  // B###
//             (.C,  4, 76),  // C
//             (.D,  4, 78)  // D
//         ])
//     }

//     /// Ebbb 利底亚音阶（Ebbb Fbb Gbb Abb Bbbb Cbb Dbb）
//     @Test("Ebbb Lydian")
//     func testETripleFlatLydian() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72)  // Dbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 利底亚音阶（F G A B C D E）
//     @Test("F Lydian")
//     func testFLydian() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E,  0, 76)  // E
//         ])
//     }

//     /// F# 利底亚音阶（F# G# A# B# C# D# E#）
//     @Test("F# Lydian")
//     func testFSharpLydian() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  1, 77)  // E#
//         ])
//     }

//     /// Fb 利底亚音阶（Fb Gb Ab Bb Cb Db Eb）
//     @Test("Fb Lydian")
//     func testFFlatLydian() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75)  // Eb
//         ])
//     }

//     /// F## 利底亚音阶（F## G## A## B## C## D## E##）
//     @Test("F## Lydian")
//     func testFDoubleSharpLydian() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  2, 78)  // E##
//         ])
//     }

//     /// Fbb 利底亚音阶（Fbb Gbb Abb Bbb Cbb Dbb Ebb）
//     @Test("Fbb Lydian")
//     func testFDoubleFlatLydian() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74)  // Ebb
//         ])
//     }

//     /// F### 利底亚音阶（F### G### A### B### C### D### E###）
//     @Test("F### Lydian")
//     func testFTripleSharpLydian() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  3, 79)  // E###
//         ])
//     }

//     /// Fbbb 利底亚音阶（Fbbb Gbbb Abbb Bbbb Cbbb Dbbb Ebbb）
//     @Test("Fbbb Lydian")
//     func testFTripleFlatLydian() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73)  // Ebbb
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 利底亚音阶（G A B C# D E F#）
//     @Test("G Lydian")
//     func testGLydian() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  1, 78)  // F#
//         ])
//     }

//     /// G# 利底亚音阶（G# A# B# C## D# E# F##）
//     @Test("G# Lydian")
//     func testGSharpLydian() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  2, 79)  // F##
//         ])
//     }

//     /// Gb 利底亚音阶（Gb Ab Bb C Db Eb F）
//     @Test("Gb Lydian")
//     func testGFlatLydian() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F,  0, 77)  // F
//         ])
//     }

//     /// G## 利底亚音阶（G## A## B## C### D## E## F###）
//     @Test("G## Lydian")
//     func testGDoubleSharpLydian() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  3, 80)  // F###
//         ])
//     }

//     /// Gbb 利底亚音阶（Gbb Abb Bbb Cb Dbb Ebb Fb）
//     @Test("Gbb Lydian")
//     func testGDoubleFlatLydian() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76)  // Fb
//         ])
//     }

//     /// G### 利底亚音阶（G### A### B### C D### E### F）
//     @Test("G### Lydian")
//     func testGTripleSharpLydian() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  4, 76),  // C
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  4, 81)  // F
//         ])
//     }

//     /// Gbbb 利底亚音阶（Gbbb Abbb Bbbb Cbb Dbbb Ebbb Fbb）
//     @Test("Gbbb Lydian")
//     func testGTripleFlatLydian() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75)  // Fbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 利底亚音阶（A B C# D# E F# G#）
//     @Test("A Lydian")
//     func testALydian() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  0, 76),  // E
//             (.F,  1, 78),  // F#
//             (.G,  1, 80)  // G#
//         ])
//     }

//     /// A# 利底亚音阶（A# B# C## D## E# F## G##）
//     @Test("A# Lydian")
//     func testASharpLydian() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  1, 77),  // E#
//             (.F,  2, 79),  // F##
//             (.G,  2, 81)  // G##
//         ])
//     }

//     /// Ab 利底亚音阶（Ab Bb C D Eb F G）
//     @Test("Ab Lydian")
//     func testAFlatLydian() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E, -1, 75),  // Eb
//             (.F,  0, 77),  // F
//             (.G,  0, 79)  // G
//         ])
//     }

//     /// A## 利底亚音阶（A## B## C### D### E## F### G###）
//     @Test("A## Lydian")
//     func testADoubleSharpLydian() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  2, 78),  // E##
//             (.F,  3, 80),  // F###
//             (.G,  3, 82)  // G###
//         ])
//     }

//     /// Abb 利底亚音阶（Abb Bbb Cb Db Ebb Fb Gb）
//     @Test("Abb Lydian")
//     func testADoubleFlatLydian() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.G, -1, 78)  // Gb
//         ])
//     }

//     /// A### 利底亚音阶（A### B### C D E### F G）
//     @Test("A### Lydian")
//     func testATripleSharpLydian() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  4, 76),  // C
//             (.D,  4, 78),  // D
//             (.E,  3, 79),  // E###
//             (.F,  4, 81),  // F
//             (.G,  4, 83)  // G
//         ])
//     }

//     /// Abbb 利底亚音阶（Abbb Bbbb Cbb Dbb Ebbb Fbb Gbb）
//     @Test("Abbb Lydian")
//     func testATripleFlatLydian() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75),  // Fbb
//             (.G, -2, 77)  // Gbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 利底亚音阶（B C# D# E# F# G# A#）
//     @Test("B Lydian")
//     func testBLydian() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  1, 78),  // F#
//             (.G,  1, 80),  // G#
//             (.A,  1, 82)  // A#
//         ])
//     }

//     /// B# 利底亚音阶（B# C## D## E## F## G## A##）
//     @Test("B# Lydian")
//     func testBSharpLydian() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  2, 79),  // F##
//             (.G,  2, 81),  // G##
//             (.A,  2, 83)  // A##
//         ])
//     }

//     /// Bb 利底亚音阶（Bb C D E F G A）
//     @Test("Bb Lydian")
//     func testBFlatLydian() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  0, 77),  // F
//             (.G,  0, 79),  // G
//             (.A,  0, 81)  // A
//         ])
//     }

//     /// B## 利底亚音阶（B## C### D### E### F### G### A###）
//     @Test("B## Lydian")
//     func testBDoubleSharpLydian() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  3, 80),  // F###
//             (.G,  3, 82),  // G###
//             (.A,  3, 84)  // A###
//         ])
//     }

//     /// Bbb 利底亚音阶（Bbb Cb Db Eb Fb Gb Ab）
//     @Test("Bbb Lydian")
//     func testBDoubleFlatLydian() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76),  // Fb
//             (.G, -1, 78),  // Gb
//             (.A, -1, 80)  // Ab
//         ])
//     }

//     /// B### 利底亚音阶（B### C D E F G A）
//     @Test("B### Lydian")
//     func testBTripleSharpLydian() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B,  3, 74),  // B###
//             (.C,  4, 76),  // C
//             (.D,  4, 78),  // D
//             (.E,  4, 80),  // E
//             (.F,  4, 81),  // F
//             (.G,  4, 83),  // G
//             (.A,  4, 85)  // A
//         ])
//     }

//     /// Bbbb 利底亚音阶（Bbbb Cbb Dbb Ebb Fbb Gbb Abb）
//     @Test("Bbbb Lydian")
//     func testBTripleFlatLydian() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyLydianScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75),  // Fbb
//             (.G, -2, 77),  // Gbb
//             (.A, -2, 79)  // Abb
//         ])
//     }

// }
