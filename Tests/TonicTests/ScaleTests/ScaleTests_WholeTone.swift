// //
// //  WholeToneScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  全音音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Whole Tone Scale Comprehensive Tests")
// struct WholeToneScaleTests {

//     // MARK: - Helper Methods

//     /// 验证全音音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 6 个音符 (letter, accidental, pitch)
//     func verifyWholeToneScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .wholeTone)
//         let notes = scale.allNotes()

//         #expect(notes.count == 6)

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

//     /// C 全音音阶（C D E F# G# Bb）
//     @Test("C Whole Tone")
//     func testCWholeTone() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, 0, 60),   // C
//             (.D, 0, 62),   // D
//             (.E, 0, 64),   // E
//             (.F, 1, 66),   // F#
//             (.G, 1, 68),   // G#
//             (.B, -1, 70)   // Bb
//         ])
//     }

//     /// C# 全音音阶（C# D# E# F## G## B）
//     @Test("C# Whole Tone")
//     func testCSharpWholeTone() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, 1, 61),  // C#
//             (.D, 1, 63),  // D#
//             (.E, 1, 65),  // E#
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.B, 0, 71)   // B
//         ])
//     }

//     /// Cb 全音音阶（Cb Db Eb F G Bbb）
//     @Test("Cb Whole Tone")
//     func testCFlatWholeTone() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.B, -2, 69)   // Bbb
//         ])
//     }

//     /// C## 全音音阶（C## D## E## F### G### B#）
//     @Test("C## Whole Tone")
//     func testCDoubleSharpWholeTone() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, 2, 62),  // C##
//             (.D, 2, 64),  // D##
//             (.E, 2, 66),  // E##
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.B, 1, 72)   // B#
//         ])
//     }

//     /// Cbb 全音音阶（Cbb Dbb Ebb Fb Gb Bbbb）
//     @Test("Cbb Whole Tone")
//     func testCDoubleFlatWholeTone() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.B, -3, 68)   // Bbbb
//         ])
//     }

//     /// C### 全音音阶（C### D### E### F#### G#### B##）
//     @Test("C### Whole Tone")
//     func testCTripleSharpWholeTone() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, 3, 63),  // C###
//             (.D, 3, 65),  // D###
//             (.E, 3, 67),  // E###
//             (.F, 4, 69),  // F####
//             (.G, 4, 71),  // G####
//             (.B, 2, 73)   // B##
//         ])
//     }

//     /// Cbbb 全音音阶（Cbbb Dbbb Ebbb Fbb Gbb Bbbbb）
//     @Test("Cbbb Whole Tone")
//     func testCTripleFlatWholeTone() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.B, -4, 67)   // Bbbbb
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 全音音阶（D E F# G# A# C）
//     @Test("D Whole Tone")
//     func testDWholeTone() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, 0, 62),  // D
//             (.E, 0, 64),  // E
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.C, 0, 72)   // C
//         ])
//     }

//     /// D# 全音音阶（D# E# F## G## A## C#）
//     @Test("D# Whole Tone")
//     func testDSharpWholeTone() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, 1, 63),  // D#
//             (.E, 1, 65),  // E#
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.C, 1, 73)   // C#
//         ])
//     }

//     /// Db 全音音阶（Db Eb F G A Cb）
//     @Test("Db Whole Tone")
//     func testDFlatWholeTone() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.A, 0, 69),   // A
//             (.C, -1, 71)   // Cb
//         ])
//     }

//     /// D## 全音音阶（D## E## F### G### A### C##）
//     @Test("D## Whole Tone")
//     func testDDoubleSharpWholeTone() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, 2, 64),  // D##
//             (.E, 2, 66),  // E##
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.C, 2, 74)   // C##
//         ])
//     }

//     /// Dbb 全音音阶（Dbb Ebb Fb Gb Ab Cbb）
//     @Test("Dbb Whole Tone")
//     func testDDoubleFlatWholeTone() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.C, -2, 70)   // Cbb
//         ])
//     }

//     /// D### 全音音阶（D### E### F#### G#### A#### C###）
//     @Test("D### Whole Tone")
//     func testDTripleSharpWholeTone() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, 3, 65),  // D###
//             (.E, 3, 67),  // E###
//             (.F, 4, 69),  // F####
//             (.G, 4, 71),  // G####
//             (.A, 4, 73),  // A####
//             (.C, 3, 75)   // C###
//         ])
//     }

//     /// Dbbb 全音音阶（Dbbb Ebbb Fbb Gbb Abb Cbbb）
//     @Test("Dbbb Whole Tone")
//     func testDTripleFlatWholeTone() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.C, -3, 69)   // Cbbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 全音音阶（E F# G# A# B# D）
//     @Test("E Whole Tone")
//     func testEWholeTone() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, 0, 64),  // E
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.D, 0, 74)   // D
//         ])
//     }

