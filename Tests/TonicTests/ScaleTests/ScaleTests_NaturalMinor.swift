// //
// //  NaturalMinorScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  自然小调音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Natural Minor Scale Comprehensive Tests")
// struct NaturalMinorScaleTests {

//     // MARK: - Helper Methods

//     /// 验证自然小调音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
//     func verifyNaturalMinorScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .naturalMinor)
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

//     /// C 自然小调（C D Eb F G Ab Bb）
//     @Test("C Natural Minor")
//     func testCNaturalMinor() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, 0, 60),   // C
//             (.D, 0, 62),   // D
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70)   // Bb
//         ])
//     }

//     /// C# 自然小调（C# D# E F# G# A B）
//     @Test("C# Natural Minor")
//     func testCSharpNaturalMinor() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, 1, 61),   // C#
//             (.D, 1, 63),   // D#
//             (.E, 0, 64),   // E
//             (.F, 1, 66),   // F#
//             (.G, 1, 68),   // G#
//             (.A, 0, 69),   // A
//             (.B, 0, 71)    // B
//         ])
//     }

//     /// Cb 自然小调（Cb Db Ebb Fb Gb Abb Bbb）
//     @Test("Cb Natural Minor")
//     func testCFlatNaturalMinor() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.D, -1, 61),  // Db
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69)   // Bbb
//         ])
//     }

//     /// C## 自然小调（C## D## E# F## G## A# B#）
//     @Test("C## Natural Minor")
//     func testCDoubleSharpNaturalMinor() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, 2, 62),   // C##
//             (.D, 2, 64),   // D##
//             (.E, 1, 65),   // E#
//             (.F, 2, 67),   // F##
//             (.G, 2, 69),   // G##
//             (.A, 1, 70),   // A#
//             (.B, 1, 72)    // B#
//         ])
//     }

//     /// Cbb 自然小调（Cbb Dbb Ebbb Fbb Gbb Abbb Bbbb）
//     @Test("Cbb Natural Minor")
//     func testCDoubleFlatNaturalMinor() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.D, -2, 60),  // Dbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68)   // Bbbb
//         ])
//     }

//     /// C### 自然小调（C### D### E## F### G### A## B##）
//     @Test("C### Natural Minor")
//     func testCTripleSharpNaturalMinor() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, 3, 63),   // C###
//             (.D, 3, 65),   // D###
//             (.E, 2, 66),   // E##
//             (.F, 3, 68),   // F###
//             (.G, 3, 70),   // G###
//             (.A, 2, 71),   // A##
//             (.B, 2, 73)    // B##
//         ])
//     }

//     /// Cbbb 自然小调（Cbbb Dbbb Ebbbb Fbbb Gbbb Abbbb Bbbbb）
//     @Test("Cbbb Natural Minor")
//     func testCTripleFlatNaturalMinor() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.D, -3, 59),  // Dbbb
//             (.E, -4, 60),  // Ebbbb
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -4, 65),  // Abbbb
//             (.B, -4, 67)   // Bbbbb
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 自然小调（D E F G A Bb C）
//     @Test("D Natural Minor")
//     func testDNaturalMinor() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, 0, 62),   // D
//             (.E, 0, 64),   // E
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.A, 0, 69),   // A
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72)    // C
//         ])
//     }

//     /// D# 自然小调（D# E# F# G# A# B C#）
//     @Test("D# Natural Minor")
//     func testDSharpNaturalMinor() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, 1, 63),   // D#
//             (.E, 1, 65),   // E#
//             (.F, 1, 66),   // F#
//             (.G, 1, 68),   // G#
//             (.A, 1, 70),   // A#
//             (.B, 0, 71),   // B
//             (.C, 1, 73)    // C#
//         ])
//     }

//     /// Db 自然小调（Db Eb Fb Gb Ab Bbb Cb）
//     @Test("Db Natural Minor")
//     func testDFlatNaturalMinor() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71)   // Cb
//         ])
//     }

//     /// D## 自然小调（D## E## F## G## A## B# C##）
//     @Test("D## Natural Minor")
//     func testDDoubleSharpNaturalMinor() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, 2, 64),   // D##
//             (.E, 2, 66),   // E##
//             (.F, 2, 67),   // F##
//             (.G, 2, 69),   // G##
//             (.A, 2, 71),   // A##
//             (.B, 1, 72),   // B#
//             (.C, 2, 74)    // C##
//         ])
//     }

//     /// Dbb 自然小调（Dbb Ebb Fbb Gbb Abb Bbbb Cbb）
//     @Test("Dbb Natural Minor")
//     func testDDoubleFlatNaturalMinor() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70)   // Cbb
//         ])
//     }

