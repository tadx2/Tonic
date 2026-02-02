// //
// //  DorianScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  多利亚音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Dorian Scale Comprehensive Tests")
// struct DorianScaleTests {

//     // MARK: - Helper Methods

//     /// 验证多利亚音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
//     func verifyDorianScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .dorian)
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

//     /// C 多利亚音阶（C D Eb F G A Bb）
//     @Test("C Dorian")
//     func testCDorian() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C,  0, 60),  // C
//             (.D,  0, 62),  // D
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B, -1, 70)  // Bb
//         ])
//     }

//     /// C# 多利亚音阶（C# D# E F# G# A# B）
//     @Test("C# Dorian")
//     func testCSharpDorian() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C,  1, 61),  // C#
//             (.D,  1, 63),  // D#
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  0, 71)  // B
//         ])
//     }

//     /// Cb 多利亚音阶（Cb Db Ebb Fb Gb Ab Bbb）
//     @Test("Cb Dorian")
//     func testCFlatDorian() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.D, -1, 61),  // Db
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69)  // Bbb
//         ])
//     }

//     /// C## 多利亚音阶（C## D## E# F## G## A## B#）
//     @Test("C## Dorian")
//     func testCDoubleSharpDorian() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C,  2, 62),  // C##
//             (.D,  2, 64),  // D##
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  1, 72)  // B#
//         ])
//     }

//     /// Cbb 多利亚音阶（Cbb Dbb Ebbb Fbb Gbb Abb Bbbb）
//     @Test("Cbb Dorian")
//     func testCDoubleFlatDorian() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.D, -2, 60),  // Dbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68)  // Bbbb
//         ])
//     }

//     /// C### 多利亚音阶（C### D### E## F### G### A### B##）
//     @Test("C### Dorian")
//     func testCTripleSharpDorian() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C,  3, 63),  // C###
//             (.D,  3, 65),  // D###
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  2, 73)  // B##
//         ])
//     }

//     /// Cbbb 多利亚音阶（Cbbb Dbbb E Fbbb Gbbb Abbb B）
//     @Test("Cbbb Dorian")
//     func testCTripleFlatDorian() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.D, -3, 59),  // Dbbb
//             (.E, -4, 60),  // E
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67)  // B
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 多利亚音阶（D E F G A B C）
//     @Test("D Dorian")
//     func testDDorian() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D,  0, 62),  // D
//             (.E,  0, 64),  // E
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  0, 72)  // C
//         ])
//     }

//     /// D# 多利亚音阶（D# E# F# G# A# B# C#）
//     @Test("D# Dorian")
//     func testDSharpDorian() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D,  1, 63),  // D#
//             (.E,  1, 65),  // E#
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  1, 73)  // C#
//         ])
//     }

//     /// Db 多利亚音阶（Db Eb Fb Gb Ab Bb Cb）
//     @Test("Db Dorian")
//     func testDFlatDorian() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71)  // Cb
//         ])
//     }

//     /// D## 多利亚音阶（D## E## F## G## A## B## C##）
//     @Test("D## Dorian")
//     func testDDoubleSharpDorian() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D,  2, 64),  // D##
//             (.E,  2, 66),  // E##
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  2, 74)  // C##
//         ])
//     }

//     /// Dbb 多利亚音阶（Dbb Ebb Fbb Gbb Abb Bbb Cbb）
//     @Test("Dbb Dorian")
//     func testDDoubleFlatDorian() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70)  // Cbb
//         ])
//     }

//     /// D### 多利亚音阶（D### E### F### G### A### B### C###）
//     @Test("D### Dorian")
//     func testDTripleSharpDorian() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D,  3, 65),  // D###
//             (.E,  3, 67),  // E###
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  3, 75)  // C###
//         ])
//     }

//     /// Dbbb 多利亚音阶（Dbbb Ebbb Fbbb Gbbb Abbb Bbbb Cbbb）
//     @Test("Dbbb Dorian")
//     func testDTripleFlatDorian() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69)  // Cbbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 多利亚音阶（E F# G A B C# D）
//     @Test("E Dorian")
//     func testEDorian() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E,  0, 64),  // E
//             (.F,  1, 66),  // F#
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  0, 74)  // D
//         ])
//     }

//     /// E# 多利亚音阶（E# F## G# A# B# C## D#）
//     @Test("E# Dorian")
//     func testESharpDorian() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E,  1, 65),  // E#
//             (.F,  2, 67),  // F##
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  1, 75)  // D#
//         ])
//     }

//     /// Eb 多利亚音阶（Eb F Gb Ab Bb C Db）
//     @Test("Eb Dorian")
//     func testEFlatDorian() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.F,  0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D, -1, 73)  // Db
//         ])
//     }