//     /// E# 全音音阶（E# F## G## A## B## D#）
//     @Test("E# Whole Tone")
//     func testESharpWholeTone() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, 1, 65),  // E#
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.D, 1, 75)   // D#
//         ])
//     }

//     /// Eb 全音音阶（Eb F G A B Db）
//     @Test("Eb Whole Tone")
//     func testEFlatWholeTone() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.A, 0, 69),   // A
//             (.B, 0, 71),   // B
//             (.D, -1, 73)   // Db
//         ])
//     }

//     /// E## 全音音阶（E## F### G### A### B### D##）
//     @Test("E## Whole Tone")
//     func testEDoubleSharpWholeTone() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, 2, 66),  // E##
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.D, 2, 76)   // D##
//         ])
//     }

//     /// Ebb 全音音阶（Ebb Fb Gb Ab Bb Dbb）
//     @Test("Ebb Whole Tone")
//     func testEDoubleFlatWholeTone() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.D, -2, 72)   // Dbb
//         ])
//     }

//     /// E### 全音音阶（E### F#### G#### A#### B#### D###）
//     @Test("E### Whole Tone")
//     func testETripleSharpWholeTone() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, 3, 67),  // E###
//             (.F, 4, 69),  // F####
//             (.G, 4, 71),  // G####
//             (.A, 4, 73),  // A####
//             (.B, 4, 75),  // B####
//             (.D, 3, 77)   // D###
//         ])
//     }

//     /// Ebbb 全音音阶（Ebbb Fbb Gbb Abb Bbb Dbbb）
//     @Test("Ebbb Whole Tone")
//     func testETripleFlatWholeTone() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.D, -3, 71)   // Dbbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 全音音阶（F G A B C# Eb）
//     @Test("F Whole Tone")
//     func testFWholeTone() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.A, 0, 69),   // A
//             (.B, 0, 71),   // B
//             (.C, 1, 73),   // C#
//             (.E, -1, 75)   // Eb
//         ])
//     }

//     /// F# 全音音阶（F# G# A# B# C## E）
//     @Test("F# Whole Tone")
//     func testFSharpWholeTone() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.E, 0, 76)   // E
//         ])
//     }

//     /// Fb 全音音阶（Fb Gb Ab Bb C Ebb）
//     @Test("Fb Whole Tone")
//     func testFFlatWholeTone() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.E, -2, 74)   // Ebb
//         ])
//     }

//     /// F## 全音音阶（F## G## A## B## C### E#）
//     @Test("F## Whole Tone")
//     func testFDoubleSharpWholeTone() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.E, 1, 77)   // E#
//         ])
//     }

//     /// Fbb 全音音阶（Fbb Gbb Abb Bbb Cb Ebbb）
//     @Test("Fbb Whole Tone")
//     func testFDoubleFlatWholeTone() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.E, -3, 73)   // Ebbb
//         ])
//     }

//     /// F### 全音音阶（F### G### A### B### C#### E##）
//     @Test("F### Whole Tone")
//     func testFTripleSharpWholeTone() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.C, 4, 76),  // C####
//             (.E, 2, 78)   // E##
//         ])
//     }

//     /// Fbbb 全音音阶（Fbbb Gbbb Abbb Bbbb Cbb Ebbbb）
//     @Test("Fbbb Whole Tone")
//     func testFTripleFlatWholeTone() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.E, -4, 72)   // Ebbbb
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 全音音阶（G A B C# D# F）
//     @Test("G Whole Tone")
//     func testGWholeTone() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, 0, 67),  // G
//             (.A, 0, 69),  // A
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.D, 1, 75),  // D#
//             (.F, 0, 77)   // F
//         ])
//     }

//     /// G# 全音音阶（G# A# B# C## D## F#）
//     @Test("G# Whole Tone")
//     func testGSharpWholeTone() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.D, 2, 76),  // D##
//             (.F, 1, 78)   // F#
//         ])
//     }

//     /// Gb 全音音阶（Gb Ab Bb C D Fb）
//     @Test("Gb Whole Tone")
//     func testGFlatWholeTone() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.F, -1, 76)   // Fb
//         ])
//     }

//     /// G## 全音音阶（G## A## B## C### D### F##）
//     @Test("G## Whole Tone")
//     func testGDoubleSharpWholeTone() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.D, 3, 77),  // D###
//             (.F, 2, 79)   // F##
//         ])
//     }

//     /// Gbb 全音音阶（Gbb Abb Bbb Cb Db Fbb）
//     @Test("Gbb Whole Tone")
//     func testGDoubleFlatWholeTone() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.F, -2, 75)   // Fbb
//         ])
//     }