//     /// D### 自然小调（D### E### F### G### A### B## C###）
//     @Test("D### Natural Minor")
//     func testDTripleSharpNaturalMinor() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, 3, 65),   // D###
//             (.E, 3, 67),   // E###
//             (.F, 3, 68),   // F###
//             (.G, 3, 70),   // G###
//             (.A, 3, 72),   // A###
//             (.B, 2, 73),   // B##
//             (.C, 3, 75)    // C###
//         ])
//     }

//     /// Dbbb 自然小调（Dbbb Ebbb Fbbb Gbbb Abbb Bbbbb Cbbb）
//     @Test("Dbbb Natural Minor")
//     func testDTripleFlatNaturalMinor() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67),  // Bbbbb
//             (.C, -3, 69)   // Cbbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 自然小调（E F# G A B C D）
//     @Test("E Natural Minor")
//     func testENaturalMinor() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, 0, 64),   // E
//             (.F, 1, 66),   // F#
//             (.G, 0, 67),   // G
//             (.A, 0, 69),   // A
//             (.B, 0, 71),   // B
//             (.C, 0, 72),   // C
//             (.D, 0, 74)    // D
//         ])
//     }

//     /// E# 自然小调（E# F## G# A# B# C# D#）
//     @Test("E# Natural Minor")
//     func testESharpNaturalMinor() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, 1, 65),   // E#
//             (.F, 2, 67),   // F##
//             (.G, 1, 68),   // G#
//             (.A, 1, 70),   // A#
//             (.B, 1, 72),   // B#
//             (.C, 1, 73),   // C#
//             (.D, 1, 75)    // D#
//         ])
//     }

//     /// Eb 自然小调（Eb F Gb Ab Bb Cb Db）
//     @Test("Eb Natural Minor")
//     func testEFlatNaturalMinor() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73)   // Db
//         ])
//     }

//     /// E## 自然小调（E## F### G## A## B## C## D##）
//     @Test("E## Natural Minor")
//     func testEDoubleSharpNaturalMinor() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, 2, 66),   // E##
//             (.F, 3, 68),   // F###
//             (.G, 2, 69),   // G##
//             (.A, 2, 71),   // A##
//             (.B, 2, 73),   // B##
//             (.C, 2, 74),   // C##
//             (.D, 2, 76)    // D##
//         ])
//     }

//     /// Ebb 自然小调（Ebb Fb Gbb Abb Bbb Cbb Dbb）
//     @Test("Ebb Natural Minor")
//     func testEDoubleFlatNaturalMinor() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72)   // Dbb
//         ])
//     }

//     /// E### 自然小调（E### F#### G### A### B### C### D###）
//     @Test("E### Natural Minor")
//     func testETripleSharpNaturalMinor() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, 3, 67),   // E###
//             (.F, 4, 69),   // F####
//             (.G, 3, 70),   // G###
//             (.A, 3, 72),   // A###
//             (.B, 3, 74),   // B###
//             (.C, 3, 75),   // C###
//             (.D, 3, 77)    // D###
//         ])
//     }

//     /// Ebbb 自然小调（Ebbb Fbb Gbbb Abbb Bbbb Cbbb Dbbb）
//     @Test("Ebbb Natural Minor")
//     func testETripleFlatNaturalMinor() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71)   // Dbbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 自然小调（F G Ab Bb C Db Eb）
//     @Test("F Natural Minor")
//     func testFNaturalMinor() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, -1, 73),  // Db
//             (.E, -1, 75)   // Eb
//         ])
//     }

//     /// F# 自然小调（F# G# A B C# D E）
//     @Test("F# Natural Minor")
//     func testFSharpNaturalMinor() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, 1, 66),   // F#
//             (.G, 1, 68),   // G#
//             (.A, 0, 69),   // A
//             (.B, 0, 71),   // B
//             (.C, 1, 73),   // C#
//             (.D, 0, 74),   // D
//             (.E, 0, 76)    // E
//         ])
//     }

//     /// Fb 自然小调（Fb Gb Abb Bbb Cb Dbb Ebb）
//     @Test("Fb Natural Minor")
//     func testFFlatNaturalMinor() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74)   // Ebb
//         ])
//     }

//     /// F## 自然小调（F## G## A# B# C## D# E#）
//     @Test("F## Natural Minor")
//     func testFDoubleSharpNaturalMinor() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, 2, 67),   // F##
//             (.G, 2, 69),   // G##
//             (.A, 1, 70),   // A#
//             (.B, 1, 72),   // B#
//             (.C, 2, 74),   // C##
//             (.D, 1, 75),   // D#
//             (.E, 1, 77)    // E#
//         ])
//     }

