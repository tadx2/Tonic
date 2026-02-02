// //
// //  PentatonicMajorScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  五声大调音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Pentatonic Major Scale Comprehensive Tests")
// struct PentatonicMajorScaleTests {

//     // MARK: - Helper Methods

//     /// 验证五声大调音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 5 个音符 (letter, accidental, pitch)
//     func verifyPentatonicMajorScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .pentatonicMajor)
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

//     /// C 五声大调（C D E G A）
//     @Test("C Pentatonic Major")
//     func testCPentatonicMajor() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, 0, 60),  // C
//             (.D, 0, 62),  // D
//             (.E, 0, 64),  // E
//             (.G, 0, 67),  // G
//             (.A, 0, 69)   // A
//         ])
//     }

//     /// C# 五声大调（C# D# E# G# A#）
//     @Test("C# Pentatonic Major")
//     func testCSharpPentatonicMajor() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, 1, 61),  // C#
//             (.D, 1, 63),  // D#
//             (.E, 1, 65),  // E#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70)   // A#
//         ])
//     }

//     /// Cb 五声大调（Cb Db Eb Gb Ab）
//     @Test("Cb Pentatonic Major")
//     func testCFlatPentatonicMajor() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68)   // Ab
//         ])
//     }

//     /// C## 五声大调（C## D## E## G## A##）
//     @Test("C## Pentatonic Major")
//     func testCDoubleSharpPentatonicMajor() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, 2, 62),  // C##
//             (.D, 2, 64),  // D##
//             (.E, 2, 66),  // E##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71)   // A##
//         ])
//     }

//     /// Cbb 五声大调（Cbb Dbb Ebb Gbb Abb）
//     @Test("Cbb Pentatonic Major")
//     func testCDoubleFlatPentatonicMajor() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67)   // Abb
//         ])
//     }

//     /// C### 五声大调（C### D### E### G### A###）
//     @Test("C### Pentatonic Major")
//     func testCTripleSharpPentatonicMajor() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, 3, 63),  // C###
//             (.D, 3, 65),  // D###
//             (.E, 3, 67),  // E###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72)   // A###
//         ])
//     }

//     /// Cbbb 五声大调（Cbbb Dbbb Ebbb Gbbb Abbb）
//     @Test("Cbbb Pentatonic Major")
//     func testCTripleFlatPentatonicMajor() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66)   // Abbb
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 五声大调（D E F# A B）
//     @Test("D Pentatonic Major")
//     func testDPentatonicMajor() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, 0, 62),  // D
//             (.E, 0, 64),  // E
//             (.F, 1, 66),  // F#
//             (.A, 0, 69),  // A
//             (.B, 0, 71)   // B
//         ])
//     }

//     /// D# 五声大调（D# E# F## A# B#）
//     @Test("D# Pentatonic Major")
//     func testDSharpPentatonicMajor() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, 1, 63),  // D#
//             (.E, 1, 65),  // E#
//             (.F, 2, 67),  // F##
//             (.A, 1, 70),  // A#
//             (.B, 1, 72)   // B#
//         ])
//     }

//     /// Db 五声大调（Db Eb F Ab Bb）
//     @Test("Db Pentatonic Major")
//     func testDFlatPentatonicMajor() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70)   // Bb
//         ])
//     }

//     /// D## 五声大调（D## E## F### A## B##）
//     @Test("D## Pentatonic Major")
//     func testDDoubleSharpPentatonicMajor() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, 2, 64),  // D##
//             (.E, 2, 66),  // E##
//             (.F, 3, 68),  // F###
//             (.A, 2, 71),  // A##
//             (.B, 2, 73)   // B##
//         ])
//     }

//     /// Dbb 五声大调（Dbb Ebb Fb Abb Bbb）
//     @Test("Dbb Pentatonic Major")
//     func testDDoubleFlatPentatonicMajor() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69)   // Bbb
//         ])
//     }

//     /// D### 五声大调（D### E### F#### A### B###）
//     @Test("D### Pentatonic Major")
//     func testDTripleSharpPentatonicMajor() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, 3, 65),  // D###
//             (.E, 3, 67),  // E###
//             (.F, 4, 69),  // F####
//             (.A, 3, 72),  // A###
//             (.B, 3, 74)   // B###
//         ])
//     }

//     /// Dbbb 五声大调（Dbbb Ebbb Fbb Abbb Bbbb）
//     @Test("Dbbb Pentatonic Major")
//     func testDTripleFlatPentatonicMajor() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68)   // Bbbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 五声大调（E F# G# B C#）
//     @Test("E Pentatonic Major")
//     func testEPentatonicMajor() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, 0, 64),  // E
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.B, 0, 71),  // B
//             (.C, 1, 73)   // C#
//         ])
//     }

//     /// E# 五声大调（E# F## G## B# C##）
//     @Test("E# Pentatonic Major")
//     func testESharpPentatonicMajor() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, 1, 65),  // E#
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.B, 1, 72),  // B#
//             (.C, 2, 74)   // C##
//         ])
//     }