//     /// G### 全音音阶（G### A### B### C#### D#### F###）
//     @Test("G### Whole Tone")
//     func testGTripleSharpWholeTone() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.C, 4, 76),  // C####
//             (.D, 4, 78),  // D####
//             (.F, 3, 80)   // F###
//         ])
//     }

//     /// Gbbb 全音音阶（Gbbb Abbb Bbbb Cbb Dbb Fbbb）
//     @Test("Gbbb Whole Tone")
//     func testGTripleFlatWholeTone() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.F, -3, 74)   // Fbbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 全音音阶（A B C# D# E# G）
//     @Test("A Whole Tone")
//     func testAWholeTone() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, 0, 69),  // A
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.D, 1, 75),  // D#
//             (.E, 1, 77),  // E#
//             (.G, 0, 79)   // G
//         ])
//     }

//     /// A# 全音音阶（A# B# C## D## E## G#）
//     @Test("A# Whole Tone")
//     func testASharpWholeTone() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.D, 2, 76),  // D##
//             (.E, 2, 78),  // E##
//             (.G, 1, 80)   // G#
//         ])
//     }

//     /// Ab 全音音阶（Ab Bb C D E Gb）
//     @Test("Ab Whole Tone")
//     func testAFlatWholeTone() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.E, 0, 76),   // E
//             (.G, -1, 78)   // Gb
//         ])
//     }

//     /// A## 全音音阶（A## B## C### D### E### G##）
//     @Test("A## Whole Tone")
//     func testADoubleSharpWholeTone() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.D, 3, 77),  // D###
//             (.E, 3, 79),  // E###
//             (.G, 2, 81)   // G##
//         ])
//     }

//     /// Abb 全音音阶（Abb Bbb Cb Db Eb Gbb）
//     @Test("Abb Whole Tone")
//     func testADoubleFlatWholeTone() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.G, -2, 77)   // Gbb
//         ])
//     }

//     /// A### 全音音阶（A### B### C#### D#### E#### G###）
//     @Test("A### Whole Tone")
//     func testATripleSharpWholeTone() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.C, 4, 76),  // C####
//             (.D, 4, 78),  // D####
//             (.E, 4, 80),  // E####
//             (.G, 3, 82)   // G###
//         ])
//     }

//     /// Abbb 全音音阶（Abbb Bbbb Cbb Dbb Ebb Gbbb）
//     @Test("Abbb Whole Tone")
//     func testATripleFlatWholeTone() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.G, -3, 76)   // Gbbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 全音音阶（B C# D# E# F## A）
//     @Test("B Whole Tone")
//     func testBWholeTone() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.D, 1, 75),  // D#
//             (.E, 1, 77),  // E#
//             (.F, 2, 79),  // F##
//             (.A, 0, 81)   // A
//         ])
//     }

//     /// B# 全音音阶（B# C## D## E## F### A#）
//     @Test("B# Whole Tone")
//     func testBSharpWholeTone() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.D, 2, 76),  // D##
//             (.E, 2, 78),  // E##
//             (.F, 3, 80),  // F###
//             (.A, 1, 82)   // A#
//         ])
//     }

//     /// Bb 全音音阶（Bb C D E F# Ab）
//     @Test("Bb Whole Tone")
//     func testBFlatWholeTone() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.E, 0, 76),   // E
//             (.F, 1, 78),   // F#
//             (.A, -1, 80)   // Ab
//         ])
//     }

//     /// B## 全音音阶（B## C### D### E### F#### A##）
//     @Test("B## Whole Tone")
//     func testBDoubleSharpWholeTone() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.D, 3, 77),  // D###
//             (.E, 3, 79),  // E###
//             (.F, 4, 81),  // F####
//             (.A, 2, 83)   // A##
//         ])
//     }

//     /// Bbb 全音音阶（Bbb Cb Db Eb F Abb）
//     @Test("Bbb Whole Tone")
//     func testBDoubleFlatWholeTone() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, 0, 77),   // F
//             (.A, -2, 79)   // Abb
//         ])
//     }

//     /// B### 全音音阶（B### C#### D#### E#### F##### A###）
//     @Test("B### Whole Tone")
//     func testBTripleSharpWholeTone() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, 3, 74),  // B###
//             (.C, 4, 76),  // C####
//             (.D, 4, 78),  // D####
//             (.E, 4, 80),  // E####
//             (.F, 5, 82),  // F#####
//             (.A, 3, 84)   // A###
//         ])
//     }

//     /// Bbbb 全音音阶（Bbbb Cbb Dbb Ebb Fb Abbb）
//     @Test("Bbbb Whole Tone")
//     func testBTripleFlatWholeTone() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyWholeToneScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.A, -3, 78)   // Abbb
//         ])
//     }
// }
