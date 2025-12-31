//
//  MajorScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  大调音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Major Scale Comprehensive Tests")
struct MajorScaleTests {

    // MARK: - Helper Methods

    /// 验证大调音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 7 个音符 (letter, accidental, pitch)
    func verifyMajorScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .naturalMajor)
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

    /// C 大调（C D E F G A B）
    @Test("C Major")
    func testCMajor() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),  // C
            (.D, 0, 62),  // D
            (.E, 0, 64),  // E
            (.F, 0, 65),  // F
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, 0, 71)   // B
        ])
    }

    /// C# 大调（C# D# E# F# G# A# B#）
    @Test("C# Major")
    func testCSharpMajor() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),  // C#
            (.D, 1, 63),  // D#
            (.E, 1, 65),  // E#
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 1, 72)   // B#
        ])
    }

    /// Cb 大调（Cb Db Eb Fb Gb Ab Bb）
    @Test("Cb Major")
    func testCFlatMajor() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70)   // Bb
        ])
    }

    /// C## 大调（C## D## E## F## G## A## B##）
    @Test("C## Major")
    func testCDoubleSharpMajor() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),  // C##
            (.D, 2, 64),  // D##
            (.E, 2, 66),  // E##
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 2, 73)   // B##
        ])
    }

    /// Cbb 大调（Cbb Dbb Ebb Fbb Gbb Abb Bbb）
    @Test("Cbb Major")
    func testCDoubleFlatMajor() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69)   // Bbb
        ])
    }

    /// C### 大调（C### D### E### F### G### A### B###）
    @Test("C### Major")
    func testCTripleSharpMajor() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),  // C###
            (.D, 3, 65),  // D###
            (.E, 3, 67),  // E###
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 3, 74)   // B###
        ])
    }

    /// Cbbb 大调（Cbbb Dbbb Ebbb Fbbb Gbbb Abbb Bbbb）
    @Test("Cbbb Major")
    func testCTripleFlatMajor() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68)   // Bbbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 大调（D E F# G A B C#）
    @Test("D Major")
    func testDMajor() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),  // D
            (.E, 0, 64),  // E
            (.F, 1, 66),  // F#
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 1, 73)   // C#
        ])
    }

    /// D# 大调（D# E# F## G# A# B# C##）
    @Test("D# Major")
    func testDSharpMajor() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),  // D#
            (.E, 1, 65),  // E#
            (.F, 2, 67),  // F##
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 2, 74)   // C##
        ])
    }

    /// Db 大调（Db Eb F Gb Ab Bb C）
    @Test("Db Major")
    func testDFlatMajor() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72)    // C
        ])
    }

    /// D## 大调（D## E## F### G## A## B## C###）
    @Test("D## Major")
    func testDDoubleSharpMajor() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),  // D##
            (.E, 2, 66),  // E##
            (.F, 3, 68),  // F###
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 3, 75)   // C###
        ])
    }

    /// Dbb 大调（Dbb Ebb Fb Gbb Abb Bbb Cb）
    @Test("Dbb Major")
    func testDDoubleFlatMajor() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71)   // Cb
        ])
    }

    /// D### 大调（D### E### F#### G### A### B### C####）
    @Test("D### Major")
    func testDTripleSharpMajor() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),  // D###
            (.E, 3, 67),  // E###
            (.F, 4, 69),  // F####
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 4, 76)   // C####
        ])
    }

    /// Dbbb 大调（Dbbb Ebbb Fbb Gbbb Abbb Bbbb Cbb）
    @Test("Dbbb Major")
    func testDTripleFlatMajor() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70)   // Cbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 大调（E F# G# A B C# D#）
    @Test("E Major")
    func testEMajor() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),  // E
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 1, 75)   // D#
        ])
    }

    /// E# 大调（E# F## G## A# B# C## D##）
    @Test("E# Major")
    func testESharpMajor() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),  // E#
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 2, 76)   // D##
        ])
    }

    /// Eb 大调（Eb F G Ab Bb C D）
    @Test("Eb Major")
    func testEFlatMajor() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, 0, 74)    // D
        ])
    }

    /// E## 大调（E## F### G### A## B## C### D###）
    @Test("E## Major")
    func testEDoubleSharpMajor() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),  // E##
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 3, 77)   // D###
        ])
    }

    /// Ebb 大调（Ebb Fb Gb Abb Bbb Cb Db）
    @Test("Ebb Major")
    func testEDoubleFlatMajor() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73)   // Db
        ])
    }

    /// E### 大调（E### F#### G#### A### B### C#### D####）
    @Test("E### Major")
    func testETripleSharpMajor() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),  // E###
            (.F, 4, 69),  // F####
            (.G, 4, 71),  // G####
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 4, 78)   // D####
        ])
    }

    /// Ebbb 大调（Ebbb Fbb Gbb Abbb Bbbb Cbb Dbb）
    @Test("Ebbb Major")
    func testETripleFlatMajor() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72)   // Dbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 大调（F G A Bb C D E）
    @Test("F Major")
    func testFMajor() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),  // F
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, -1, 70), // Bb
            (.C, 0, 72),  // C
            (.D, 0, 74),  // D
            (.E, 0, 76)   // E
        ])
    }

    /// F# 大调（F# G# A# B C# D# E#）
    @Test("F# Major")
    func testFSharpMajor() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.E, 1, 77)   // E#
        ])
    }

    /// Fb 大调（Fb Gb Ab Bbb Cb Db Eb）
    @Test("Fb Major")
    func testFFlatMajor() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75)   // Eb
        ])
    }

    /// F## 大调（F## G## A## B# C## D## E##）
    @Test("F## Major")
    func testFDoubleSharpMajor() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.E, 2, 78)   // E##
        ])
    }

    /// Fbb 大调（Fbb Gbb Abb Bbbb Cbb Dbb Ebb）
    @Test("Fbb Major")
    func testFDoubleFlatMajor() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74)   // Ebb
        ])
    }

    /// F### 大调（F### G### A### B## C### D### E###）
    @Test("F### Major")
    func testFTripleSharpMajor() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.E, 3, 79)   // E###
        ])
    }

    /// Fbbb 大调（Fbbb Gbbb Abbb Bbbbb Cbbb Dbbb Ebbb）
    @Test("Fbbb Major")
    func testFTripleFlatMajor() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // Bbbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 大调（G A B C D E F#）
    @Test("G Major")
    func testGMajor() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 0, 72),  // C
            (.D, 0, 74),  // D
            (.E, 0, 76),  // E
            (.F, 1, 78)   // F#
        ])
    }

    /// G# 大调（G# A# B# C# D# E# F##）
    @Test("G# Major")
    func testGSharpMajor() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.E, 1, 77),  // E#
            (.F, 2, 79)   // F##
        ])
    }

    /// Gb 大调（Gb Ab Bb Cb Db Eb F）
    @Test("Gb Major")
    func testGFlatMajor() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, 0, 77)    // F
        ])
    }

    /// G## 大调（G## A## B## C## D## E## F###）
    @Test("G## Major")
    func testGDoubleSharpMajor() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.E, 2, 78),  // E##
            (.F, 3, 80)   // F###
        ])
    }

    /// Gbb 大调（Gbb Abb Bbb Cbb Dbb Ebb Fb）
    @Test("Gbb Major")
    func testGDoubleFlatMajor() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76)   // Fb
        ])
    }

    /// G### 大调（G### A### B### C### D### E### F####）
    @Test("G### Major")
    func testGTripleSharpMajor() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.E, 3, 79),  // E###
            (.F, 4, 81)   // F####
        ])
    }

    /// Gbbb 大调（Gbbb Abbb Bbbb Cbbb Dbbb Ebbb Fbb）
    @Test("Gbbb Major")
    func testGTripleFlatMajor() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75)   // Fbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 大调（A B C# D E F# G#）
    @Test("A Major")
    func testAMajor() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 0, 74),  // D
            (.E, 0, 76),  // E
            (.F, 1, 78),  // F#
            (.G, 1, 80)   // G#
        ])
    }

    /// A# 大调（A# B# C## D# E# F## G##）
    @Test("A# Major")
    func testASharpMajor() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.E, 1, 77),  // E#
            (.F, 2, 79),  // F##
            (.G, 2, 81)   // G##
        ])
    }

    /// Ab 大调（Ab Bb C Db Eb F G）
    @Test("Ab Major")
    func testAFlatMajor() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, 0, 77),   // F
            (.G, 0, 79)    // G
        ])
    }

    /// A## 大调（A## B## C### D## E## F### G###）
    @Test("A## Major")
    func testADoubleSharpMajor() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.E, 2, 78),  // E##
            (.F, 3, 80),  // F###
            (.G, 3, 82)   // G###
        ])
    }

    /// Abb 大调（Abb Bbb Cb Dbb Ebb Fb Gb）
    @Test("Abb Major")
    func testADoubleFlatMajor() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -1, 78)   // Gb
        ])
    }

    /// A### 大调（A### B### C#### D### E### F#### G####）
    @Test("A### Major")
    func testATripleSharpMajor() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.E, 3, 79),  // E###
            (.F, 4, 81),  // F####
            (.G, 4, 83)   // G####
        ])
    }

    /// Abbb 大调（Abbb Bbbb Cbb Dbbb Ebbb Fbb Gbb）
    @Test("Abbb Major")
    func testATripleFlatMajor() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77)   // Gbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 大调（B C# D# E F# G# A#）
    @Test("B Major")
    func testBMajor() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.E, 0, 76),  // E
            (.F, 1, 78),  // F#
            (.G, 1, 80),  // G#
            (.A, 1, 82)   // A#
        ])
    }

    /// B# 大调（B# C## D## E# F## G## A##）
    @Test("B# Major")
    func testBSharpMajor() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.E, 1, 77),  // E#
            (.F, 2, 79),  // F##
            (.G, 2, 81),  // G##
            (.A, 2, 83)   // A##
        ])
    }

    /// Bb 大调（Bb C D Eb F G A）
    @Test("Bb Major")
    func testBFlatMajor() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, 0, 74),   // D
            (.E, -1, 75),  // Eb
            (.F, 0, 77),   // F
            (.G, 0, 79),   // G
            (.A, 0, 81)    // A
        ])
    }

    /// B## 大调（B## C### D### E## F### G### A###）
    @Test("B## Major")
    func testBDoubleSharpMajor() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.E, 2, 78),  // E##
            (.F, 3, 80),  // F###
            (.G, 3, 82),  // G###
            (.A, 3, 84)   // A###
        ])
    }

    /// Bbb 大调（Bbb Cb Db Ebb Fb Gb Ab）
    @Test("Bbb Major")
    func testBDoubleFlatMajor() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -1, 78),  // Gb
            (.A, -1, 80)   // Ab
        ])
    }

    /// B### 大调（B### C#### D#### E### F#### G#### A####）
    @Test("B### Major")
    func testBTripleSharpMajor() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 4, 78),  // D####
            (.E, 3, 79),  // E###
            (.F, 4, 81),  // F####
            (.G, 4, 83),  // G####
            (.A, 4, 85)   // A####
        ])
    }

    /// Bbbb 大调（Bbbb Cbb Dbb Ebbb Fbb Gbb Abb）
    @Test("Bbbb Major")
    func testBTripleFlatMajor() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyMajorScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77),  // Gbb
            (.A, -2, 79)   // Abb
        ])
    }
}
