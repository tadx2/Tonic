// //
// //  ChromaticScaleTests.swift
// //  Tonic
// //
// //  Created by Claude Code
// //
// //  半音音阶的全面测试套件
// //  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
// //  总共 49 个测试用例

// import Testing
// import Foundation
// @testable import Tonic

// @Suite("Chromatic Scale Comprehensive Tests")
// struct ChromaticScaleTests {

//     // MARK: - Helper Methods

//     /// 验证半音音阶的所有音符
//     /// - Parameters:
//     ///   - rootNote: 根音
//     ///   - expectedNotes: 期望的 12 个音符 (letter, accidental, pitch)
//     func verifyChromaticScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
//         let scale = Scale(rootNote: rootNote, type: .chromatic)
//         let notes = scale.allNotes()

//         #expect(notes.count == 12)

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

//     /// C 半音音阶（C C# D D# E F F# G G# A A# B）
//     @Test("C Chromatic")
//     func testCChromatic() {
//         let root = Note(letter: .C, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, 0, 60),  // C
//             (.C, 1, 61),  // C#
//             (.D, 0, 62),  // D
//             (.D, 1, 63),  // D#
//             (.E, 0, 64),  // E
//             (.F, 0, 65),  // F
//             (.F, 1, 66),  // F#
//             (.G, 0, 67),  // G
//             (.G, 1, 68),  // G#
//             (.A, 0, 69),  // A
//             (.A, 1, 70),  // A#
//             (.B, 0, 71)   // B
//         ])
//     }

//     /// C# 半音音阶（C# C## D# D## E# F# F## G# G## A# A## B#）
//     @Test("C# Chromatic")
//     func testCSharpChromatic() {
//         let root = Note(letter: .C, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, 1, 61),  // C#
//             (.C, 2, 62),  // C##
//             (.D, 1, 63),  // D#
//             (.D, 2, 64),  // D##
//             (.E, 1, 65),  // E#
//             (.F, 1, 66),  // F#
//             (.F, 2, 67),  // F##
//             (.G, 1, 68),  // G#
//             (.G, 2, 69),  // G##
//             (.A, 1, 70),  // A#
//             (.A, 2, 71),  // A##
//             (.B, 1, 72)   // B#
//         ])
//     }

//     /// Cb 半音音阶（Cb C Db D Eb Fb F Gb G Ab A Bb）
//     @Test("Cb Chromatic")
//     func testCFlatChromatic() {
//         let root = Note(letter: .C, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, -1, 59),  // Cb
//             (.C, 0, 60),  // C
//             (.D, -1, 61),  // Db
//             (.D, 0, 62),  // D
//             (.E, -1, 63),  // Eb
//             (.F, -1, 64),  // Fb
//             (.F, 0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.G, 0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.A, 0, 69),  // A
//             (.B, -1, 70)   // Bb
//         ])
//     }

//     /// C## 半音音阶（C## C### D## D### E## F## F### G## G### A## A### B##）
//     @Test("C## Chromatic")
//     func testCDoubleSharpChromatic() {
//         let root = Note(letter: .C, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, 2, 62),  // C##
//             (.C, 3, 63),  // C###
//             (.D, 2, 64),  // D##
//             (.D, 3, 65),  // D###
//             (.E, 2, 66),  // E##
//             (.F, 2, 67),  // F##
//             (.F, 3, 68),  // F###
//             (.G, 2, 69),  // G##
//             (.G, 3, 70),  // G###
//             (.A, 2, 71),  // A##
//             (.A, 3, 72),  // A###
//             (.B, 2, 73)   // B##
//         ])
//     }

//     /// Cbb 半音音阶（Cbb Cb Dbb Db Ebb Fbb Fb Gbb Gb Abb Ab Bbb）
//     @Test("Cbb Chromatic")
//     func testCDoubleFlatChromatic() {
//         let root = Note(letter: .C, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, -2, 58),  // Cbb
//             (.C, -1, 59),  // Cb
//             (.D, -2, 60),  // Dbb
//             (.D, -1, 61),  // Db
//             (.E, -2, 62),  // Ebb
//             (.F, -2, 63),  // Fbb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69)   // Bbb
//         ])
//     }