//     /// E## 多利亚音阶（E## F### G## A## B## C### D##）
//     @Test("E## Dorian")
//     func testEDoubleSharpDorian() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E,  2, 66),  // E##
//             (.F,  3, 68),  // F###
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  2, 76)  // D##
//         ])
//     }

//     /// Ebb 多利亚音阶（Ebb Fb Gbb Abb Bbb Cb Dbb）
//     @Test("Ebb Dorian")
//     func testEDoubleFlatDorian() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72)  // Dbb
//         ])
//     }

//     /// E### 多利亚音阶（E### F G### A### B### C D###）
//     @Test("E### Dorian")
//     func testETripleSharpDorian() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E,  3, 67),  // E###
//             (.F,  4, 69),  // F
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  4, 76),  // C
//             (.D,  3, 77)  // D###
//         ])
//     }

//     /// Ebbb 多利亚音阶（Ebbb Fbb Gbbb Abbb Bbbb Cbb Dbbb）
//     @Test("Ebbb Dorian")
//     func testETripleFlatDorian() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71)  // Dbbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 多利亚音阶（F G Ab Bb C D Eb）
//     @Test("F Dorian")
//     func testFDorian() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F,  0, 65),  // F
//             (.G,  0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E, -1, 75)  // Eb
//         ])
//     }

//     /// F# 多利亚音阶（F# G# A B C# D# E）
//     @Test("F# Dorian")
//     func testFSharpDorian() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F,  1, 66),  // F#
//             (.G,  1, 68),  // G#
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  0, 76)  // E
//         ])
//     }

//     /// Fb 多利亚音阶（Fb Gb Abb Bbb Cb Db Ebb）
//     @Test("Fb Dorian")
//     func testFFlatDorian() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74)  // Ebb
//         ])
//     }

//     /// F## 多利亚音阶（F## G## A# B# C## D## E#）
//     @Test("F## Dorian")
//     func testFDoubleSharpDorian() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F,  2, 67),  // F##
//             (.G,  2, 69),  // G##
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  1, 77)  // E#
//         ])
//     }

//     /// Fbb 多利亚音阶（Fbb Gbb Abbb Bbbb Cbb Dbb Ebbb）
//     @Test("Fbb Dorian")
//     func testFDoubleFlatDorian() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73)  // Ebbb
//         ])
//     }

//     /// F### 多利亚音阶（F### G### A## B## C### D### E##）
//     @Test("F### Dorian")
//     func testFTripleSharpDorian() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F,  3, 68),  // F###
//             (.G,  3, 70),  // G###
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  2, 78)  // E##
//         ])
//     }

//     /// Fbbb 多利亚音阶（Fbbb Gbbb A B Cbbb Dbbb E）
//     @Test("Fbbb Dorian")
//     func testFTripleFlatDorian() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -4, 65),  // A
//             (.B, -4, 67),  // B
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -4, 72)  // E
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 多利亚音阶（G A Bb C D E F）
//     @Test("G Dorian")
//     func testGDorian() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G,  0, 67),  // G
//             (.A,  0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  0, 77)  // F
//         ])
//     }

//     /// G# 多利亚音阶（G# A# B C# D# E# F#）
//     @Test("G# Dorian")
//     func testGSharpDorian() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G,  1, 68),  // G#
//             (.A,  1, 70),  // A#
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  1, 78)  // F#
//         ])
//     }

//     /// Gb 多利亚音阶（Gb Ab Bbb Cb Db Eb Fb）
//     @Test("Gb Dorian")
//     func testGFlatDorian() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76)  // Fb
//         ])
//     }

//     /// G## 多利亚音阶（G## A## B# C## D## E## F##）
//     @Test("G## Dorian")
//     func testGDoubleSharpDorian() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G,  2, 69),  // G##
//             (.A,  2, 71),  // A##
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  2, 79)  // F##
//         ])
//     }

//     /// Gbb 多利亚音阶（Gbb Abb Bbbb Cbb Dbb Ebb Fbb）
//     @Test("Gbb Dorian")
//     func testGDoubleFlatDorian() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75)  // Fbb
//         ])
//     }

//     /// G### 多利亚音阶（G### A### B## C### D### E### F###）
//     @Test("G### Dorian")
//     func testGTripleSharpDorian() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G,  3, 70),  // G###
//             (.A,  3, 72),  // A###
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  3, 80)  // F###
//         ])
//     }

//     /// Gbbb 多利亚音阶（Gbbb Abbb B Cbbb Dbbb Ebbb Fbbb）
//     @Test("Gbbb Dorian")
//     func testGTripleFlatDorian() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67),  // B
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -3, 74)  // Fbbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 多利亚音阶（A B C D E F# G）
//     @Test("A Dorian")
//     func testADorian() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A,  0, 69),  // A
//             (.B,  0, 71),  // B
//             (.C,  0, 72),  // C
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  1, 78),  // F#
//             (.G,  0, 79)  // G
//         ])
//     }