//     /// Eb 五声大调（Eb F G Bb C）
//     @Test("Eb Pentatonic Major")
//     func testEFlatPentatonicMajor() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.F, 0, 65),   // F
//             (.G, 0, 67),   // G
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72)    // C
//         ])
//     }

//     /// E## 五声大调（E## F### G### B## C###）
//     @Test("E## Pentatonic Major")
//     func testEDoubleSharpPentatonicMajor() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, 2, 66),  // E##
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.B, 2, 73),  // B##
//             (.C, 3, 75)   // C###
//         ])
//     }

//     /// Ebb 五声大调（Ebb Fb Gb Bbb Cb）
//     @Test("Ebb Pentatonic Major")
//     func testEDoubleFlatPentatonicMajor() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71)   // Cb
//         ])
//     }

//     /// E### 五声大调（E### F#### G#### B### C####）
//     @Test("E### Pentatonic Major")
//     func testETripleSharpPentatonicMajor() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, 3, 67),  // E###
//             (.F, 4, 69),  // F####
//             (.G, 4, 71),  // G####
//             (.B, 3, 74),  // B###
//             (.C, 4, 76)   // C####
//         ])
//     }

//     /// Ebbb 五声大调（Ebbb Fbb Gbb Bbbb Cbb）
//     @Test("Ebbb Pentatonic Major")
//     func testETripleFlatPentatonicMajor() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70)   // Cbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 五声大调（F G A C D）
//     @Test("F Pentatonic Major")
//     func testFPentatonicMajor() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, 0, 65),  // F
//             (.G, 0, 67),  // G
//             (.A, 0, 69),  // A
//             (.C, 0, 72),  // C
//             (.D, 0, 74)   // D
//         ])
//     }

//     /// F# 五声大调（F# G# A# C# D#）
//     @Test("F# Pentatonic Major")
//     func testFSharpPentatonicMajor() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, 1, 66),  // F#
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.C, 1, 73),  // C#
//             (.D, 1, 75)   // D#
//         ])
//     }

//     /// Fb 五声大调（Fb Gb Ab Cb Db）
//     @Test("Fb Pentatonic Major")
//     func testFFlatPentatonicMajor() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73)   // Db
//         ])
//     }

//     /// F## 五声大调（F## G## A## C## D##）
//     @Test("F## Pentatonic Major")
//     func testFDoubleSharpPentatonicMajor() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, 2, 67),  // F##
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.C, 2, 74),  // C##
//             (.D, 2, 76)   // D##
//         ])
//     }

//     /// Fbb 五声大调（Fbb Gbb Abb Cbb Dbb）
//     @Test("Fbb Pentatonic Major")
//     func testFDoubleFlatPentatonicMajor() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72)   // Dbb
//         ])
//     }

//     /// F### 五声大调（F### G### A### C### D###）
//     @Test("F### Pentatonic Major")
//     func testFTripleSharpPentatonicMajor() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, 3, 68),  // F###
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.C, 3, 75),  // C###
//             (.D, 3, 77)   // D###
//         ])
//     }

//     /// Fbbb 五声大调（Fbbb Gbbb Abbb Cbbb Dbbb）
//     @Test("Fbbb Pentatonic Major")
//     func testFTripleFlatPentatonicMajor() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.C, -3, 69),  // Cbbb
//             (.D, -3, 71)   // Dbbb
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 五声大调（G A B D E）
//     @Test("G Pentatonic Major")
//     func testGPentatonicMajor() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, 0, 67),  // G
//             (.A, 0, 69),  // A
//             (.B, 0, 71),  // B
//             (.D, 0, 74),  // D
//             (.E, 0, 76)   // E
//         ])
//     }

//     /// G# 五声大调（G# A# B# D# E#）
//     @Test("G# Pentatonic Major")
//     func testGSharpPentatonicMajor() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, 1, 68),  // G#
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.D, 1, 75),  // D#
//             (.E, 1, 77)   // E#
//         ])
//     }

//     /// Gb 五声大调（Gb Ab Bb Db Eb）
//     @Test("Gb Pentatonic Major")
//     func testGFlatPentatonicMajor() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.D, -1, 73),  // Db
//             (.E, -1, 75)   // Eb
//         ])
//     }

//     /// G## 五声大调（G## A## B## D## E##）
//     @Test("G## Pentatonic Major")
//     func testGDoubleSharpPentatonicMajor() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, 2, 69),  // G##
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.D, 2, 76),  // D##
//             (.E, 2, 78)   // E##
//         ])
//     }

//     /// Gbb 五声大调（Gbb Abb Bbb Dbb Ebb）
//     @Test("Gbb Pentatonic Major")
//     func testGDoubleFlatPentatonicMajor() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.D, -2, 72),  // Dbb
//             (.E, -2, 74)   // Ebb
//         ])
//     }

//     /// G### 五声大调（G### A### B### D### E###）
//     @Test("G### Pentatonic Major")
//     func testGTripleSharpPentatonicMajor() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, 3, 70),  // G###
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.D, 3, 77),  // D###
//             (.E, 3, 79)   // E###
//         ])
//     }