//     /// C### 半音音阶（C### C#### D### D#### E### F### F#### G### G#### A### A#### B###）
//     @Test("C### Chromatic")
//     func testCTripleSharpChromatic() {
//         let root = Note(letter: .C, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, 3, 63),  // C###
//             (.C, 4, 64),  // C####
//             (.D, 3, 65),  // D###
//             (.D, 4, 66),  // D####
//             (.E, 3, 67),  // E###
//             (.F, 3, 68),  // F###
//             (.F, 4, 69),  // F####
//             (.G, 3, 70),  // G###
//             (.G, 4, 71),  // G####
//             (.A, 3, 72),  // A###
//             (.A, 4, 73),  // A####
//             (.B, 3, 74)   // B###
//         ])
//     }

//     /// Cbbb 半音音阶（Cbbb Cbb Dbbb Dbb Ebbb Fbbb Fbb Gbbb Gbb Abbb Abb Bbbb）
//     @Test("Cbbb Chromatic")
//     func testCTripleFlatChromatic() {
//         let root = Note(letter: .C, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.C, -3, 57),  // Cbbb
//             (.C, -2, 58),  // Cbb
//             (.D, -3, 59),  // Dbbb
//             (.D, -2, 60),  // Dbb
//             (.E, -3, 61),  // Ebbb
//             (.F, -3, 62),  // Fbbb
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68)   // Bbbb
//         ])
//     }

//     // MARK: - D 音的 7 种变化

//     /// D 半音音阶（D D# E E# F# G G# A A# B B# C#）
//     @Test("D Chromatic")
//     func testDChromatic() {
//         let root = Note(letter: .D, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, 0, 62),  // D
//             (.D, 1, 63),  // D#
//             (.E, 0, 64),  // E
//             (.E, 1, 65),  // E#
//             (.F, 1, 66),  // F#
//             (.G, 0, 67),  // G
//             (.G, 1, 68),  // G#
//             (.A, 0, 69),  // A
//             (.A, 1, 70),  // A#
//             (.B, 0, 71),  // B
//             (.B, 1, 72),  // B#
//             (.C, 1, 73)   // C#
//         ])
//     }

//     /// D# 半音音阶（D# D## E# E## F## G# G## A# A## B# B## C##）
//     @Test("D# Chromatic")
//     func testDSharpChromatic() {
//         let root = Note(letter: .D, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, 1, 63),  // D#
//             (.D, 2, 64),  // D##
//             (.E, 1, 65),  // E#
//             (.E, 2, 66),  // E##
//             (.F, 2, 67),  // F##
//             (.G, 1, 68),  // G#
//             (.G, 2, 69),  // G##
//             (.A, 1, 70),  // A#
//             (.A, 2, 71),  // A##
//             (.B, 1, 72),  // B#
//             (.B, 2, 73),  // B##
//             (.C, 2, 74)   // C##
//         ])
//     }

//     /// Db 半音音阶（Db D Eb E F Gb G Ab A Bb B C）
//     @Test("Db Chromatic")
//     func testDFlatChromatic() {
//         let root = Note(letter: .D, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, -1, 61),  // Db
//             (.D, 0, 62),  // D
//             (.E, -1, 63),  // Eb
//             (.E, 0, 64),  // E
//             (.F, 0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.G, 0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.A, 0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.B, 0, 71),  // B
//             (.C, 0, 72)   // C
//         ])
//     }

//     /// D## 半音音阶（D## D### E## E### F### G## G### A## A### B## B### C###）
//     @Test("D## Chromatic")
//     func testDDoubleSharpChromatic() {
//         let root = Note(letter: .D, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, 2, 64),  // D##
//             (.D, 3, 65),  // D###
//             (.E, 2, 66),  // E##
//             (.E, 3, 67),  // E###
//             (.F, 3, 68),  // F###
//             (.G, 2, 69),  // G##
//             (.G, 3, 70),  // G###
//             (.A, 2, 71),  // A##
//             (.A, 3, 72),  // A###
//             (.B, 2, 73),  // B##
//             (.B, 3, 74),  // B###
//             (.C, 3, 75)   // C###
//         ])
//     }

