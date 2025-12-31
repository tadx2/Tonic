//
//  LocrianScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  洛克里亚音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Locrian Scale Comprehensive Tests")
struct LocrianScaleTests {

    // MARK: - Helper Methods

    /// 验证洛克里亚音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
    func verifyLocrianScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .locrian)
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

    /// C 洛克里亚音阶（C Db Eb F Gb Ab Bb）
    @Test("C Locrian")
    func testCLocrian() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C,  0, 60),  // C
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F,  0, 65),  // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70)  // Bb
        ])
    }

    /// C# 洛克里亚音阶（C# D E F# G A B）
    @Test("C# Locrian")
    func testCSharpLocrian() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C,  1, 61),  // C#
            (.D,  0, 62),  // D
            (.E,  0, 64),  // E
            (.F,  1, 66),  // F#
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B,  0, 71)  // B
        ])
    }

    /// Cb 洛克里亚音阶（Cb Dbb Ebb Fb Gbb Abb Bbb）
    @Test("Cb Locrian")
    func testCFlatLocrian() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69)  // Bbb
        ])
    }

    /// C## 洛克里亚音阶（C## D# E# F## G# A# B#）
    @Test("C## Locrian")
    func testCDoubleSharpLocrian() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C,  2, 62),  // C##
            (.D,  1, 63),  // D#
            (.E,  1, 65),  // E#
            (.F,  2, 67),  // F##
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  1, 72)  // B#
        ])
    }

    /// Cbb 洛克里亚音阶（Cbb Dbbb Ebbb Fbb Gbbb Abbb Bbbb）
    @Test("Cbb Locrian")
    func testCDoubleFlatLocrian() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68)  // Bbbb
        ])
    }

    /// C### 洛克里亚音阶（C### D## E## F### G## A## B##）
    @Test("C### Locrian")
    func testCTripleSharpLocrian() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C,  3, 63),  // C###
            (.D,  2, 64),  // D##
            (.E,  2, 66),  // E##
            (.F,  3, 68),  // F###
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  2, 73)  // B##
        ])
    }

    /// Cbbb 洛克里亚音阶（Cbbb D E Fbbb G A B）
    @Test("Cbbb Locrian")
    func testCTripleFlatLocrian() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -4, 58),  // D
            (.E, -4, 60),  // E
            (.F, -3, 62),  // Fbbb
            (.G, -4, 63),  // G
            (.A, -4, 65),  // A
            (.B, -4, 67)  // B
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 洛克里亚音阶（D Eb F G Ab Bb C）
    @Test("D Locrian")
    func testDLocrian() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D,  0, 62),  // D
            (.E, -1, 63),  // Eb
            (.F,  0, 65),  // F
            (.G,  0, 67),  // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C,  0, 72)  // C
        ])
    }

    /// D# 洛克里亚音阶（D# E F# G# A B C#）
    @Test("D# Locrian")
    func testDSharpLocrian() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D,  1, 63),  // D#
            (.E,  0, 64),  // E
            (.F,  1, 66),  // F#
            (.G,  1, 68),  // G#
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  1, 73)  // C#
        ])
    }

    /// Db 洛克里亚音阶（Db Ebb Fb Gb Abb Bbb Cb）
    @Test("Db Locrian")
    func testDFlatLocrian() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71)  // Cb
        ])
    }

    /// D## 洛克里亚音阶（D## E# F## G## A# B# C##）
    @Test("D## Locrian")
    func testDDoubleSharpLocrian() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D,  2, 64),  // D##
            (.E,  1, 65),  // E#
            (.F,  2, 67),  // F##
            (.G,  2, 69),  // G##
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  2, 74)  // C##
        ])
    }

    /// Dbb 洛克里亚音阶（Dbb Ebbb Fbb Gbb Abbb Bbbb Cbb）
    @Test("Dbb Locrian")
    func testDDoubleFlatLocrian() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70)  // Cbb
        ])
    }

    /// D### 洛克里亚音阶（D### E## F### G### A## B## C###）
    @Test("D### Locrian")
    func testDTripleSharpLocrian() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D,  3, 65),  // D###
            (.E,  2, 66),  // E##
            (.F,  3, 68),  // F###
            (.G,  3, 70),  // G###
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  3, 75)  // C###
        ])
    }

    /// Dbbb 洛克里亚音阶（Dbbb E Fbbb Gbbb A B Cbbb）
    @Test("Dbbb Locrian")
    func testDTripleFlatLocrian() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -4, 60),  // E
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // A
            (.B, -4, 67),  // B
            (.C, -3, 69)  // Cbbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 洛克里亚音阶（E F G A Bb C D）
    @Test("E Locrian")
    func testELocrian() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E,  0, 64),  // E
            (.F,  0, 65),  // F
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D,  0, 74)  // D
        ])
    }

    /// E# 洛克里亚音阶（E# F# G# A# B C# D#）
    @Test("E# Locrian")
    func testESharpLocrian() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E,  1, 65),  // E#
            (.F,  1, 66),  // F#
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  1, 75)  // D#
        ])
    }

    /// Eb 洛克里亚音阶（Eb Fb Gb Ab Bbb Cb Db）
    @Test("Eb Locrian")
    func testEFlatLocrian() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73)  // Db
        ])
    }

    /// E## 洛克里亚音阶（E## F## G## A## B# C## D##）
    @Test("E## Locrian")
    func testEDoubleSharpLocrian() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E,  2, 66),  // E##
            (.F,  2, 67),  // F##
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  2, 76)  // D##
        ])
    }

    /// Ebb 洛克里亚音阶（Ebb Fbb Gbb Abb Bbbb Cbb Dbb）
    @Test("Ebb Locrian")
    func testEDoubleFlatLocrian() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72)  // Dbb
        ])
    }

    /// E### 洛克里亚音阶（E### F### G### A### B## C### D###）
    @Test("E### Locrian")
    func testETripleSharpLocrian() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E,  3, 67),  // E###
            (.F,  3, 68),  // F###
            (.G,  3, 70),  // G###
            (.A,  3, 72),  // A###
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  3, 77)  // D###
        ])
    }

    /// Ebbb 洛克里亚音阶（Ebbb Fbbb Gbbb Abbb B Cbbb Dbbb）
    @Test("Ebbb Locrian")
    func testETripleFlatLocrian() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // B
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71)  // Dbbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 洛克里亚音阶（F Gb Ab Bb Cb Db Eb）
    @Test("F Locrian")
    func testFLocrian() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F,  0, 65),  // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75)  // Eb
        ])
    }

    /// F# 洛克里亚音阶（F# G A B C D E）
    @Test("F# Locrian")
    func testFSharpLocrian() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F,  1, 66),  // F#
            (.G,  0, 67),  // G
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  0, 72),  // C
            (.D,  0, 74),  // D
            (.E,  0, 76)  // E
        ])
    }

    /// Fb 洛克里亚音阶（Fb Gbb Abb Bbb Cbb Dbb Ebb）
    @Test("Fb Locrian")
    func testFFlatLocrian() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74)  // Ebb
        ])
    }

    /// F## 洛克里亚音阶（F## G# A# B# C# D# E#）
    @Test("F## Locrian")
    func testFDoubleSharpLocrian() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F,  2, 67),  // F##
            (.G,  1, 68),  // G#
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  1, 73),  // C#
            (.D,  1, 75),  // D#
            (.E,  1, 77)  // E#
        ])
    }

    /// Fbb 洛克里亚音阶（Fbb Gbbb Abbb Bbbb Cbbb Dbbb Ebbb）
    @Test("Fbb Locrian")
    func testFDoubleFlatLocrian() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73)  // Ebbb
        ])
    }

    /// F### 洛克里亚音阶（F### G## A## B## C## D## E##）
    @Test("F### Locrian")
    func testFTripleSharpLocrian() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F,  3, 68),  // F###
            (.G,  2, 69),  // G##
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  2, 74),  // C##
            (.D,  2, 76),  // D##
            (.E,  2, 78)  // E##
        ])
    }

    /// Fbbb 洛克里亚音阶（Fbbb G A B C D E）
    @Test("Fbbb Locrian")
    func testFTripleFlatLocrian() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -4, 63),  // G
            (.A, -4, 65),  // A
            (.B, -4, 67),  // B
            (.C, -4, 68),  // C
            (.D, -4, 70),  // D
            (.E, -4, 72)  // E
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 洛克里亚音阶（G Ab Bb C Db Eb F）
    @Test("G Locrian")
    func testGLocrian() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G,  0, 67),  // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F,  0, 77)  // F
        ])
    }

    /// G# 洛克里亚音阶（G# A B C# D E F#）
    @Test("G# Locrian")
    func testGSharpLocrian() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G,  1, 68),  // G#
            (.A,  0, 69),  // A
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  0, 74),  // D
            (.E,  0, 76),  // E
            (.F,  1, 78)  // F#
        ])
    }

    /// Gb 洛克里亚音阶（Gb Abb Bbb Cb Dbb Ebb Fb）
    @Test("Gb Locrian")
    func testGFlatLocrian() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76)  // Fb
        ])
    }

    /// G## 洛克里亚音阶（G## A# B# C## D# E# F##）
    @Test("G## Locrian")
    func testGDoubleSharpLocrian() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G,  2, 69),  // G##
            (.A,  1, 70),  // A#
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  1, 75),  // D#
            (.E,  1, 77),  // E#
            (.F,  2, 79)  // F##
        ])
    }

    /// Gbb 洛克里亚音阶（Gbb Abbb Bbbb Cbb Dbbb Ebbb Fbb）
    @Test("Gbb Locrian")
    func testGDoubleFlatLocrian() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75)  // Fbb
        ])
    }

    /// G### 洛克里亚音阶（G### A## B## C### D## E## F###）
    @Test("G### Locrian")
    func testGTripleSharpLocrian() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G,  3, 70),  // G###
            (.A,  2, 71),  // A##
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  2, 76),  // D##
            (.E,  2, 78),  // E##
            (.F,  3, 80)  // F###
        ])
    }

    /// Gbbb 洛克里亚音阶（Gbbb A B Cbbb D E Fbbb）
    @Test("Gbbb Locrian")
    func testGTripleFlatLocrian() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // A
            (.B, -4, 67),  // B
            (.C, -3, 69),  // Cbbb
            (.D, -4, 70),  // D
            (.E, -4, 72),  // E
            (.F, -3, 74)  // Fbbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 洛克里亚音阶（A Bb C D Eb F G）
    @Test("A Locrian")
    func testALocrian() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A,  0, 69),  // A
            (.B, -1, 70),  // Bb
            (.C,  0, 72),  // C
            (.D,  0, 74),  // D
            (.E, -1, 75),  // Eb
            (.F,  0, 77),  // F
            (.G,  0, 79)  // G
        ])
    }

    /// A# 洛克里亚音阶（A# B C# D# E F# G#）
    @Test("A# Locrian")
    func testASharpLocrian() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A,  1, 70),  // A#
            (.B,  0, 71),  // B
            (.C,  1, 73),  // C#
            (.D,  1, 75),  // D#
            (.E,  0, 76),  // E
            (.F,  1, 78),  // F#
            (.G,  1, 80)  // G#
        ])
    }

    /// Ab 洛克里亚音阶（Ab Bbb Cb Db Ebb Fb Gb）
    @Test("Ab Locrian")
    func testAFlatLocrian() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -1, 78)  // Gb
        ])
    }

    /// A## 洛克里亚音阶（A## B# C## D## E# F## G##）
    @Test("A## Locrian")
    func testADoubleSharpLocrian() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A,  2, 71),  // A##
            (.B,  1, 72),  // B#
            (.C,  2, 74),  // C##
            (.D,  2, 76),  // D##
            (.E,  1, 77),  // E#
            (.F,  2, 79),  // F##
            (.G,  2, 81)  // G##
        ])
    }

    /// Abb 洛克里亚音阶（Abb Bbbb Cbb Dbb Ebbb Fbb Gbb）
    @Test("Abb Locrian")
    func testADoubleFlatLocrian() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77)  // Gbb
        ])
    }

    /// A### 洛克里亚音阶（A### B## C### D### E## F### G###）
    @Test("A### Locrian")
    func testATripleSharpLocrian() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A,  3, 72),  // A###
            (.B,  2, 73),  // B##
            (.C,  3, 75),  // C###
            (.D,  3, 77),  // D###
            (.E,  2, 78),  // E##
            (.F,  3, 80),  // F###
            (.G,  3, 82)  // G###
        ])
    }

    /// Abbb 洛克里亚音阶（Abbb B Cbbb Dbbb E Fbbb Gbbb）
    @Test("Abbb Locrian")
    func testATripleFlatLocrian() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // B
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -4, 72),  // E
            (.F, -3, 74),  // Fbbb
            (.G, -3, 76)  // Gbbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 洛克里亚音阶（B C D E F G A）
    @Test("B Locrian")
    func testBLocrian() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B,  0, 71),  // B
            (.C,  0, 72),  // C
            (.D,  0, 74),  // D
            (.E,  0, 76),  // E
            (.F,  0, 77),  // F
            (.G,  0, 79),  // G
            (.A,  0, 81)  // A
        ])
    }

    /// B# 洛克里亚音阶（B# C# D# E# F# G# A#）
    @Test("B# Locrian")
    func testBSharpLocrian() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B,  1, 72),  // B#
            (.C,  1, 73),  // C#
            (.D,  1, 75),  // D#
            (.E,  1, 77),  // E#
            (.F,  1, 78),  // F#
            (.G,  1, 80),  // G#
            (.A,  1, 82)  // A#
        ])
    }

    /// Bb 洛克里亚音阶（Bb Cb Db Eb Fb Gb Ab）
    @Test("Bb Locrian")
    func testBFlatLocrian() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, -1, 76),  // Fb
            (.G, -1, 78),  // Gb
            (.A, -1, 80)  // Ab
        ])
    }

    /// B## 洛克里亚音阶（B## C## D## E## F## G## A##）
    @Test("B## Locrian")
    func testBDoubleSharpLocrian() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B,  2, 73),  // B##
            (.C,  2, 74),  // C##
            (.D,  2, 76),  // D##
            (.E,  2, 78),  // E##
            (.F,  2, 79),  // F##
            (.G,  2, 81),  // G##
            (.A,  2, 83)  // A##
        ])
    }

    /// Bbb 洛克里亚音阶（Bbb Cbb Dbb Ebb Fbb Gbb Abb）
    @Test("Bbb Locrian")
    func testBDoubleFlatLocrian() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77),  // Gbb
            (.A, -2, 79)  // Abb
        ])
    }

    /// B### 洛克里亚音阶（B### C### D### E### F### G### A###）
    @Test("B### Locrian")
    func testBTripleSharpLocrian() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B,  3, 74),  // B###
            (.C,  3, 75),  // C###
            (.D,  3, 77),  // D###
            (.E,  3, 79),  // E###
            (.F,  3, 80),  // F###
            (.G,  3, 82),  // G###
            (.A,  3, 84)  // A###
        ])
    }

    /// Bbbb 洛克里亚音阶（Bbbb Cbbb Dbbb Ebbb Fbbb Gbbb Abbb）
    @Test("Bbbb Locrian")
    func testBTripleFlatLocrian() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyLocrianScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -3, 74),  // Fbbb
            (.G, -3, 76),  // Gbbb
            (.A, -3, 78)  // Abbb
        ])
    }

}