//     /// Gbbb 五声大调（Gbbb Abbb Bbbb Dbbb Ebbb）
//     @Test("Gbbb Pentatonic Major")
//     func testGTripleFlatPentatonicMajor() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.D, -3, 71),  // Dbbb
//             (.E, -3, 73)   // Ebbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 五声大调（A B C# E F#）
//     @Test("A Pentatonic Major")
//     func testAPentatonicMajor() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, 0, 69),  // A
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.E, 0, 76),  // E
//             (.F, 1, 78)   // F#
//         ])
//     }

//     /// A# 五声大调（A# B# C## E# F##）
//     @Test("A# Pentatonic Major")
//     func testASharpPentatonicMajor() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, 1, 70),  // A#
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.E, 1, 77),  // E#
//             (.F, 2, 79)   // F##
//         ])
//     }

//     /// Ab 五声大调（Ab Bb C Eb F）
//     @Test("Ab Pentatonic Major")
//     func testAFlatPentatonicMajor() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.E, -1, 75),  // Eb
//             (.F, 0, 77)    // F
//         ])
//     }

//     /// A## 五声大调（A## B## C### E## F###）
//     @Test("A## Pentatonic Major")
//     func testADoubleSharpPentatonicMajor() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, 2, 71),  // A##
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.E, 2, 78),  // E##
//             (.F, 3, 80)   // F###
//         ])
//     }

//     /// Abb 五声大调（Abb Bbb Cb Ebb Fb）
//     @Test("Abb Pentatonic Major")
//     func testADoubleFlatPentatonicMajor() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.E, -2, 74),  // Ebb
//             (.F, -1, 76)   // Fb
//         ])
//     }

//     /// A### 五声大调（A### B### C#### E### F####）
//     @Test("A### Pentatonic Major")
//     func testATripleSharpPentatonicMajor() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, 3, 72),  // A###
//             (.B, 3, 74),  // B###
//             (.C, 4, 76),  // C####
//             (.E, 3, 79),  // E###
//             (.F, 4, 81)   // F####
//         ])
//     }

//     /// Abbb 五声大调（Abbb Bbbb Cbb Ebbb Fbb）
//     @Test("Abbb Pentatonic Major")
//     func testATripleFlatPentatonicMajor() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.E, -3, 73),  // Ebbb
//             (.F, -2, 75)   // Fbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 五声大调（B C# D# F# G#）
//     @Test("B Pentatonic Major")
//     func testBPentatonicMajor() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, 0, 71),  // B
//             (.C, 1, 73),  // C#
//             (.D, 1, 75),  // D#
//             (.F, 1, 78),  // F#
//             (.G, 1, 80)   // G#
//         ])
//     }

//     /// B# 五声大调（B# C## D## F## G##）
//     @Test("B# Pentatonic Major")
//     func testBSharpPentatonicMajor() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, 1, 72),  // B#
//             (.C, 2, 74),  // C##
//             (.D, 2, 76),  // D##
//             (.F, 2, 79),  // F##
//             (.G, 2, 81)   // G##
//         ])
//     }

//     /// Bb 五声大调（Bb C D F G）
//     @Test("Bb Pentatonic Major")
//     func testBFlatPentatonicMajor() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.C, 0, 72),   // C
//             (.D, 0, 74),   // D
//             (.F, 0, 77),   // F
//             (.G, 0, 79)    // G
//         ])
//     }

//     /// B## 五声大调（B## C### D### F### G###）
//     @Test("B## Pentatonic Major")
//     func testBDoubleSharpPentatonicMajor() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, 2, 73),  // B##
//             (.C, 3, 75),  // C###
//             (.D, 3, 77),  // D###
//             (.F, 3, 80),  // F###
//             (.G, 3, 82)   // G###
//         ])
//     }

//     /// Bbb 五声大调（Bbb Cb Db Fb Gb）
//     @Test("Bbb Pentatonic Major")
//     func testBDoubleFlatPentatonicMajor() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.C, -1, 71),  // Cb
//             (.D, -1, 73),  // Db
//             (.F, -1, 76),  // Fb
//             (.G, -1, 78)   // Gb
//         ])
//     }

//     /// B### 五声大调（B### C#### D#### F#### G####）
//     @Test("B### Pentatonic Major")
//     func testBTripleSharpPentatonicMajor() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, 3, 74),  // B###
//             (.C, 4, 76),  // C####
//             (.D, 4, 78),  // D####
//             (.F, 4, 81),  // F####
//             (.G, 4, 83)   // G####
//         ])
//     }

//     /// Bbbb 五声大调（Bbbb Cbb Dbb Fbb Gbb）
//     @Test("Bbbb Pentatonic Major")
//     func testBTripleFlatPentatonicMajor() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyPentatonicMajorScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -2, 72),  // Dbb
//             (.F, -2, 75),  // Fbb
//             (.G, -2, 77)   // Gbb
//         ])
//     }
// }