//     /// Dbb 半音音阶（Dbb Db Ebb Eb Fb Gbb Gb Abb Ab Bbb Bb Cb）
//     @Test("Dbb Chromatic")
//     func testDDoubleFlatChromatic() {
//         let root = Note(letter: .D, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, -2, 60),  // Dbb
//             (.D, -1, 61),  // Db
//             (.E, -2, 62),  // Ebb
//             (.E, -1, 63),  // Eb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71)   // Cb
//         ])
//     }

//     /// D### 半音音阶（D### D#### E### E#### F#### G### G#### A### A#### B### B#### C####）
//     @Test("D### Chromatic")
//     func testDTripleSharpChromatic() {
//         let root = Note(letter: .D, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, 3, 65),  // D###
//             (.D, 4, 66),  // D####
//             (.E, 3, 67),  // E###
//             (.E, 4, 68),  // E####
//             (.F, 4, 69),  // F####
//             (.G, 3, 70),  // G###
//             (.G, 4, 71),  // G####
//             (.A, 3, 72),  // A###
//             (.A, 4, 73),  // A####
//             (.B, 3, 74),  // B###
//             (.B, 4, 75),  // B####
//             (.C, 4, 76)   // C####
//         ])
//     }

//     /// Dbbb 半音音阶（Dbbb Dbb Ebbb Ebb Fbb Gbbb Gbb Abbb Abb Bbbb Bbb Cbb）
//     @Test("Dbbb Chromatic")
//     func testDTripleFlatChromatic() {
//         let root = Note(letter: .D, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.D, -3, 59),  // Dbbb
//             (.D, -2, 60),  // Dbb
//             (.E, -3, 61),  // Ebbb
//             (.E, -2, 62),  // Ebb
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70)   // Cbb
//         ])
//     }

//     // MARK: - E 音的 7 种变化

//     /// E 半音音阶（E E# F# F## G# A A# B B# C# C## D#）
//     @Test("E Chromatic")
//     func testEChromatic() {
//         let root = Note(letter: .E, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, 0, 64),  // E
//             (.E, 1, 65),  // E#
//             (.F, 1, 66),  // F#
//             (.F, 2, 67),  // F##
//             (.G, 1, 68),  // G#
//             (.A, 0, 69),  // A
//             (.A, 1, 70),  // A#
//             (.B, 0, 71),  // B
//             (.B, 1, 72),  // B#
//             (.C, 1, 73),  // C#
//             (.C, 2, 74),  // C##
//             (.D, 1, 75)   // D#
//         ])
//     }

//     /// E# 半音音阶（E# E## F## F### G## A# A## B# B## C## C### D##）
//     @Test("E# Chromatic")
//     func testESharpChromatic() {
//         let root = Note(letter: .E, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, 1, 65),  // E#
//             (.E, 2, 66),  // E##
//             (.F, 2, 67),  // F##
//             (.F, 3, 68),  // F###
//             (.G, 2, 69),  // G##
//             (.A, 1, 70),  // A#
//             (.A, 2, 71),  // A##
//             (.B, 1, 72),  // B#
//             (.B, 2, 73),  // B##
//             (.C, 2, 74),  // C##
//             (.C, 3, 75),  // C###
//             (.D, 2, 76)   // D##
//         ])
//     }

//     /// Eb 半音音阶（Eb E F F# G Ab A Bb B C C# D）
//     @Test("Eb Chromatic")
//     func testEFlatChromatic() {
//         let root = Note(letter: .E, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, -1, 63),  // Eb
//             (.E, 0, 64),  // E
//             (.F, 0, 65),  // F
//             (.F, 1, 66),  // F#
//             (.G, 0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.A, 0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.B, 0, 71),  // B
//             (.C, 0, 72),  // C
//             (.C, 1, 73),  // C#
//             (.D, 0, 74)   // D
//         ])
//     }

//     /// E## 半音音阶（E## E### F### F#### G### A## A### B## B### C### C#### D###）
//     @Test("E## Chromatic")
//     func testEDoubleSharpChromatic() {
//         let root = Note(letter: .E, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, 2, 66),  // E##
//             (.E, 3, 67),  // E###
//             (.F, 3, 68),  // F###
//             (.F, 4, 69),  // F####
//             (.G, 3, 70),  // G###
//             (.A, 2, 71),  // A##
//             (.A, 3, 72),  // A###
//             (.B, 2, 73),  // B##
//             (.B, 3, 74),  // B###
//             (.C, 3, 75),  // C###
//             (.C, 4, 76),  // C####
//             (.D, 3, 77)   // D###
//         ])
//     }

