//
//  HarmonicMinorScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  和声小调音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Harmonic Minor Scale Comprehensive Tests")
struct HarmonicMinorScaleTests {

    // MARK: - Helper Methods

    /// 验证和声小调音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
    func verifyHarmonicMinorScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .harmonicMinor)
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

    /// C 和声小调（C D Eb F G Ab B）
    @Test("C Harmonic Minor")
    func testCHarmonicMinor() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),   // C
            (.D, 0, 62),   // D
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, -1, 68),  // Ab
            (.B, 0, 71)    // B
        ])
    }

    /// C# 和声小调（C# D# E F# G# A B#）
    @Test("C# Harmonic Minor")
    func testCSharpHarmonicMinor() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),   // C#
            (.D, 1, 63),   // D#
            (.E, 0, 64),   // E
            (.F, 1, 66),   // F#
            (.G, 1, 68),   // G#
            (.A, 0, 69),   // A
            (.B, 1, 72)    // B#
        ])
    }

    /// Cb 和声小调（Cb Db Ebb Fb Gb Abb Bb）
    @Test("Cb Harmonic Minor")
    func testCFlatHarmonicMinor() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -1, 61),  // Db
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -1, 70)   // Bb
        ])
    }

    /// C## 和声小调（C## D## E# F## G## A# B##）
    @Test("C## Harmonic Minor")
    func testCDoubleSharpHarmonicMinor() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),   // C##
            (.D, 2, 64),   // D##
            (.E, 1, 65),   // E#
            (.F, 2, 67),   // F##
            (.G, 2, 69),   // G##
            (.A, 1, 70),   // A#
            (.B, 2, 73)    // B##
        ])
    }

    /// Cbb 和声小调（Cbb Dbb Ebbb Fbb Gbb Abbb Bbb）
    @Test("Cbb Harmonic Minor")
    func testCDoubleFlatHarmonicMinor() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -2, 60),  // Dbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -2, 69)   // Bbb
        ])
    }

    /// C### 和声小调（C### D### E## F### G### A## B###）
    @Test("C### Harmonic Minor")
    func testCTripleSharpHarmonicMinor() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),   // C###
            (.D, 3, 65),   // D###
            (.E, 2, 66),   // E##
            (.F, 3, 68),   // F###
            (.G, 3, 70),   // G###
            (.A, 2, 71),   // A##
            (.B, 3, 74)    // B###
        ])
    }

    /// Cbbb 和声小调（Cbbb Dbbb Ebbbb Fbbb Gbbb Abbbb Bbbb）
    @Test("Cbbb Harmonic Minor")
    func testCTripleFlatHarmonicMinor() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -3, 59),  // Dbbb
            (.E, -4, 60),  // Ebbbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // Abbbb
            (.B, -3, 68)   // Bbbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 和声小调（D E F G A Bb C#）
    @Test("D Harmonic Minor")
    func testDHarmonicMinor() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),   // D
            (.E, 0, 64),   // E
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, -1, 70),  // Bb
            (.C, 1, 73)    // C#
        ])
    }

    /// D# 和声小调（D# E# F# G# A# B C##）
    @Test("D# Harmonic Minor")
    func testDSharpHarmonicMinor() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),   // D#
            (.E, 1, 65),   // E#
            (.F, 1, 66),   // F#
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 0, 71),   // B
            (.C, 2, 74)    // C##
        ])
    }

    /// Db 和声小调（Db Eb Fb Gb Ab Bbb C）
    @Test("Db Harmonic Minor")
    func testDFlatHarmonicMinor() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, 0, 72)    // C
        ])
    }

    /// D## 和声小调（D## E## F## G## A## B# C###）
    @Test("D## Harmonic Minor")
    func testDDoubleSharpHarmonicMinor() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),   // D##
            (.E, 2, 66),   // E##
            (.F, 2, 67),   // F##
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 1, 72),   // B#
            (.C, 3, 75)    // C###
        ])
    }

    /// Dbb 和声小调（Dbb Ebb Fbb Gbb Abb Bbbb Cb）
    @Test("Dbb Harmonic Minor")
    func testDDoubleFlatHarmonicMinor() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -1, 71)   // Cb
        ])
    }

    /// D### 和声小调（D### E### F### G### A### B## C####）
    @Test("D### Harmonic Minor")
    func testDTripleSharpHarmonicMinor() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),   // D###
            (.E, 3, 67),   // E###
            (.F, 3, 68),   // F###
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 2, 73),   // B##
            (.C, 4, 76)    // C####
        ])
    }

    /// Dbbb 和声小调（Dbbb Ebbb Fbbb Gbbb Abbb Bbbbb Cbb）
    @Test("Dbbb Harmonic Minor")
    func testDTripleFlatHarmonicMinor() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // Bbbbb
            (.C, -2, 70)   // Cbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 和声小调（E F# G A B C D#）
    @Test("E Harmonic Minor")
    func testEHarmonicMinor() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),   // E
            (.F, 1, 66),   // F#
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 0, 72),   // C
            (.D, 1, 75)    // D#
        ])
    }

    /// E# 和声小调（E# F## G# A# B# C# D##）
    @Test("E# Harmonic Minor")
    func testESharpHarmonicMinor() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),   // E#
            (.F, 2, 67),   // F##
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 1, 73),   // C#
            (.D, 2, 76)    // D##
        ])
    }

    /// Eb 和声小调（Eb F Gb Ab Bb Cb D）
    @Test("Eb Harmonic Minor")
    func testEFlatHarmonicMinor() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, 0, 74)    // D
        ])
    }

    /// E## 和声小调（E## F### G## A## B## C## D###）
    @Test("E## Harmonic Minor")
    func testEDoubleSharpHarmonicMinor() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),   // E##
            (.F, 3, 68),   // F###
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 2, 74),   // C##
            (.D, 3, 77)    // D###
        ])
    }

    /// Ebb 和声小调（Ebb Fb Gbb Abb Bbb Cbb Db）
    @Test("Ebb Harmonic Minor")
    func testEDoubleFlatHarmonicMinor() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -1, 73)   // Db
        ])
    }

    /// E### 和声小调（E### F#### G### A### B### C### D####）
    @Test("E### Harmonic Minor")
    func testETripleSharpHarmonicMinor() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),   // E###
            (.F, 4, 69),   // F####
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 3, 74),   // B###
            (.C, 3, 75),   // C###
            (.D, 4, 78)    // D####
        ])
    }

    /// Ebbb 和声小调（Ebbb Fbb Gbbb Abbb Bbbb Cbbb Dbb）
    @Test("Ebbb Harmonic Minor")
    func testETripleFlatHarmonicMinor() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -2, 72)   // Dbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 和声小调（F G Ab Bb C Db E）
    @Test("F Harmonic Minor")
    func testFHarmonicMinor() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, -1, 73),  // Db
            (.E, 0, 76)    // E
        ])
    }

    /// F# 和声小调（F# G# A B C# D E#）
    @Test("F# Harmonic Minor")
    func testFSharpHarmonicMinor() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),   // F#
            (.G, 1, 68),   // G#
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 0, 74),   // D
            (.E, 1, 77)    // E#
        ])
    }

    /// Fb 和声小调（Fb Gb Abb Bbb Cb Dbb Eb）
    @Test("Fb Harmonic Minor")
    func testFFlatHarmonicMinor() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -1, 75)   // Eb
        ])
    }

    /// F## 和声小调（F## G## A# B# C## D# E##）
    @Test("F## Harmonic Minor")
    func testFDoubleSharpHarmonicMinor() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),   // F##
            (.G, 2, 69),   // G##
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 1, 75),   // D#
            (.E, 2, 78)    // E##
        ])
    }

    /// Fbb 和声小调（Fbb Gbb Abbb Bbbb Cbb Dbbb Ebb）
    @Test("Fbb Harmonic Minor")
    func testFDoubleFlatHarmonicMinor() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -2, 74)   // Ebb
        ])
    }

    /// F### 和声小调（F### G### A## B## C### D## E###）
    @Test("F### Harmonic Minor")
    func testFTripleSharpHarmonicMinor() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),   // F###
            (.G, 3, 70),   // G###
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 2, 76),   // D##
            (.E, 3, 79)    // E###
        ])
    }

    /// Fbbb 和声小调（Fbbb Gbbb Abbbb Bbbbb Cbbb Dbbbb Ebbb）
    @Test("Fbbb Harmonic Minor")
    func testFTripleFlatHarmonicMinor() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // Abbbb
            (.B, -4, 67),  // Bbbbb
            (.C, -3, 69),  // Cbbb
            (.D, -4, 70),  // Dbbbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 和声小调（G A Bb C D Eb F#）
    @Test("G Harmonic Minor")
    func testGHarmonicMinor() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, 0, 74),   // D
            (.E, -1, 75),  // Eb
            (.F, 1, 78)    // F#
        ])
    }

    /// G# 和声小调（G# A# B C# D# E F##）
    @Test("G# Harmonic Minor")
    func testGSharpHarmonicMinor() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 1, 75),   // D#
            (.E, 0, 76),   // E
            (.F, 2, 79)    // F##
        ])
    }

    /// Gb 和声小调（Gb Ab Bbb Cb Db Ebb F）
    @Test("Gb Harmonic Minor")
    func testGFlatHarmonicMinor() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, 0, 77)    // F
        ])
    }

    /// G## 和声小调（G## A## B# C## D## E# F###）
    @Test("G## Harmonic Minor")
    func testGDoubleSharpHarmonicMinor() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 2, 76),   // D##
            (.E, 1, 77),   // E#
            (.F, 3, 80)    // F###
        ])
    }

    /// Gbb 和声小调（Gbb Abb Bbbb Cbb Dbb Ebbb Fb）
    @Test("Gbb Harmonic Minor")
    func testGDoubleFlatHarmonicMinor() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.F, -1, 76)   // Fb
        ])
    }

    /// G### 和声小调（G### A### B## C### D### E## F####）
    @Test("G### Harmonic Minor")
    func testGTripleSharpHarmonicMinor() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 3, 77),   // D###
            (.E, 2, 78),   // E##
            (.F, 4, 81)    // F####
        ])
    }

    /// Gbbb 和声小调（Gbbb Abbb Bbbbb Cbbb Dbbb Ebbbb Fbb）
    @Test("Gbbb Harmonic Minor")
    func testGTripleFlatHarmonicMinor() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // Bbbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -4, 72),  // Ebbbb
            (.F, -2, 75)   // Fbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 和声小调（A B C D E F G#）
    @Test("A Harmonic Minor")
    func testAHarmonicMinor() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 0, 72),   // C
            (.D, 0, 74),   // D
            (.E, 0, 76),   // E
            (.F, 0, 77),   // F
            (.G, 1, 80)    // G#
        ])
    }

    /// A# 和声小调（A# B# C# D# E# F# G##）
    @Test("A# Harmonic Minor")
    func testASharpHarmonicMinor() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 1, 73),   // C#
            (.D, 1, 75),   // D#
            (.E, 1, 77),   // E#
            (.F, 1, 78),   // F#
            (.G, 2, 81)    // G##
        ])
    }

    /// Ab 和声小调（Ab Bb Cb Db Eb Fb G）
    @Test("Ab Harmonic Minor")
    func testAFlatHarmonicMinor() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, -1, 76),  // Fb
            (.G, 0, 79)    // G
        ])
    }

    /// A## 和声小调（A## B## C## D## E## F## G###）
    @Test("A## Harmonic Minor")
    func testADoubleSharpHarmonicMinor() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 2, 74),   // C##
            (.D, 2, 76),   // D##
            (.E, 2, 78),   // E##
            (.F, 2, 79),   // F##
            (.G, 3, 82)    // G###
        ])
    }

    /// Abb 和声小调（Abb Bbb Cbb Dbb Ebb Fbb Gb）
    @Test("Abb Harmonic Minor")
    func testADoubleFlatHarmonicMinor() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75),  // Fbb
            (.G, -1, 78)   // Gb
        ])
    }

    /// A### 和声小调（A### B### C### D### E### F### G####）
    @Test("A### Harmonic Minor")
    func testATripleSharpHarmonicMinor() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),   // A###
            (.B, 3, 74),   // B###
            (.C, 3, 75),   // C###
            (.D, 3, 77),   // D###
            (.E, 3, 79),   // E###
            (.F, 3, 80),   // F###
            (.G, 4, 83)    // G####
        ])
    }

    /// Abbb 和声小调（Abbb Bbbb Cbbb Dbbb Ebbb Fbbb Gbb）
    @Test("Abbb Harmonic Minor")
    func testATripleFlatHarmonicMinor() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -3, 74),  // Fbbb
            (.G, -2, 77)   // Gbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 和声小调（B C# D E F# G A#）
    @Test("B Harmonic Minor")
    func testBHarmonicMinor() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 0, 74),   // D
            (.E, 0, 76),   // E
            (.F, 1, 78),   // F#
            (.G, 0, 79),   // G
            (.A, 1, 82)    // A#
        ])
    }

    /// B# 和声小调（B# C## D# E# F## G# A##）
    @Test("B# Harmonic Minor")
    func testBSharpHarmonicMinor() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 1, 75),   // D#
            (.E, 1, 77),   // E#
            (.F, 2, 79),   // F##
            (.G, 1, 80),   // G#
            (.A, 2, 83)    // A##
        ])
    }

    /// Bb 和声小调（Bb C Db Eb F Gb A）
    @Test("Bb Harmonic Minor")
    func testBFlatHarmonicMinor() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, 0, 77),   // F
            (.G, -1, 78),  // Gb
            (.A, 0, 81)    // A
        ])
    }

    /// B## 和声小调（B## C### D## E## F### G## A###）
    @Test("B## Harmonic Minor")
    func testBDoubleSharpHarmonicMinor() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 2, 76),   // D##
            (.E, 2, 78),   // E##
            (.F, 3, 80),   // F###
            (.G, 2, 81),   // G##
            (.A, 3, 84)    // A###
        ])
    }

    /// Bbb 和声小调（Bbb Cb Dbb Ebb Fb Gbb Ab）
    @Test("Bbb Harmonic Minor")
    func testBDoubleFlatHarmonicMinor() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -2, 77),  // Gbb
            (.A, -1, 80)   // Ab
        ])
    }

    /// B### 和声小调（B### C#### D### E### F#### G### A####）
    @Test("B### Harmonic Minor")
    func testBTripleSharpHarmonicMinor() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),   // B###
            (.C, 4, 76),   // C####
            (.D, 3, 77),   // D###
            (.E, 3, 79),   // E###
            (.F, 4, 81),   // F####
            (.G, 3, 82),   // G###
            (.A, 4, 85)    // A####
        ])
    }

    /// Bbbb 和声小调（Bbbb Cbb Dbbb Ebbb Fbb Gbbb Abb）
    @Test("Bbbb Harmonic Minor")
    func testBTripleFlatHarmonicMinor() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyHarmonicMinorScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -3, 76),  // Gbbb
            (.A, -2, 79)   // Abb
        ])
    }
}