//     /// Fbb 自然小调（Fbb Gbb Abbb Bbbb Cbb Dbbb Ebbb）
//     @Test("Fbb Natural Minor")
//     func testFDoubleFlatNaturalMinor() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73)   // Ebbb
//         ])
//     }

//     /// F### 自然小调（F### G### A## B## C### D## E##）
//     @Test("F### Natural Minor")
//     func testFTripleSharpNaturalMinor() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, 3, 68),   // F###
//             (.G, 3, 70),   // G###
//             (.A, 2, 71),   // A##
//             (.B, 2, 73),   // B##
//             (.C, 3, 75),   // C###
//             (.D, 2, 76),   // D##
//             (.E, 2, 78)    // E##
//         ])
//     }

//     /// Fbbb 自然小调（Fbbb Gbbb Abbbb Bbbbb Cbbb Dbbbb Ebbbb）
//     @Test("Fbbb Natural Minor")
//     func testFTripleFlatNaturalMinor() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -4, 65),  // Abbbb
//             (.B, -4, 67),  // Bbbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -4, 70),  // Dbbbb
//             (.E, -4, 72)   // Ebbbb
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 自然小调（G A Bb C D Eb F）
//     @Test("G Natural Minor")
//     func testGNaturalMinor() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, 0, 67),   // G
//             (.A, 0, 69),   // A
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.E, -1, 75),  // Eb
//             (.F, 0, 77)    // F
//         ])
//     }

//     /// G# 自然小调（G# A# B C# D# E F#）
//     @Test("G# Natural Minor")
//     func testGSharpNaturalMinor() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, 1, 68),   // G#
//             (.A, 1, 70),   // A#
//             (.B, 0, 71),   // B
//             (.C, 1, 73),   // C#
//             (.D, 1, 75),   // D#
//             (.E, 0, 76),   // E
//             (.F, 1, 78)    // F#
//         ])
//     }

//     /// Gb 自然小调（Gb Ab Bbb Cb Db Ebb Fb）
//     @Test("Gb Natural Minor")
//     func testGFlatNaturalMinor() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76)   // Fb
//         ])
//     }

//     /// G## 自然小调（G## A## B# C## D## E# F##）
//     @Test("G## Natural Minor")
//     func testGDoubleSharpNaturalMinor() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, 2, 69),   // G##
//             (.A, 2, 71),   // A##
//             (.B, 1, 72),   // B#
//             (.C, 2, 74),   // C##
//             (.D, 2, 76),   // D##
//             (.E, 1, 77),   // E#
//             (.F, 2, 79)    // F##
//         ])
//     }

//     /// Gbb 自然小调（Gbb Abb Bbbb Cbb Dbb Ebbb Fbb）
//     @Test("Gbb Natural Minor")
//     func testGDoubleFlatNaturalMinor() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75)   // Fbb
//         ])
//     }

//     /// G### 自然小调（G### A### B## C### D### E## F###）
//     @Test("G### Natural Minor")
//     func testGTripleSharpNaturalMinor() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, 3, 70),   // G###
//             (.A, 3, 72),   // A###
//             (.B, 2, 73),   // B##
//             (.C, 3, 75),   // C###
//             (.D, 3, 77),   // D###
//             (.E, 2, 78),   // E##
//             (.F, 3, 80)    // F###
//         ])
//     }

//     /// Gbbb 自然小调（Gbbb Abbb Bbbbb Cbbb Dbbb Ebbbb Fbbb）
//     @Test("Gbbb Natural Minor")
//     func testGTripleFlatNaturalMinor() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67),  // Bbbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -4, 72),  // Ebbbb
//             (.F, -3, 74)   // Fbbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 自然小调（A B C D E F G）
//     @Test("A Natural Minor")
//     func testANaturalMinor() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, 0, 69),   // A
//             (.B, 0, 71),   // B
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.E, 0, 76),   // E
//             (.F, 0, 77),   // F
//             (.G, 0, 79)    // G
//         ])
//     }

//     /// A# 自然小调（A# B# C# D# E# F# G#）
//     @Test("A# Natural Minor")
//     func testASharpNaturalMinor() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, 1, 70),   // A#
//             (.B, 1, 72),   // B#
//             (.C, 1, 73),   // C#
//             (.D, 1, 75),   // D#
//             (.E, 1, 77),   // E#
//             (.F, 1, 78),   // F#
//             (.G, 1, 80)    // G#
//         ])
//     }