//     /// Ebb 半音音阶（Ebb Eb Fb F Gb Abb Ab Bbb Bb Cb C Db）
//     @Test("Ebb Chromatic")
//     func testEDoubleFlatChromatic() {
//         let root = Note(letter: .E, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, -2, 62),  // Ebb
//             (.E, -1, 63),  // Eb
//             (.F, -1, 64),  // Fb
//             (.F, 0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.C, 0, 72),  // C
//             (.D, -1, 73)   // Db
//         ])
//     }

//     /// E### 半音音阶（E### E#### F#### F##### G#### A### A#### B### B#### C#### C##### D####）
//     @Test("E### Chromatic")
//     func testETripleSharpChromatic() {
//         let root = Note(letter: .E, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, 3, 67),  // E###
//             (.E, 4, 68),  // E####
//             (.F, 4, 69),  // F####
//             (.F, 5, 70),  // F#####
//             (.G, 4, 71),  // G####
//             (.A, 3, 72),  // A###
//             (.A, 4, 73),  // A####
//             (.B, 3, 74),  // B###
//             (.B, 4, 75),  // B####
//             (.C, 4, 76),  // C####
//             (.C, 5, 77),  // C#####
//             (.D, 4, 78)   // D####
//         ])
//     }

//     /// Ebbb 半音音阶（Ebbb Ebb Fbb Fb Gbb Abbb Abb Bbbb Bbb Cbb Cb Dbb）
//     @Test("Ebbb Chromatic")
//     func testETripleFlatChromatic() {
//         let root = Note(letter: .E, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.E, -3, 61),  // Ebbb
//             (.E, -2, 62),  // Ebb
//             (.F, -2, 63),  // Fbb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72)   // Dbb
//         ])
//     }

//     // MARK: - F 音的 7 种变化

//     /// F 半音音阶（F F# G G# A Bb B C C# D D# E）
//     @Test("F Chromatic")
//     func testFChromatic() {
//         let root = Note(letter: .F, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, 0, 65),  // F
//             (.F, 1, 66),  // F#
//             (.G, 0, 67),  // G
//             (.G, 1, 68),  // G#
//             (.A, 0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.B, 0, 71),  // B
//             (.C, 0, 72),  // C
//             (.C, 1, 73),  // C#
//             (.D, 0, 74),  // D
//             (.D, 1, 75),  // D#
//             (.E, 0, 76)   // E
//         ])
//     }

//     /// F# 半音音阶（F# F## G# G## A# B B# C# C## D# D## E#）
//     @Test("F# Chromatic")
//     func testFSharpChromatic() {
//         let root = Note(letter: .F, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, 1, 66),  // F#
//             (.F, 2, 67),  // F##
//             (.G, 1, 68),  // G#
//             (.G, 2, 69),  // G##
//             (.A, 1, 70),  // A#
//             (.B, 0, 71),  // B
//             (.B, 1, 72),  // B#
//             (.C, 1, 73),  // C#
//             (.C, 2, 74),  // C##
//             (.D, 1, 75),  // D#
//             (.D, 2, 76),  // D##
//             (.E, 1, 77)   // E#
//         ])
//     }

//     /// Fb 半音音阶（Fb F Gb G Ab Bbb Bb Cb C Db D Eb）
//     @Test("Fb Chromatic")
//     func testFFlatChromatic() {
//         let root = Note(letter: .F, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, -1, 64),  // Fb
//             (.F, 0, 65),  // F
//             (.G, -1, 66),  // Gb
//             (.G, 0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.C, 0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.D, 0, 74),  // D
//             (.E, -1, 75)   // Eb
//         ])
//     }

//     /// F## 半音音阶（F## F### G## G### A## B# B## C## C### D## D### E##）
//     @Test("F## Chromatic")
//     func testFDoubleSharpChromatic() {
//         let root = Note(letter: .F, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, 2, 67),  // F##
//             (.F, 3, 68),  // F###
//             (.G, 2, 69),  // G##
//             (.G, 3, 70),  // G###
//             (.A, 2, 71),  // A##
//             (.B, 1, 72),  // B#
//             (.B, 2, 73),  // B##
//             (.C, 2, 74),  // C##
//             (.C, 3, 75),  // C###
//             (.D, 2, 76),  // D##
//             (.D, 3, 77),  // D###
//             (.E, 2, 78)   // E##
//         ])
//     }