//     /// A# 多利亚音阶（A# B# C# D# E# F## G#）
//     @Test("A# Dorian")
//     func testASharpDorian() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A,  1, 70),  // A#
//             (.B,  1, 72),  // B#
//             (.C,  1, 73),  // C#
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  2, 79),  // F##
//             (.G,  1, 80)  // G#
//         ])
//     }

//     /// Ab 多利亚音阶（Ab Bb Cb Db Eb F Gb）
//     @Test("Ab Dorian")
//     func testAFlatDorian() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F,  0, 77),  // F
//             (.G, -1, 78)  // Gb
//         ])
//     }

//     /// A## 多利亚音阶（A## B## C## D## E## F### G##）
//     @Test("A## Dorian")
//     func testADoubleSharpDorian() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A,  2, 71),  // A##
//             (.B,  2, 73),  // B##
//             (.C,  2, 74),  // C##
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  3, 80),  // F###
//             (.G,  2, 81)  // G##
//         ])
//     }

//     /// Abb 多利亚音阶（Abb Bbb Cbb Dbb Ebb Fb Gbb）
//     @Test("Abb Dorian")
//     func testADoubleFlatDorian() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.G, -2, 77)  // Gbb
//         ])
//     }

//     /// A### 多利亚音阶（A### B### C### D### E### F G###）
//     @Test("A### Dorian")
//     func testATripleSharpDorian() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A,  3, 72),  // A###
//             (.B,  3, 74),  // B###
//             (.C,  3, 75),  // C###
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  4, 81),  // F
//             (.G,  3, 82)  // G###
//         ])
//     }

//     /// Abbb 多利亚音阶（Abbb Bbbb Cbbb Dbbb Ebbb Fbb Gbbb）
//     @Test("Abbb Dorian")
//     func testATripleFlatDorian() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75),  // Fbb
//             (.G, -3, 76)  // Gbbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 多利亚音阶（B C# D E F# G# A）
//     @Test("B Dorian")
//     func testBDorian() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B,  0, 71),  // B
//             (.C,  1, 73),  // C#
//             (.D,  0, 74),  // D
//             (.E,  0, 76),  // E
//             (.F,  1, 78),  // F#
//             (.G,  1, 80),  // G#
//             (.A,  0, 81)  // A
//         ])
//     }

//     /// B# 多利亚音阶（B# C## D# E# F## G## A#）
//     @Test("B# Dorian")
//     func testBSharpDorian() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B,  1, 72),  // B#
//             (.C,  2, 74),  // C##
//             (.D,  1, 75),  // D#
//             (.E,  1, 77),  // E#
//             (.F,  2, 79),  // F##
//             (.G,  2, 81),  // G##
//             (.A,  1, 82)  // A#
//         ])
//     }

//     /// Bb 多利亚音阶（Bb C Db Eb F G Ab）
//     @Test("Bb Dorian")
//     func testBFlatDorian() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.C,  0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F,  0, 77),  // F
//             (.G,  0, 79),  // G
//             (.A, -1, 80)  // Ab
//         ])
//     }

//     /// B## 多利亚音阶（B## C### D## E## F### G### A##）
//     @Test("B## Dorian")
//     func testBDoubleSharpDorian() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B,  2, 73),  // B##
//             (.C,  3, 75),  // C###
//             (.D,  2, 76),  // D##
//             (.E,  2, 78),  // E##
//             (.F,  3, 80),  // F###
//             (.G,  3, 82),  // G###
//             (.A,  2, 83)  // A##
//         ])
//     }

//     /// Bbb 多利亚音阶（Bbb Cb Dbb Ebb Fb Gb Abb）
//     @Test("Bbb Dorian")
//     func testBDoubleFlatDorian() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.G, -1, 78),  // Gb
//             (.A, -2, 79)  // Abb
//         ])
//     }

//     /// B### 多利亚音阶（B### C D### E### F G A###）
//     @Test("B### Dorian")
//     func testBTripleSharpDorian() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B,  3, 74),  // B###
//             (.C,  4, 76),  // C
//             (.D,  3, 77),  // D###
//             (.E,  3, 79),  // E###
//             (.F,  4, 81),  // F
//             (.G,  4, 83),  // G
//             (.A,  3, 84)  // A###
//         ])
//     }

//     /// Bbbb 多利亚音阶（Bbbb Cbb Dbbb Ebbb Fbb Gbb Abbb）
//     @Test("Bbbb Dorian")
//     func testBTripleFlatDorian() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyDorianScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75),  // Fbb
//             (.G, -2, 77),  // Gbb
//             (.A, -3, 78)  // Abbb
//         ])
//     }

// }
