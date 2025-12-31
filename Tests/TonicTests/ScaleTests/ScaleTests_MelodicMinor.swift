//
//  MelodicMinorScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  旋律小调音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Melodic Minor Scale Comprehensive Tests")
struct MelodicMinorScaleTests {

    // MARK: - Helper Methods

    /// 验证旋律小调音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
    func verifyMelodicMinorScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .melodicMinor)
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

    /// C 旋律小调（C D Eb F G A B）
    @Test("C Melodic Minor")
    func testCMelodicMinor() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),   // C
            (.D, 0, 62),   // D
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, 0, 71)    // B
        ])
    }

    /// C# 旋律小调（C# D# E F# G# A# B#）
    @Test("C# Melodic Minor")
    func testCSharpMelodicMinor() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),   // C#
            (.D, 1, 63),   // D#
            (.E, 0, 64),   // E
            (.F, 1, 66),   // F#
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 1, 72)    // B#
        ])
    }

    /// Cb 旋律小调（Cb Db Ebb Fb Gb Ab Bb）
    @Test("Cb Melodic Minor")
    func testCFlatMelodicMinor() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -1, 61),  // Db
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70)   // Bb
        ])
    }

    /// C## 旋律小调（C## D## E# F## G## A## B##）
    @Test("C## Melodic Minor")
    func testCDoubleSharpMelodicMinor() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),   // C##
            (.D, 2, 64),   // D##
            (.E, 1, 65),   // E#
            (.F, 2, 67),   // F##
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 2, 73)    // B##
        ])
    }

    /// Cbb 旋律小调（Cbb Dbb Ebbb Fbb Gbb Abb Bbb）
    @Test("Cbb Melodic Minor")
    func testCDoubleFlatMelodicMinor() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -2, 60),  // Dbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69)   // Bbb
        ])
    }

    /// C### 旋律小调（C### D### E## F### G### A### B###）
    @Test("C### Melodic Minor")
    func testCTripleSharpMelodicMinor() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),   // C###
            (.D, 3, 65),   // D###
            (.E, 2, 66),   // E##
            (.F, 3, 68),   // F###
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 3, 74)    // B###
        ])
    }

    /// Cbbb 旋律小调（Cbbb Dbbb Ebbbb Fbbb Gbbb Abbb Bbbb）
    @Test("Cbbb Melodic Minor")
    func testCTripleFlatMelodicMinor() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -3, 59),  // Dbbb
            (.E, -4, 60),  // Ebbbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68)   // Bbbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 旋律小调（D E F G A B C#）
    @Test("D Melodic Minor")
    func testDMelodicMinor() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),   // D
            (.E, 0, 64),   // E
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 1, 73)    // C#
        ])
    }

    /// D# 旋律小调（D# E# F# G# A# B# C##）
    @Test("D# Melodic Minor")
    func testDSharpMelodicMinor() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),   // D#
            (.E, 1, 65),   // E#
            (.F, 1, 66),   // F#
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 2, 74)    // C##
        ])
    }

    /// Db 旋律小调（Db Eb Fb Gb Ab Bb C）
    @Test("Db Melodic Minor")
    func testDFlatMelodicMinor() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72)    // C
        ])
    }

    /// D## 旋律小调（D## E## F## G## A## B## C###）
    @Test("D## Melodic Minor")
    func testDDoubleSharpMelodicMinor() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),   // D##
            (.E, 2, 66),   // E##
            (.F, 2, 67),   // F##
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 3, 75)    // C###
        ])
    }

    /// Dbb 旋律小调（Dbb Ebb Fbb Gbb Abb Bbb Cb）
    @Test("Dbb Melodic Minor")
    func testDDoubleFlatMelodicMinor() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71)   // Cb
        ])
    }

    /// D### 旋律小调（D### E### F### G### A### B### C####）
    @Test("D### Melodic Minor")
    func testDTripleSharpMelodicMinor() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),   // D###
            (.E, 3, 67),   // E###
            (.F, 3, 68),   // F###
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 3, 74),   // B###
            (.C, 4, 76)    // C####
        ])
    }

    /// Dbbb 旋律小调（Dbbb Ebbb Fbbb Gbbb Abbb Bbbb Cbb）
    @Test("Dbbb Melodic Minor")
    func testDTripleFlatMelodicMinor() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70)   // Cbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 旋律小调（E F# G A B C# D#）
    @Test("E Melodic Minor")
    func testEMelodicMinor() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),   // E
            (.F, 1, 66),   // F#
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 1, 75)    // D#
        ])
    }

    /// E# 旋律小调（E# F## G# A# B# C## D##）
    @Test("E# Melodic Minor")
    func testESharpMelodicMinor() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),   // E#
            (.F, 2, 67),   // F##
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 2, 76)    // D##
        ])
    }

    /// Eb 旋律小调（Eb F Gb Ab Bb C D）
    @Test("Eb Melodic Minor")
    func testEFlatMelodicMinor() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, 0, 74)    // D
        ])
    }

    /// E## 旋律小调（E## F### G## A## B## C### D###）
    @Test("E## Melodic Minor")
    func testEDoubleSharpMelodicMinor() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),   // E##
            (.F, 3, 68),   // F###
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 3, 77)    // D###
        ])
    }

    /// Ebb 旋律小调（Ebb Fb Gbb Abb Bbb Cbb Dbb）
    @Test("Ebb Melodic Minor")
    func testEDoubleFlatMelodicMinor() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cbb
            (.D, -1, 73)   // Dbb
        ])
    }

    /// E### 旋律小调（E### F#### G### A### B### C#### D####）
    @Test("E### Melodic Minor")
    func testETripleSharpMelodicMinor() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),   // E###
            (.F, 4, 69),   // F####
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 3, 74),   // B###
            (.C, 4, 76),   // C####
            (.D, 4, 78)    // D####
        ])
    }

    /// Ebbb 旋律小调（Ebbb Fbb Gbbb Abbb Bbbb Cbbb Dbbb）
    @Test("Ebbb Melodic Minor")
    func testETripleFlatMelodicMinor() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbbb
            (.D, -2, 72)   // Dbbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 旋律小调（F G Ab Bb C D E）
    @Test("F Melodic Minor")
    func testFMelodicMinor() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, 0, 74),   // D
            (.E, 0, 76)    // E
        ])
    }

    /// F# 旋律小调（F# G# A B C# D# E#）
    @Test("F# Melodic Minor")
    func testFSharpMelodicMinor() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),   // F#
            (.G, 1, 68),   // G#
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 1, 75),   // D#
            (.E, 1, 77)    // E#
        ])
    }

    /// Fb 旋律小调（Fb Gb Abb Bbb Cb Db Eb）
    @Test("Fb Melodic Minor")
    func testFFlatMelodicMinor() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75)   // Eb
        ])
    }

    /// F## 旋律小调（F## G## A# B# C## D## E##）
    @Test("F## Melodic Minor")
    func testFDoubleSharpMelodicMinor() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),   // F##
            (.G, 2, 69),   // G##
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 2, 76),   // D##
            (.E, 2, 78)    // E##
        ])
    }

    /// Fbb 旋律小调（Fbb Gbb Abbb Bbbb Cbb Dbb Ebb）
    @Test("Fbb Melodic Minor")
    func testFDoubleFlatMelodicMinor() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74)   // Ebb
        ])
    }

    /// F### 旋律小调（F### G### A## B## C### D### E###）
    @Test("F### Melodic Minor")
    func testFTripleSharpMelodicMinor() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),   // F###
            (.G, 3, 70),   // G###
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 3, 77),   // D###
            (.E, 3, 79)    // E###
        ])
    }

    /// Fbbb 旋律小调（Fbbb Gbbb Abbbb Bbbbb Cbbb Dbbb Ebbb）
    @Test("Fbbb Melodic Minor")
    func testFTripleFlatMelodicMinor() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // Abbbb
            (.B, -4, 67),  // Bbbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 旋律小调（G A Bb C D E F#）
    @Test("G Melodic Minor")
    func testGMelodicMinor() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, 0, 74),   // D
            (.E, 0, 76),   // E
            (.F, 1, 78)    // F#
        ])
    }

    /// G# 旋律小调（G# A# B C# D# E# F##）
    @Test("G# Melodic Minor")
    func testGSharpMelodicMinor() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),   // G#
            (.A, 1, 70),   // A#
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 1, 75),   // D#
            (.E, 1, 77),   // E#
            (.F, 2, 79)    // F##
        ])
    }

    /// Gb 旋律小调（Gb Ab Bbb Cb Db Eb F）
    @Test("Gb Melodic Minor")
    func testGFlatMelodicMinor() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, 0, 77)    // F
        ])
    }

    /// G## 旋律小调（G## A## B# C## D## E## F###）
    @Test("G## Melodic Minor")
    func testGDoubleSharpMelodicMinor() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),   // G##
            (.A, 2, 71),   // A##
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 2, 76),   // D##
            (.E, 2, 78),   // E##
            (.F, 3, 80)    // F###
        ])
    }

    /// Gbb 旋律小调（Gbb Abb Bbbb Cbb Dbb Ebb Fb）
    @Test("Gbb Melodic Minor")
    func testGDoubleFlatMelodicMinor() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76)   // Fb
        ])
    }

    /// G### 旋律小调（G### A### B## C### D### E### F####）
    @Test("G### Melodic Minor")
    func testGTripleSharpMelodicMinor() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),   // G###
            (.A, 3, 72),   // A###
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 3, 77),   // D###
            (.E, 3, 79),   // E###
            (.F, 4, 81)    // F####
        ])
    }

    /// Gbbb 旋律小调（Gbbb Abbb Bbbbb Cbbb Dbbb Ebbb Fbb）
    @Test("Gbbb Melodic Minor")
    func testGTripleFlatMelodicMinor() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // Bbbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75)   // Fbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 旋律小调（A B C D E F# G#）
    @Test("A Melodic Minor")
    func testAMelodicMinor() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),   // A
            (.B, 0, 71),   // B
            (.C, 0, 72),   // C
            (.D, 0, 74),   // D
            (.E, 0, 76),   // E
            (.F, 1, 78),   // F#
            (.G, 1, 80)    // G#
        ])
    }

    /// A# 旋律小调（A# B# C# D# E# F## G##）
    @Test("A# Melodic Minor")
    func testASharpMelodicMinor() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),   // A#
            (.B, 1, 72),   // B#
            (.C, 1, 73),   // C#
            (.D, 1, 75),   // D#
            (.E, 1, 77),   // E#
            (.F, 2, 79),   // F##
            (.G, 2, 81)    // G##
        ])
    }

    /// Ab 旋律小调（Ab Bb Cb Db Eb F G）
    @Test("Ab Melodic Minor")
    func testAFlatMelodicMinor() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, 0, 77),   // F
            (.G, 0, 79)    // G
        ])
    }

    /// A## 旋律小调（A## B## C## D## E## F### G###）
    @Test("A## Melodic Minor")
    func testADoubleSharpMelodicMinor() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),   // A##
            (.B, 2, 73),   // B##
            (.C, 2, 74),   // C##
            (.D, 2, 76),   // D##
            (.E, 2, 78),   // E##
            (.F, 3, 80),   // F###
            (.G, 3, 82)    // G###
        ])
    }

    /// Abb 旋律小调（Abb Bbb Cbb Dbb Ebb Fb Gb）
    @Test("Abb Melodic Minor")
    func testADoubleFlatMelodicMinor() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -1, 78)   // Gb
        ])
    }

    /// A### 旋律小调（A### B### C### D### E### F#### G####）
    @Test("A### Melodic Minor")
    func testATripleSharpMelodicMinor() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),   // A###
            (.B, 3, 74),   // B###
            (.C, 3, 75),   // C###
            (.D, 3, 77),   // D###
            (.E, 3, 79),   // E###
            (.F, 4, 81),   // F####
            (.G, 4, 83)    // G####
        ])
    }

    /// Abbb 旋律小调（Abbb Bbbb Cbbb Dbbb Ebbb Fbb Gbb）
    @Test("Abbb Melodic Minor")
    func testATripleFlatMelodicMinor() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77)   // Gbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 旋律小调（B C# D E F# G# A#）
    @Test("B Melodic Minor")
    func testBMelodicMinor() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),   // B
            (.C, 1, 73),   // C#
            (.D, 0, 74),   // D
            (.E, 0, 76),   // E
            (.F, 1, 78),   // F#
            (.G, 1, 80),   // G#
            (.A, 1, 82)    // A#
        ])
    }

    /// B# 旋律小调（B# C## D# E# F## G## A##）
    @Test("B# Melodic Minor")
    func testBSharpMelodicMinor() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),   // B#
            (.C, 2, 74),   // C##
            (.D, 1, 75),   // D#
            (.E, 1, 77),   // E#
            (.F, 2, 79),   // F##
            (.G, 2, 81),   // G##
            (.A, 2, 83)    // A##
        ])
    }

    /// Bb 旋律小调（Bb C Db Eb F G A）
    @Test("Bb Melodic Minor")
    func testBFlatMelodicMinor() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, 0, 77),   // F
            (.G, 0, 79),   // G
            (.A, 0, 81)    // A
        ])
    }

    /// B## 旋律小调（B## C### D## E## F### G### A###）
    @Test("B## Melodic Minor")
    func testBDoubleSharpMelodicMinor() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),   // B##
            (.C, 3, 75),   // C###
            (.D, 2, 76),   // D##
            (.E, 2, 78),   // E##
            (.F, 3, 80),   // F###
            (.G, 3, 82),   // G###
            (.A, 3, 84)    // A###
        ])
    }

    /// Bbb 旋律小调（Bbb Cb Dbb Ebb Fb Gb Ab）
    @Test("Bbb Melodic Minor")
    func testBDoubleFlatMelodicMinor() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -1, 78),  // Gb
            (.A, -1, 80)   // Ab
        ])
    }

    /// B### 旋律小调（B### C#### D### E### F#### G#### A####）
    @Test("B### Melodic Minor")
    func testBTripleSharpMelodicMinor() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),   // B###
            (.C, 4, 76),   // C####
            (.D, 3, 77),   // D###
            (.E, 3, 79),   // E###
            (.F, 4, 81),   // F####
            (.G, 4, 83),   // G####
            (.A, 4, 85)    // A####
        ])
    }

    /// Bbbb 旋律小调（Bbbb Cbb Dbbb Ebbb Fbb Gbb Abb）
    @Test("Bbbb Melodic Minor")
    func testBTripleFlatMelodicMinor() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyMelodicMinorScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77),  // Gbb
            (.A, -2, 79)   // Abb
        ])
    }
}