//     /// Fbb 半音音阶（Fbb Fb Gbb Gb Abb Bbbb Bbb Cbb Cb Dbb Db Ebb）
//     @Test("Fbb Chromatic")
//     func testFDoubleFlatChromatic() {
//         let root = Note(letter: .F, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, -2, 63),  // Fbb
//             (.F, -1, 64),  // Fb
//             (.G, -2, 65),  // Gbb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74)   // Ebb
//         ])
//     }

//     /// F### 半音音阶（F### F#### G### G#### A### B## B### C### C#### D### D#### E###）
//     @Test("F### Chromatic")
//     func testFTripleSharpChromatic() {
//         let root = Note(letter: .F, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, 3, 68),  // F###
//             (.F, 4, 69),  // F####
//             (.G, 3, 70),  // G###
//             (.G, 4, 71),  // G####
//             (.A, 3, 72),  // A###
//             (.B, 2, 73),  // B##
//             (.B, 3, 74),  // B###
//             (.C, 3, 75),  // C###
//             (.C, 4, 76),  // C####
//             (.D, 3, 77),  // D###
//             (.D, 4, 78),  // D####
//             (.E, 3, 79)   // E###
//         ])
//     }

//     /// Fbbb 半音音阶（Fbbb Fbb Gbbb Gbb Abbb Bbbbb Bbbb Cbbb Cbb Dbbb Dbb Ebbb）
//     @Test("Fbbb Chromatic")
//     func testFTripleFlatChromatic() {
//         let root = Note(letter: .F, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.F, -3, 62),  // Fbbb
//             (.F, -2, 63),  // Fbb
//             (.G, -3, 64),  // Gbbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.B, -4, 67),  // Bbbbb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73)   // Ebbb
//         ])
//     }

//     // MARK: - G 音的 7 种变化

//     /// G 半音音阶（G G# A A# B C C# D D# E E# F#）
//     @Test("G Chromatic")
//     func testGChromatic() {
//         let root = Note(letter: .G, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, 0, 67),  // G
//             (.G, 1, 68),  // G#
//             (.A, 0, 69),  // A
//             (.A, 1, 70),  // A#
//             (.B, 0, 71),  // B
//             (.C, 0, 72),  // C
//             (.C, 1, 73),  // C#
//             (.D, 0, 74),  // D
//             (.D, 1, 75),  // D#
//             (.E, 0, 76),  // E
//             (.E, 1, 77),  // E#
//             (.F, 1, 78)   // F#
//         ])
//     }

//     /// G# 半音音阶（G# G## A# A## B# C# C## D# D## E# E## F##）
//     @Test("G# Chromatic")
//     func testGSharpChromatic() {
//         let root = Note(letter: .G, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, 1, 68),  // G#
//             (.G, 2, 69),  // G##
//             (.A, 1, 70),  // A#
//             (.A, 2, 71),  // A##
//             (.B, 1, 72),  // B#
//             (.C, 1, 73),  // C#
//             (.C, 2, 74),  // C##
//             (.D, 1, 75),  // D#
//             (.D, 2, 76),  // D##
//             (.E, 1, 77),  // E#
//             (.E, 2, 78),  // E##
//             (.F, 2, 79)   // F##
//         ])
//     }

//     /// Gb 半音音阶（Gb G Ab A Bb Cb C Db D Eb E F）
//     @Test("Gb Chromatic")
//     func testGFlatChromatic() {
//         let root = Note(letter: .G, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, -1, 66),  // Gb
//             (.G, 0, 67),  // G
//             (.A, -1, 68),  // Ab
//             (.A, 0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.C, 0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.D, 0, 74),  // D
//             (.E, -1, 75),  // Eb
//             (.E, 0, 76),  // E
//             (.F, 0, 77)   // F
//         ])
//     }

