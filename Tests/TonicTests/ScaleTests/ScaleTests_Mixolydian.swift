//
//  MixolydianScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  混合利底亚音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Mixolydian Scale Comprehensive Tests")
struct MixolydianScaleTests {

    // MARK: - Helper Methods

    /// 验证混合利底亚音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
    func verifyMixolydianScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .mixolydian)
        let notes = scale.allNotes()

        #expect(notes.count == 7)

        for (index, expected) in expectedNotes.enumerated() {
            let note = notes[index]
            #expect(note.letter == expected.0,
                   "Note \(index + 1): expected letter \(expected.0.rawValue), got \(note.letter.rawValue)")
            #expect(note.accidental == expected.1,
                   "Note \(index + 1): expected accidental \(expected.1), got \(note.accidental)")
            #expect(note.pitch == expected.2,
                   "Note \(index + 1): expected pitch \(expected.2), got \(note.pitch)")
        }
    }

    // MARK: - C 音的 7 种变化

    /// C 混合利底亚音阶（C D E F G A Bb）
    @Test("C Mixolydian")
    func testCMixolydian() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C,  0, 60),  // C
            (.D,  0, 62),  // D
            (.E,  0, 64),  // E
            (.F,  0, 65),  // F
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B, -1, 70)  // Bb
        ])
    }

    /// C# 混合利底亚音阶（C# D# E# F# G# A# B）
    @Test("C# Mixolydian")
    func testCSharpMixolydian() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C,  1, 61),  // C#
            (.D,  1, 63),  // D#
            (.E,  1, 65),  // E#
            (.F,  1, 66),  // F#
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  0, 71)  // B
        ])
    }

    /// Cb 混合利底亚音阶（Cb Db Eb Fb Gb Ab Bbb）
    @Test("Cb Mixolydian")
    func testCFlatMixolydian() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69)  // Bbb
        ])
    }

    /// C## 混合利底亚音阶（C## D## E## F## G## A## B#）
    @Test("C## Mixolydian")
    func testCDoubleSharpMixolydian() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C,  2, 62),  // C##
            (.D,  2, 64),  // D##
            (.E,  2, 66),  // E##
            (.F,  2, 67),  // F##
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  1, 72)  // B#
        ])
    }

    /// Cbb 混合利底亚音阶（Cbb Dbb Ebb Fbb Gbb Abb Bbbb）
    @Test("Cbb Mixolydian")
    func testCDoubleFlatMixolydian() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68)  // Bbbb
        ])
    }

    /// C### 混合利底亚音阶（C### D### E### F### G### A### B##）
    @Test("C### Mixolydian")
    func testCTripleSharpMixolydian() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C,  3, 63),  // C###
            (.D,  3, 65),  // D###
            (.E,  3, 67),  // E###
            (.F,  3, 68),  // F###
            (.G,  3, 70),  // G###
            (.A,  3, 72),  // A###
            (.B,  2, 73)  // B##
        ])
    }

    /// Cbbb 混合利底亚音阶（Cbbb Dbbb Ebbb Fbbb Gbbb Abbb B）
    @Test("Cbbb Mixolydian")
    func testCTripleFlatMixolydian() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67)  // B
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 混合利底亚音阶（D E F# G A B C）
    @Test("D Mixolydian")
    func testDMixolydian() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D,  0, 62),  // D
            (.E,  0, 64),  // E
            (.F,  1, 66),  // F#
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  0, 72)  // C
        ])
    }

    /// D# 混合利底亚音阶（D# E# F## G# A# B# C#）
    @Test("D# Mixolydian")
    func testDSharpMixolydian() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D,  1, 63),  // D#
            (.E,  1, 65),  // E#
            (.F,  2, 67),  // F##
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  1, 73)  // C#
        ])
    }

    /// Db 混合利底亚音阶（Db Eb F Gb Ab Bb Cb）
    @Test("Db Mixolydian")
    func testDFlatMixolydian() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F,  0, 65),  // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71)  // Cb
        ])
    }

    /// D## 混合利底亚音阶（D## E## F### G## A## B## C##）
    @Test("D## Mixolydian")
    func testDDoubleSharpMixolydian() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D,  2, 64),  // D##
            (.E,  2, 66),  // E##
            (.F,  3, 68),  // F###
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  2, 74)  // C##
        ])
    }

    /// Dbb 混合利底亚音阶（Dbb Ebb Fb Gbb Abb Bbb Cbb）
    @Test("Dbb Mixolydian")
    func testDDoubleFlatMixolydian() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70)  // Cbb
        ])
    }

    /// D### 混合利底亚音阶（D### E### F G### A### B### C###）
    @Test("D### Mixolydian")
    func testDTripleSharpMixolydian() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D,  3, 65),  // D###
            (.E,  3, 67),  // E###
            (.F,  4, 69),  // F
            (.G,  3, 70),  // G###
            (.A,  3, 72),  // A###
            (.B,  3, 74),  // B###
            (.C,  3, 75)  // C###
        ])
    }

    /// Dbbb 混合利底亚音阶（Dbbb Ebbb Fbb Gbbb Abbb Bbbb Cbbb）
    @Test("Dbbb Mixolydian")
    func testDTripleFlatMixolydian() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69)  // Cbbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 混合利底亚音阶（E F# G# A B C# D）
    @Test("E Mixolydian")
    func testEMixolydian() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E,  0, 64),  // E
            (.F,  1, 66),  // F#
            (.G,  1, 68),  // G#
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  0, 74)  // D
        ])
    }

    /// E# 混合利底亚音阶（E# F## G## A# B# C## D#）
    @Test("E# Mixolydian")
    func testESharpMixolydian() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E,  1, 65),  // E#
            (.F,  2, 67),  // F##
            (.G,  2, 69),  // G##
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  1, 75)  // D#
        ])
    }

    /// Eb 混合利底亚音阶（Eb F G Ab Bb C Db）
    @Test("Eb Mixolydian")
    func testEFlatMixolydian() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F,  0, 65),  // F
            (.G,  0, 67),  // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D, -1, 73)  // Db
        ])
    }

    /// E## 混合利底亚音阶（E## F### G### A## B## C### D##）
    @Test("E## Mixolydian")
    func testEDoubleSharpMixolydian() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E,  2, 66),  // E##
            (.F,  3, 68),  // F###
            (.G,  3, 70),  // G###
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  2, 76)  // D##
        ])
    }

    /// Ebb 混合利底亚音阶（Ebb Fb Gb Abb Bbb Cb Dbb）
    @Test("Ebb Mixolydian")
    func testEDoubleFlatMixolydian() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72)  // Dbb
        ])
    }

    /// E### 混合利底亚音阶（E### F G A### B### C D###）
    @Test("E### Mixolydian")
    func testETripleSharpMixolydian() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E,  3, 67),  // E###
            (.F,  4, 69),  // F
            (.G,  4, 71),  // G
            (.A,  3, 72),  // A###
            (.B,  3, 74),  // B###
            (.C,  4, 76),  // C
            (.D,  3, 77)  // D###
        ])
    }

    /// Ebbb 混合利底亚音阶（Ebbb Fbb Gbb Abbb Bbbb Cbb Dbbb）
    @Test("Ebbb Mixolydian")
    func testETripleFlatMixolydian() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71)  // Dbbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 混合利底亚音阶（F G A Bb C D Eb）
    @Test("F Mixolydian")
    func testFMixolydian() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F,  0, 65),  // F
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D,  0, 74),  // D
            (.E, -1, 75)  // Eb
        ])
    }

    /// F# 混合利底亚音阶（F# G# A# B C# D# E）
    @Test("F# Mixolydian")
    func testFSharpMixolydian() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F,  1, 66),  // F#
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  1, 75),  // D#
            (.E,  0, 76)  // E
        ])
    }

    /// Fb 混合利底亚音阶（Fb Gb Ab Bbb Cb Db Ebb）
    @Test("Fb Mixolydian")
    func testFFlatMixolydian() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74)  // Ebb
        ])
    }

    /// F## 混合利底亚音阶（F## G## A## B# C## D## E#）
    @Test("F## Mixolydian")
    func testFDoubleSharpMixolydian() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F,  2, 67),  // F##
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  2, 76),  // D##
            (.E,  1, 77)  // E#
        ])
    }

    /// Fbb 混合利底亚音阶（Fbb Gbb Abb Bbbb Cbb Dbb Ebbb）
    @Test("Fbb Mixolydian")
    func testFDoubleFlatMixolydian() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73)  // Ebbb
        ])
    }

    /// F### 混合利底亚音阶（F### G### A### B## C### D### E##）
    @Test("F### Mixolydian")
    func testFTripleSharpMixolydian() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F,  3, 68),  // F###
            (.G,  3, 70),  // G###
            (.A,  3, 72),  // A###
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  3, 77),  // D###
            (.E,  2, 78)  // E##
        ])
    }

    /// Fbbb 混合利底亚音阶（Fbbb Gbbb Abbb B Cbbb Dbbb E）
    @Test("Fbbb Mixolydian")
    func testFTripleFlatMixolydian() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // B
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -4, 72)  // E
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 混合利底亚音阶（G A B C D E F）
    @Test("G Mixolydian")
    func testGMixolydian() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  0, 72),  // C
            (.D,  0, 74),  // D
            (.E,  0, 76),  // E
            (.F,  0, 77)  // F
        ])
    }

    /// G# 混合利底亚音阶（G# A# B# C# D# E# F#）
    @Test("G# Mixolydian")
    func testGSharpMixolydian() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  1, 73),  // C#
            (.D,  1, 75),  // D#
            (.E,  1, 77),  // E#
            (.F,  1, 78)  // F#
        ])
    }

    /// Gb 混合利底亚音阶（Gb Ab Bb Cb Db Eb Fb）
    @Test("Gb Mixolydian")
    func testGFlatMixolydian() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, -1, 76)  // Fb
        ])
    }

    /// G## 混合利底亚音阶（G## A## B## C## D## E## F##）
    @Test("G## Mixolydian")
    func testGDoubleSharpMixolydian() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  2, 74),  // C##
            (.D,  2, 76),  // D##
            (.E,  2, 78),  // E##
            (.F,  2, 79)  // F##
        ])
    }

    /// Gbb 混合利底亚音阶（Gbb Abb Bbb Cbb Dbb Ebb Fbb）
    @Test("Gbb Mixolydian")
    func testGDoubleFlatMixolydian() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75)  // Fbb
        ])
    }

    /// G### 混合利底亚音阶（G### A### B### C### D### E### F###）
    @Test("G### Mixolydian")
    func testGTripleSharpMixolydian() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G,  3, 70),  // G###
            (.A,  3, 72),  // A###
            (.B,  3, 74),  // B###
            (.C,  3, 75),  // C###
            (.D,  3, 77),  // D###
            (.E,  3, 79),  // E###
            (.F,  3, 80)  // F###
        ])
    }

    /// Gbbb 混合利底亚音阶（Gbbb Abbb Bbbb Cbbb Dbbb Ebbb Fbbb）
    @Test("Gbbb Mixolydian")
    func testGTripleFlatMixolydian() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -3, 74)  // Fbbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 混合利底亚音阶（A B C# D E F# G）
    @Test("A Mixolydian")
    func testAMixolydian() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  0, 74),  // D
            (.E,  0, 76),  // E
            (.F,  1, 78),  // F#
            (.G,  0, 79)  // G
        ])
    }

    /// A# 混合利底亚音阶（A# B# C## D# E# F## G#）
    @Test("A# Mixolydian")
    func testASharpMixolydian() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  1, 75),  // D#
            (.E,  1, 77),  // E#
            (.F,  2, 79),  // F##
            (.G,  1, 80)  // G#
        ])
    }

    /// Ab 混合利底亚音阶（Ab Bb C Db Eb F Gb）
    @Test("Ab Mixolydian")
    func testAFlatMixolydian() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F,  0, 77),  // F
            (.G, -1, 78)  // Gb
        ])
    }

    /// A## 混合利底亚音阶（A## B## C### D## E## F### G##）
    @Test("A## Mixolydian")
    func testADoubleSharpMixolydian() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  2, 76),  // D##
            (.E,  2, 78),  // E##
            (.F,  3, 80),  // F###
            (.G,  2, 81)  // G##
        ])
    }

    /// Abb 混合利底亚音阶（Abb Bbb Cb Dbb Ebb Fb Gbb）
    @Test("Abb Mixolydian")
    func testADoubleFlatMixolydian() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -2, 77)  // Gbb
        ])
    }

    /// A### 混合利底亚音阶（A### B### C D### E### F G###）
    @Test("A### Mixolydian")
    func testATripleSharpMixolydian() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A,  3, 72),  // A###
            (.B,  3, 74),  // B###
            (.C,  4, 76),  // C
            (.D,  3, 77),  // D###
            (.E,  3, 79),  // E###
            (.F,  4, 81),  // F
            (.G,  3, 82)  // G###
        ])
    }

    /// Abbb 混合利底亚音阶（Abbb Bbbb Cbb Dbbb Ebbb Fbb Gbbb）
    @Test("Abbb Mixolydian")
    func testATripleFlatMixolydian() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -3, 76)  // Gbbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 混合利底亚音阶（B C# D# E F# G# A）
    @Test("B Mixolydian")
    func testBMixolydian() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  1, 75),  // D#
            (.E,  0, 76),  // E
            (.F,  1, 78),  // F#
            (.G,  1, 80),  // G#
            (.A,  0, 81)  // A
        ])
    }

    /// B# 混合利底亚音阶（B# C## D## E# F## G## A#）
    @Test("B# Mixolydian")
    func testBSharpMixolydian() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  2, 76),  // D##
            (.E,  1, 77),  // E#
            (.F,  2, 79),  // F##
            (.G,  2, 81),  // G##
            (.A,  1, 82)  // A#
        ])
    }

    /// Bb 混合利底亚音阶（Bb C D Eb F G Ab）
    @Test("Bb Mixolydian")
    func testBFlatMixolydian() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D,  0, 74),  // D
            (.E, -1, 75),  // Eb
            (.F,  0, 77),  // F
            (.G,  0, 79),  // G
            (.A, -1, 80)  // Ab
        ])
    }

    /// B## 混合利底亚音阶（B## C### D### E## F### G### A##）
    @Test("B## Mixolydian")
    func testBDoubleSharpMixolydian() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  3, 77),  // D###
            (.E,  2, 78),  // E##
            (.F,  3, 80),  // F###
            (.G,  3, 82),  // G###
            (.A,  2, 83)  // A##
        ])
    }

    /// Bbb 混合利底亚音阶（Bbb Cb Db Ebb Fb Gb Abb）
    @Test("Bbb Mixolydian")
    func testBDoubleFlatMixolydian() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -1, 78),  // Gb
            (.A, -2, 79)  // Abb
        ])
    }

    /// B### 混合利底亚音阶（B### C D E### F G A###）
    @Test("B### Mixolydian")
    func testBTripleSharpMixolydian() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B,  3, 74),  // B###
            (.C,  4, 76),  // C
            (.D,  4, 78),  // D
            (.E,  3, 79),  // E###
            (.F,  4, 81),  // F
            (.G,  4, 83),  // G
            (.A,  3, 84)  // A###
        ])
    }

    /// Bbbb 混合利底亚音阶（Bbbb Cbb Dbb Ebbb Fbb Gbb Abbb）
    @Test("Bbbb Mixolydian")
    func testBTripleFlatMixolydian() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyMixolydianScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77),  // Gbb
            (.A, -3, 78)  // Abbb
        ])
    }

}