//
//  MajorBluesScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  大调布鲁斯音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Major Blues Scale Comprehensive Tests")
struct MajorBluesScaleTests {

    // MARK: - Helper Methods

    /// 验证大调布鲁斯音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 6 个音符 (letter, accidental, pitch)
    func verifyMajorBluesScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .majorBlues)
        let notes = scale.allNotes()

        #expect(notes.count == 6)

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

    /// C 大调布鲁斯音阶（C D Eb E G A）
    @Test("C Major Blues")
    func testCMajorBlues() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),   // C
            (.D, 0, 62),   // D
            (.E, -1, 63),  // Eb
            (.E, 0, 64),   // E
            (.G, 0, 67),   // G
            (.A, 0, 69)    // A
        ])
    }

    /// C# 大调布鲁斯音阶（C# D# E E# G# A#）
    @Test("C# Major Blues")
    func testCSharpMajorBlues() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),  // C#
            (.D, 1, 63),  // D#
            (.E, 0, 64),  // E
            (.E, 1, 65),  // E#
            (.G, 1, 68),  // G#
            (.A, 1, 70)   // A#
        ])
    }

    /// Cb 大调布鲁斯音阶（Cb Db Ebb Eb Gb Ab）
    @Test("Cb Major Blues")
    func testCFlatMajorBlues() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -1, 61),  // Db
            (.E, -2, 62),  // Ebb
            (.E, -1, 63),  // Eb
            (.G, -1, 66),  // Gb
            (.A, -1, 68)   // Ab
        ])
    }

    /// C## 大调布鲁斯音阶（C## D## E# E## G## A##）
    @Test("C## Major Blues")
    func testCDoubleSharpMajorBlues() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),  // C##
            (.D, 2, 64),  // D##
            (.E, 1, 65),  // E#
            (.E, 2, 66),  // E##
            (.G, 2, 69),  // G##
            (.A, 2, 71)   // A##
        ])
    }

    /// Cbb 大调布鲁斯音阶（Cbb Dbb Ebbb Ebb Gbb Abb）
    @Test("Cbb Major Blues")
    func testCDoubleFlatMajorBlues() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -2, 60),  // Dbb
            (.E, -3, 61),  // Ebbb
            (.E, -2, 62),  // Ebb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67)   // Abb
        ])
    }

    /// C### 大调布鲁斯音阶（C### D### E## E### G### A###）
    @Test("C### Major Blues")
    func testCTripleSharpMajorBlues() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),  // C###
            (.D, 3, 65),  // D###
            (.E, 2, 66),  // E##
            (.E, 3, 67),  // E###
            (.G, 3, 70),  // G###
            (.A, 3, 72)   // A###
        ])
    }

    /// Cbbb 大调布鲁斯音阶（Cbbb Dbbb Ebbbb Ebbb Gbbb Abbb）
    @Test("Cbbb Major Blues")
    func testCTripleFlatMajorBlues() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -3, 59),  // Dbbb
            (.E, -4, 60),  // Ebbbb
            (.E, -3, 61),  // Ebbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66)   // Abbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 大调布鲁斯音阶（D E F F# A B）
    @Test("D Major Blues")
    func testDMajorBlues() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),  // D
            (.E, 0, 64),  // E
            (.F, 0, 65),  // F
            (.F, 1, 66),  // F#
            (.A, 0, 69),  // A
            (.B, 0, 71)   // B
        ])
    }

    /// D# 大调布鲁斯音阶（D# E# F# F## A# B#）
    @Test("D# Major Blues")
    func testDSharpMajorBlues() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),  // D#
            (.E, 1, 65),  // E#
            (.F, 1, 66),  // F#
            (.F, 2, 67),  // F##
            (.A, 1, 70),  // A#
            (.B, 1, 72)   // B#
        ])
    }

    /// Db 大调布鲁斯音阶（Db Eb Fb F Ab Bb）
    @Test("Db Major Blues")
    func testDFlatMajorBlues() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.F, 0, 65),   // F
            (.A, -1, 68),  // Ab
            (.B, -1, 70)   // Bb
        ])
    }

    /// D## 大调布鲁斯音阶（D## E## F## F### A## B##）
    @Test("D## Major Blues")
    func testDDoubleSharpMajorBlues() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),  // D##
            (.E, 2, 66),  // E##
            (.F, 2, 67),  // F##
            (.F, 3, 68),  // F###
            (.A, 2, 71),  // A##
            (.B, 2, 73)   // B##
        ])
    }

    /// Dbb 大调布鲁斯音阶（Dbb Ebb Fbb Fb Abb Bbb）
    @Test("Dbb Major Blues")
    func testDDoubleFlatMajorBlues() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.F, -1, 64),  // Fb
            (.A, -2, 67),  // Abb
            (.B, -2, 69)   // Bbb
        ])
    }

    /// D### 大调布鲁斯音阶（D### E### F### F#### A### B###）
    @Test("D### Major Blues")
    func testDTripleSharpMajorBlues() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),  // D###
            (.E, 3, 67),  // E###
            (.F, 3, 68),  // F###
            (.F, 4, 69),  // F####
            (.A, 3, 72),  // A###
            (.B, 3, 74)   // B###
        ])
    }

    /// Dbbb 大调布鲁斯音阶（Dbbb Ebbb Fbbb Fbb Abbb Bbbb）
    @Test("Dbbb Major Blues")
    func testDTripleFlatMajorBlues() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.F, -2, 63),  // Fbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68)   // Bbbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 大调布鲁斯音阶（E F# G G# B C#）
    @Test("E Major Blues")
    func testEMajorBlues() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),  // E
            (.F, 1, 66),  // F#
            (.G, 0, 67),  // G
            (.G, 1, 68),  // G#
            (.B, 0, 71),  // B
            (.C, 1, 73)   // C#
        ])
    }

    /// E# 大调布鲁斯音阶（E# F## G# G## B# C##）
    @Test("E# Major Blues")
    func testESharpMajorBlues() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),  // E#
            (.F, 2, 67),  // F##
            (.G, 1, 68),  // G#
            (.G, 2, 69),  // G##
            (.B, 1, 72),  // B#
            (.C, 2, 74)   // C##
        ])
    }

    /// Eb 大调布鲁斯音阶（Eb F Gb G Bb C）
    @Test("Eb Major Blues")
    func testEFlatMajorBlues() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.G, -1, 66),  // Gb
            (.G, 0, 67),   // G
            (.B, -1, 70),  // Bb
            (.C, 0, 72)    // C
        ])
    }

    /// E## 大调布鲁斯音阶（E## F### G## G### B## C###）
    @Test("E## Major Blues")
    func testEDoubleSharpMajorBlues() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),  // E##
            (.F, 3, 68),  // F###
            (.G, 2, 69),  // G##
            (.G, 3, 70),  // G###
            (.B, 2, 73),  // B##
            (.C, 3, 75)   // C###
        ])
    }

    /// Ebb 大调布鲁斯音阶（Ebb Fb Gbb Gb Bbb Cb）
    @Test("Ebb Major Blues")
    func testEDoubleFlatMajorBlues() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.G, -1, 66),  // Gb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71)   // Cb
        ])
    }

    /// E### 大调布鲁斯音阶（E### F#### G### G#### B### C####）
    @Test("E### Major Blues")
    func testETripleSharpMajorBlues() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),  // E###
            (.F, 4, 69),  // F####
            (.G, 3, 70),  // G###
            (.G, 4, 71),  // G####
            (.B, 3, 74),  // B###
            (.C, 4, 76)   // C####
        ])
    }

    /// Ebbb 大调布鲁斯音阶（Ebbb Fbb Gbbb Gbb Bbbb Cbb）
    @Test("Ebbb Major Blues")
    func testETripleFlatMajorBlues() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.G, -2, 65),  // Gbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70)   // Cbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 大调布鲁斯音阶（F G Ab A C D）
    @Test("F Major Blues")
    func testFMajorBlues() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),   // F
            (.G, 0, 67),   // G
            (.A, -1, 68),  // Ab
            (.A, 0, 69),   // A
            (.C, 0, 72),   // C
            (.D, 0, 74)    // D
        ])
    }

    /// F# 大调布鲁斯音阶（F# G# A A# C# D#）
    @Test("F# Major Blues")
    func testFSharpMajorBlues() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.A, 1, 70),  // A#
            (.C, 1, 73),  // C#
            (.D, 1, 75)   // D#
        ])
    }

    /// Fb 大调布鲁斯音阶（Fb Gb Abb Ab Cb Db）
    @Test("Fb Major Blues")
    func testFFlatMajorBlues() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.A, -1, 68),  // Ab
            (.C, -1, 71),  // Cb
            (.D, -1, 73)   // Db
        ])
    }

    /// F## 大调布鲁斯音阶（F## G## A# A## C## D##）
    @Test("F## Major Blues")
    func testFDoubleSharpMajorBlues() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.A, 2, 71),  // A##
            (.C, 2, 74),  // C##
            (.D, 2, 76)   // D##
        ])
    }

    /// Fbb 大调布鲁斯音阶（Fbb Gbb Abbb Abb Cbb Dbb）
    @Test("Fbb Major Blues")
    func testFDoubleFlatMajorBlues() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.A, -2, 67),  // Abb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72)   // Dbb
        ])
    }

    /// F### 大调布鲁斯音阶（F### G### A## A### C### D###）
    @Test("F### Major Blues")
    func testFTripleSharpMajorBlues() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.A, 3, 72),  // A###
            (.C, 3, 75),  // C###
            (.D, 3, 77)   // D###
        ])
    }

    /// Fbbb 大调布鲁斯音阶（Fbbb Gbbb Abbbb Abbb Cbbb Dbbb）
    @Test("Fbbb Major Blues")
    func testFTripleFlatMajorBlues() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // Abbbb
            (.A, -3, 66),  // Abbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71)   // Dbbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 大调布鲁斯音阶（G A Bb B D E）
    @Test("G Major Blues")
    func testGMajorBlues() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),   // G
            (.A, 0, 69),   // A
            (.B, -1, 70),  // Bb
            (.B, 0, 71),   // B
            (.D, 0, 74),   // D
            (.E, 0, 76)    // E
        ])
    }

    /// G# 大调布鲁斯音阶（G# A# B B# D# E#）
    @Test("G# Major Blues")
    func testGSharpMajorBlues() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.B, 1, 72),  // B#
            (.D, 1, 75),  // D#
            (.E, 1, 77)   // E#
        ])
    }

    /// Gb 大调布鲁斯音阶（Gb Ab Bbb Bb Db Eb）
    @Test("Gb Major Blues")
    func testGFlatMajorBlues() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.B, -1, 70),  // Bb
            (.D, -1, 73),  // Db
            (.E, -1, 75)   // Eb
        ])
    }

    /// G## 大调布鲁斯音阶（G## A## B# B## D## E##）
    @Test("G## Major Blues")
    func testGDoubleSharpMajorBlues() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.B, 2, 73),  // B##
            (.D, 2, 76),  // D##
            (.E, 2, 78)   // E##
        ])
    }

    /// Gbb 大调布鲁斯音阶（Gbb Abb Bbbb Bbb Dbb Ebb）
    @Test("Gbb Major Blues")
    func testGDoubleFlatMajorBlues() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.B, -2, 69),  // Bbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74)   // Ebb
        ])
    }

    /// G### 大调布鲁斯音阶（G### A### B## B### D### E###）
    @Test("G### Major Blues")
    func testGTripleSharpMajorBlues() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.B, 3, 74),  // B###
            (.D, 3, 77),  // D###
            (.E, 3, 79)   // E###
        ])
    }

    /// Gbbb 大调布鲁斯音阶（Gbbb Abbb Bbbbb Bbbb Dbbb Ebbb）
    @Test("Gbbb Major Blues")
    func testGTripleFlatMajorBlues() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // Bbbbb
            (.B, -3, 68),  // Bbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 大调布鲁斯音阶（A B C C# E F#）
    @Test("A Major Blues")
    func testAMajorBlues() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 0, 72),  // C
            (.C, 1, 73),  // C#
            (.E, 0, 76),  // E
            (.F, 1, 78)   // F#
        ])
    }

    /// A# 大调布鲁斯音阶（A# B# C# C## E# F##）
    @Test("A# Major Blues")
    func testASharpMajorBlues() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.C, 2, 74),  // C##
            (.E, 1, 77),  // E#
            (.F, 2, 79)   // F##
        ])
    }

    /// Ab 大调布鲁斯音阶（Ab Bb Cb C Eb F）
    @Test("Ab Major Blues")
    func testAFlatMajorBlues() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.C, 0, 72),   // C
            (.E, -1, 75),  // Eb
            (.F, 0, 77)    // F
        ])
    }

    /// A## 大调布鲁斯音阶（A## B## C## C### E## F###）
    @Test("A## Major Blues")
    func testADoubleSharpMajorBlues() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.C, 3, 75),  // C###
            (.E, 2, 78),  // E##
            (.F, 3, 80)   // F###
        ])
    }

    /// Abb 大调布鲁斯音阶（Abb Bbb Cbb Cb Ebb Fb）
    @Test("Abb Major Blues")
    func testADoubleFlatMajorBlues() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.C, -1, 71),  // Cb
            (.E, -2, 74),  // Ebb
            (.F, -1, 76)   // Fb
        ])
    }

    /// A### 大调布鲁斯音阶（A### B### C### C#### E### F####）
    @Test("A### Major Blues")
    func testATripleSharpMajorBlues() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.C, 4, 76),  // C####
            (.E, 3, 79),  // E###
            (.F, 4, 81)   // F####
        ])
    }

    /// Abbb 大调布鲁斯音阶（Abbb Bbbb Cbbb Cbb Ebbb Fbb）
    @Test("Abbb Major Blues")
    func testATripleFlatMajorBlues() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.C, -2, 70),  // Cbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75)   // Fbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 大调布鲁斯音阶（B C# D D# F# G#）
    @Test("B Major Blues")
    func testBMajorBlues() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 0, 74),  // D
            (.D, 1, 75),  // D#
            (.F, 1, 78),  // F#
            (.G, 1, 80)   // G#
        ])
    }

    /// B# 大调布鲁斯音阶（B# C## D# D## F## G##）
    @Test("B# Major Blues")
    func testBSharpMajorBlues() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.D, 2, 76),  // D##
            (.F, 2, 79),  // F##
            (.G, 2, 81)   // G##
        ])
    }

    /// Bb 大调布鲁斯音阶（Bb C Db D F G）
    @Test("Bb Major Blues")
    func testBFlatMajorBlues() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.D, -1, 73),  // Db
            (.D, 0, 74),   // D
            (.F, 0, 77),   // F
            (.G, 0, 79)    // G
        ])
    }

    /// B## 大调布鲁斯音阶（B## C### D## D### F### G###）
    @Test("B## Major Blues")
    func testBDoubleSharpMajorBlues() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.D, 3, 77),  // D###
            (.F, 3, 80),  // F###
            (.G, 3, 82)   // G###
        ])
    }

    /// Bbb 大调布鲁斯音阶（Bbb Cb Dbb Db Fb Gb）
    @Test("Bbb Major Blues")
    func testBDoubleFlatMajorBlues() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.D, -1, 73),  // Db
            (.F, -1, 76),  // Fb
            (.G, -1, 78)   // Gb
        ])
    }

    /// B### 大调布鲁斯音阶（B### C#### D### D#### F#### G####）
    @Test("B### Major Blues")
    func testBTripleSharpMajorBlues() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.D, 4, 78),  // D####
            (.F, 4, 81),  // F####
            (.G, 4, 83)   // G####
        ])
    }

    /// Bbbb 大调布鲁斯音阶（Bbbb Cbb Dbbb Dbb Fbb Gbb）
    @Test("Bbbb Major Blues")
    func testBTripleFlatMajorBlues() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyMajorBluesScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.D, -2, 72),  // Dbb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77)   // Gbb
        ])
    }
}