//     /// G## 半音音阶（G## G### A## A### B## C## C### D## D### E## E### F###）
//     @Test("G## Chromatic")
//     func testGDoubleSharpChromatic() {
//         let root = Note(letter: .G, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, 2, 69),  // G##
//             (.G, 3, 70),  // G###
//             (.A, 2, 71),  // A##
//             (.A, 3, 72),  // A###
//             (.B, 2, 73),  // B##
//             (.C, 2, 74),  // C##
//             (.C, 3, 75),  // C###
//             (.D, 2, 76),  // D##
//             (.D, 3, 77),  // D###
//             (.E, 2, 78),  // E##
//             (.E, 3, 79),  // E###
//             (.F, 3, 80)   // F###
//         ])
//     }

//     /// Gbb 半音音阶（Gbb Gb Abb Ab Bbb Cbb Cb Dbb Db Ebb Eb Fb）
//     @Test("Gbb Chromatic")
//     func testGDoubleFlatChromatic() {
//         let root = Note(letter: .G, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, -2, 65),  // Gbb
//             (.G, -1, 66),  // Gb
//             (.A, -2, 67),  // Abb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74),  // Ebb
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76)   // Fb
//         ])
//     }

//     /// G### 半音音阶（G### G#### A### A#### B### C### C#### D### D#### E### E#### F####）
//     @Test("G### Chromatic")
//     func testGTripleSharpChromatic() {
//         let root = Note(letter: .G, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, 3, 70),  // G###
//             (.G, 4, 71),  // G####
//             (.A, 3, 72),  // A###
//             (.A, 4, 73),  // A####
//             (.B, 3, 74),  // B###
//             (.C, 3, 75),  // C###
//             (.C, 4, 76),  // C####
//             (.D, 3, 77),  // D###
//             (.D, 4, 78),  // D####
//             (.E, 3, 79),  // E###
//             (.E, 4, 80),  // E####
//             (.F, 4, 81)   // F####
//         ])
//     }

//     /// Gbbb 半音音阶（Gbbb Gbb Abbb Abb Bbbb Cbbb Cbb Dbbb Dbb Ebbb Ebb Fbb）
//     @Test("Gbbb Chromatic")
//     func testGTripleFlatChromatic() {
//         let root = Note(letter: .G, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.G, -3, 64),  // Gbbb
//             (.G, -2, 65),  // Gbb
//             (.A, -3, 66),  // Abbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.C, -3, 69),  // Cbbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73),  // Ebbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75)   // Fbb
//         ])
//     }

//     // MARK: - A 音的 7 种变化

//     /// A 半音音阶（A A# B B# C# D D# E E# F# F## G#）
//     @Test("A Chromatic")
//     func testAChromatic() {
//         let root = Note(letter: .A, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, 0, 69),  // A
//             (.A, 1, 70),  // A#
//             (.B, 0, 71),  // B
//             (.B, 1, 72),  // B#
//             (.C, 1, 73),  // C#
//             (.D, 0, 74),  // D
//             (.D, 1, 75),  // D#
//             (.E, 0, 76),  // E
//             (.E, 1, 77),  // E#
//             (.F, 1, 78),  // F#
//             (.F, 2, 79),  // F##
//             (.G, 1, 80)   // G#
//         ])
//     }

//     /// A# 半音音阶（A# A## B# B## C## D# D## E# E## F## F### G##）
//     @Test("A# Chromatic")
//     func testASharpChromatic() {
//         let root = Note(letter: .A, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, 1, 70),  // A#
//             (.A, 2, 71),  // A##
//             (.B, 1, 72),  // B#
//             (.B, 2, 73),  // B##
//             (.C, 2, 74),  // C##
//             (.D, 1, 75),  // D#
//             (.D, 2, 76),  // D##
//             (.E, 1, 77),  // E#
//             (.E, 2, 78),  // E##
//             (.F, 2, 79),  // F##
//             (.F, 3, 80),  // F###
//             (.G, 2, 81)   // G##
//         ])
//     }

//     /// Ab 半音音阶（Ab A Bb B C Db D Eb E F F# G）
//     @Test("Ab Chromatic")
//     func testAFlatChromatic() {
//         let root = Note(letter: .A, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, -1, 68),  // Ab
//             (.A, 0, 69),  // A
//             (.B, -1, 70),  // Bb
//             (.B, 0, 71),  // B
//             (.C, 0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.D, 0, 74),  // D
//             (.E, -1, 75),  // Eb
//             (.E, 0, 76),  // E
//             (.F, 0, 77),  // F
//             (.F, 1, 78),  // F#
//             (.G, 0, 79)   // G
//         ])
//     }