//     /// Ab 自然小调（Ab Bb Cb Db Eb Fb Gb）
//     @Test("Ab Natural Minor")
//     func testAFlatNaturalMinor() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76),  // Fb
//             (.G, -1, 78)   // Gb
//         ])
//     }

//     /// A## 自然小调（A## B## C## D## E## F## G##）
//     @Test("A## Natural Minor")
//     func testADoubleSharpNaturalMinor() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, 2, 71),   // A##
//             (.B, 2, 73),   // B##
//             (.C, 2, 74),   // C##
//             (.D, 2, 76),   // D##
//             (.E, 2, 78),   // E##
//             (.F, 2, 79),   // F##
//             (.G, 2, 81)    // G##
//         ])
//     }

//     /// Abb 自然小调（Abb Bbb Cbb Dbb Ebb Fbb Gbb）
//     @Test("Abb Natural Minor")
//     func testADoubleFlatNaturalMinor() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75),  // Fbb
//             (.G, -2, 77)   // Gbb
//         ])
//     }

//     /// A### 自然小调（A### B### C### D### E### F### G###）
//     @Test("A### Natural Minor")
//     func testATripleSharpNaturalMinor() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, 3, 72),   // A###
//             (.B, 3, 74),   // B###
//             (.C, 3, 75),   // C###
//             (.D, 3, 77),   // D###
//             (.E, 3, 79),   // E###
//             (.F, 3, 80),   // F###
//             (.G, 3, 82)    // G###
//         ])
//     }

//     /// Abbb 自然小调（Abbb Bbbb Cbbb Dbbb Ebbb Fbbb Gbbb）
//     @Test("Abbb Natural Minor")
//     func testATripleFlatNaturalMinor() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -3, 74),  // Fbbb
//             (.G, -3, 76)   // Gbbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 自然小调（B C# D E F# G A）
//     @Test("B Natural Minor")
//     func testBNaturalMinor() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, 0, 71),   // B
//             (.C, 1, 73),   // C#
//             (.D, 0, 74),   // D
//             (.E, 0, 76),   // E
//             (.F, 1, 78),   // F#
//             (.G, 0, 79),   // G
//             (.A, 0, 81)    // A
//         ])
//     }

//     /// B# 自然小调（B# C## D# E# F## G# A#）
//     @Test("B# Natural Minor")
//     func testBSharpNaturalMinor() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, 1, 72),   // B#
//             (.C, 2, 74),   // C##
//             (.D, 1, 75),   // D#
//             (.E, 1, 77),   // E#
//             (.F, 2, 79),   // F##
//             (.G, 1, 80),   // G#
//             (.A, 1, 82)    // A#
//         ])
//     }

//     /// Bb 自然小调（Bb C Db Eb F Gb Ab）
//     @Test("Bb Natural Minor")
//     func testBFlatNaturalMinor() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, -1, 73),  // Db
//             (.E, -1, 75),  // Eb
//             (.F, 0, 77),   // F
//             (.G, -1, 78),  // Gb
//             (.A, -1, 80)   // Ab
//         ])
//     }

//     /// B## 自然小调（B## C### D## E## F### G## A##）
//     @Test("B## Natural Minor")
//     func testBDoubleSharpNaturalMinor() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, 2, 73),   // B##
//             (.C, 3, 75),   // C###
//             (.D, 2, 76),   // D##
//             (.E, 2, 78),   // E##
//             (.F, 3, 80),   // F###
//             (.G, 2, 81),   // G##
//             (.A, 2, 83)    // A##
//         ])
//     }

//     /// Bbb 自然小调（Bbb Cb Dbb Ebb Fb Gbb Abb）
//     @Test("Bbb Natural Minor")
//     func testBDoubleFlatNaturalMinor() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76),  // Fb
//             (.G, -2, 77),  // Gbb
//             (.A, -2, 79)   // Abb
//         ])
//     }

//     /// B### 自然小调（B### C#### D### E### F#### G### A###）
//     @Test("B### Natural Minor")
//     func testBTripleSharpNaturalMinor() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, 3, 74),   // B###
//             (.C, 4, 76),   // C####
//             (.D, 3, 77),   // D###
//             (.E, 3, 79),   // E###
//             (.F, 4, 81),   // F####
//             (.G, 3, 82),   // G###
//             (.A, 3, 84)    // A###
//         ])
//     }

//     /// Bbbb 自然小调（Bbbb Cbb Dbbb Ebbb Fbb Gbbb Abbb）
//     @Test("Bbbb Natural Minor")
//     func testBTripleFlatNaturalMinor() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyNaturalMinorScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75),  // Fbb
//             (.G, -3, 76),  // Gbbb
//             (.A, -3, 78)   // Abbb
//         ])
//     }
// }