//     /// A## 半音音阶（A## A### B## B### C### D## D### E## E### F### F#### G###）
//     @Test("A## Chromatic")
//     func testADoubleSharpChromatic() {
//         let root = Note(letter: .A, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, 2, 71),  // A##
//             (.A, 3, 72),  // A###
//             (.B, 2, 73),  // B##
//             (.B, 3, 74),  // B###
//             (.C, 3, 75),  // C###
//             (.D, 2, 76),  // D##
//             (.D, 3, 77),  // D###
//             (.E, 2, 78),  // E##
//             (.E, 3, 79),  // E###
//             (.F, 3, 80),  // F###
//             (.F, 4, 81),  // F####
//             (.G, 3, 82)   // G###
//         ])
//     }

//     /// Abb 半音音阶（Abb Ab Bbb Bb Cb Dbb Db Ebb Eb Fb F Gb）
//     @Test("Abb Chromatic")
//     func testADoubleFlatChromatic() {
//         let root = Note(letter: .A, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, -2, 67),  // Abb
//             (.A, -1, 68),  // Ab
//             (.B, -2, 69),  // Bbb
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.D, -1, 73),  // Db
//             (.E, -2, 74),  // Ebb
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76),  // Fb
//             (.F, 0, 77),  // F
//             (.G, -1, 78)   // Gb
//         ])
//     }

//     /// A### 半音音阶（A### A#### B### B#### C#### D### D#### E### E#### F#### F##### G####）
//     @Test("A### Chromatic")
//     func testATripleSharpChromatic() {
//         let root = Note(letter: .A, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, 3, 72),  // A###
//             (.A, 4, 73),  // A####
//             (.B, 3, 74),  // B###
//             (.B, 4, 75),  // B####
//             (.C, 4, 76),  // C####
//             (.D, 3, 77),  // D###
//             (.D, 4, 78),  // D####
//             (.E, 3, 79),  // E###
//             (.E, 4, 80),  // E####
//             (.F, 4, 81),  // F####
//             (.F, 5, 82),  // F#####
//             (.G, 4, 83)   // G####
//         ])
//     }

//     /// Abbb 半音音阶（Abbb Abb Bbbb Bbb Cbb Dbbb Dbb Ebbb Ebb Fbb Fb Gbb）
//     @Test("Abbb Chromatic")
//     func testATripleFlatChromatic() {
//         let root = Note(letter: .A, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.A, -3, 66),  // Abbb
//             (.A, -2, 67),  // Abb
//             (.B, -3, 68),  // Bbbb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.D, -3, 71),  // Dbbb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73),  // Ebbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75),  // Fbb
//             (.F, -1, 76),  // Fb
//             (.G, -2, 77)   // Gbb
//         ])
//     }

//     // MARK: - B 音的 7 种变化

//     /// B 半音音阶（B B# C# C## D# E E# F# F## G# G## A#）
//     @Test("B Chromatic")
//     func testBChromatic() {
//         let root = Note(letter: .B, accidental: 0, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, 0, 71),  // B
//             (.B, 1, 72),  // B#
//             (.C, 1, 73),  // C#
//             (.C, 2, 74),  // C##
//             (.D, 1, 75),  // D#
//             (.E, 0, 76),  // E
//             (.E, 1, 77),  // E#
//             (.F, 1, 78),  // F#
//             (.F, 2, 79),  // F##
//             (.G, 1, 80),  // G#
//             (.G, 2, 81),  // G##
//             (.A, 1, 82)   // A#
//         ])
//     }

//     /// B# 半音音阶（B# B## C## C### D## E# E## F## F### G## G### A##）
//     @Test("B# Chromatic")
//     func testBSharpChromatic() {
//         let root = Note(letter: .B, accidental: 1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, 1, 72),  // B#
//             (.B, 2, 73),  // B##
//             (.C, 2, 74),  // C##
//             (.C, 3, 75),  // C###
//             (.D, 2, 76),  // D##
//             (.E, 1, 77),  // E#
//             (.E, 2, 78),  // E##
//             (.F, 2, 79),  // F##
//             (.F, 3, 80),  // F###
//             (.G, 2, 81),  // G##
//             (.G, 3, 82),  // G###
//             (.A, 2, 83)   // A##
//         ])
//     }

//     /// Bb 半音音阶（Bb B C C# D Eb E F F# G G# A）
//     @Test("Bb Chromatic")
//     func testBFlatChromatic() {
//         let root = Note(letter: .B, accidental: -1, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, -1, 70),  // Bb
//             (.B, 0, 71),  // B
//             (.C, 0, 72),  // C
//             (.C, 1, 73),  // C#
//             (.D, 0, 74),  // D
//             (.E, -1, 75),  // Eb
//             (.E, 0, 76),  // E
//             (.F, 0, 77),  // F
//             (.F, 1, 78),  // F#
//             (.G, 0, 79),  // G
//             (.G, 1, 80),  // G#
//             (.A, 0, 81)   // A
//         ])
//     }

//     /// B## 半音音阶（B## B### C### C#### D### E## E### F### F#### G### G#### A###）
//     @Test("B## Chromatic")
//     func testBDoubleSharpChromatic() {
//         let root = Note(letter: .B, accidental: 2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, 2, 73),  // B##
//             (.B, 3, 74),  // B###
//             (.C, 3, 75),  // C###
//             (.C, 4, 76),  // C####
//             (.D, 3, 77),  // D###
//             (.E, 2, 78),  // E##
//             (.E, 3, 79),  // E###
//             (.F, 3, 80),  // F###
//             (.F, 4, 81),  // F####
//             (.G, 3, 82),  // G###
//             (.G, 4, 83),  // G####
//             (.A, 3, 84)   // A###
//         ])
//     }

//     /// Bbb 半音音阶（Bbb Bb Cb C Db Ebb Eb Fb F Gb G Ab）
//     @Test("Bbb Chromatic")
//     func testBDoubleFlatChromatic() {
//         let root = Note(letter: .B, accidental: -2, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, -2, 69),  // Bbb
//             (.B, -1, 70),  // Bb
//             (.C, -1, 71),  // Cb
//             (.C, 0, 72),  // C
//             (.D, -1, 73),  // Db
//             (.E, -2, 74),  // Ebb
//             (.E, -1, 75),  // Eb
//             (.F, -1, 76),  // Fb
//             (.F, 0, 77),  // F
//             (.G, -1, 78),  // Gb
//             (.G, 0, 79),  // G
//             (.A, -1, 80)   // Ab
//         ])
//     }

//     /// B### 半音音阶（B### B#### C#### C##### D#### E### E#### F#### F##### G#### G##### A####）
//     @Test("B### Chromatic")
//     func testBTripleSharpChromatic() {
//         let root = Note(letter: .B, accidental: 3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, 3, 74),  // B###
//             (.B, 4, 75),  // B####
//             (.C, 4, 76),  // C####
//             (.C, 5, 77),  // C#####
//             (.D, 4, 78),  // D####
//             (.E, 3, 79),  // E###
//             (.E, 4, 80),  // E####
//             (.F, 4, 81),  // F####
//             (.F, 5, 82),  // F#####
//             (.G, 4, 83),  // G####
//             (.G, 5, 84),  // G#####
//             (.A, 4, 85)   // A####
//         ])
//     }

//     /// Bbbb 半音音阶（Bbbb Bbb Cbb Cb Dbb Ebbb Ebb Fbb Fb Gbb Gb Abb）
//     @Test("Bbbb Chromatic")
//     func testBTripleFlatChromatic() {
//         let root = Note(letter: .B, accidental: -3, octave: 4)
//         verifyChromaticScale(rootNote: root, expectedNotes: [
//             (.B, -3, 68),  // Bbbb
//             (.B, -2, 69),  // Bbb
//             (.C, -2, 70),  // Cbb
//             (.C, -1, 71),  // Cb
//             (.D, -2, 72),  // Dbb
//             (.E, -3, 73),  // Ebbb
//             (.E, -2, 74),  // Ebb
//             (.F, -2, 75),  // Fbb
//             (.F, -1, 76),  // Fb
//             (.G, -2, 77),  // Gbb
//             (.G, -1, 78),  // Gb
//             (.A, -2, 79)   // Abb
//         ])
//     }
// }
