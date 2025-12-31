//
//  WholeDiminishedScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  全-减音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("WholeDiminished Scale Comprehensive Tests")
struct WholeDiminishedScaleTests {

    // MARK: - Helper Methods

    /// 验证全-减音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 8 个音符 (letter, accidental, pitch)
    func verifyWholeDiminishedScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .wholeDiminished)
        let notes = scale.allNotes()

        #expect(notes.count == 8)

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

    /// C 全-减音阶（C D Eb E# F# G# A B）
    @Test("C WholeDiminished")
    func testCWholeDiminished() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),  // C
            (.D, 0, 62),  // D
            (.E, -1, 63),  // Eb
            (.E, 1, 65),  // E#
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.B, 0, 71)   // B
        ])
    }

    /// C# 全-减音阶（C# D# E E## F## G## A# B#）
    @Test("C# WholeDiminished")
    func testCSharpWholeDiminished() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),  // C#
            (.D, 1, 63),  // D#
            (.E, 0, 64),  // E
            (.E, 2, 66),  // E##
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.B, 1, 72)   // B#
        ])
    }

    /// Cb 全-减音阶（Cb Db Ebb E F G Ab Bb）
    @Test("Cb WholeDiminished")
    func testCFlatWholeDiminished() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.D, -1, 61),  // Db
            (.E, -2, 62),  // Ebb
            (.E, 0, 64),  // E
            (.F, 0, 65),  // F
            (.G, 0, 67),  // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70)   // Bb
        ])
    }

    /// C## 全-减音阶（C## D## E# E### F### G### A## B##）
    @Test("C## WholeDiminished")
    func testCDoubleSharpWholeDiminished() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),  // C##
            (.D, 2, 64),  // D##
            (.E, 1, 65),  // E#
            (.E, 3, 67),  // E###
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.B, 2, 73)   // B##
        ])
    }

    /// Cbb 全-减音阶（Cbb Dbb Ebbb Eb Fb Gb Abb Bbb）
    @Test("Cbb WholeDiminished")
    func testCDoubleFlatWholeDiminished() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.D, -2, 60),  // Dbb
            (.E, -3, 61),  // Ebbb
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69)   // Bbb
        ])
    }

    /// C### 全-减音阶（C### D### E## E#### F#### G#### A### B###）
    @Test("C### WholeDiminished")
    func testCTripleSharpWholeDiminished() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),  // C###
            (.D, 3, 65),  // D###
            (.E, 2, 66),  // E##
            (.E, 4, 68),  // E####
            (.F, 4, 69),  // F####
            (.G, 4, 71),  // G####
            (.A, 3, 72),  // A###
            (.B, 3, 74)   // B###
        ])
    }

    /// Cbbb 全-减音阶（Cbbb Dbbb Ebbbb Ebb Fbb Gbb Abbb Bbbb）
    @Test("Cbbb WholeDiminished")
    func testCTripleFlatWholeDiminished() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.D, -3, 59),  // Dbbb
            (.E, -4, 60),  // Ebbbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68)   // Bbbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 全-减音阶（D E F F## G# A# B C#）
    @Test("D WholeDiminished")
    func testDWholeDiminished() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),  // D
            (.E, 0, 64),  // E
            (.F, 0, 65),  // F
            (.F, 2, 67),  // F##
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.C, 1, 73)   // C#
        ])
    }

    /// D# 全-减音阶（D# E# F# F### G## A## B# C##）
    @Test("D# WholeDiminished")
    func testDSharpWholeDiminished() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),  // D#
            (.E, 1, 65),  // E#
            (.F, 1, 66),  // F#
            (.F, 3, 68),  // F###
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.C, 2, 74)   // C##
        ])
    }

    /// Db 全-减音阶（Db Eb Fb F# G A Bb C）
    @Test("Db WholeDiminished")
    func testDFlatWholeDiminished() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.E, -1, 63),  // Eb
            (.F, -1, 64),  // Fb
            (.F, 1, 66),  // F#
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, -1, 70),  // Bb
            (.C, 0, 72)   // C
        ])
    }

    /// D## 全-减音阶（D## E## F## F#### G### A### B## C###）
    @Test("D## WholeDiminished")
    func testDDoubleSharpWholeDiminished() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),  // D##
            (.E, 2, 66),  // E##
            (.F, 2, 67),  // F##
            (.F, 4, 69),  // F####
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.C, 3, 75)   // C###
        ])
    }

    /// Dbb 全-减音阶（Dbb Ebb Fbb F Gb Ab Bbb Cb）
    @Test("Dbb WholeDiminished")
    func testDDoubleFlatWholeDiminished() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.E, -2, 62),  // Ebb
            (.F, -2, 63),  // Fbb
            (.F, 0, 65),  // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71)   // Cb
        ])
    }

    /// D### 全-减音阶（D### E### F### F##### G#### A#### B### C####）
    @Test("D### WholeDiminished")
    func testDTripleSharpWholeDiminished() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),  // D###
            (.E, 3, 67),  // E###
            (.F, 3, 68),  // F###
            (.F, 5, 70),  // F#####
            (.G, 4, 71),  // G####
            (.A, 4, 73),  // A####
            (.B, 3, 74),  // B###
            (.C, 4, 76)   // C####
        ])
    }

    /// Dbbb 全-减音阶（Dbbb Ebbb Fbbb Fb Gbb Abb Bbbb Cbb）
    @Test("Dbbb WholeDiminished")
    func testDTripleFlatWholeDiminished() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.E, -3, 61),  // Ebbb
            (.F, -3, 62),  // Fbbb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70)   // Cbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 全-减音阶（E F# G G## A# B# C# D#）
    @Test("E WholeDiminished")
    func testEWholeDiminished() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),  // E
            (.F, 1, 66),  // F#
            (.G, 0, 67),  // G
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.D, 1, 75)   // D#
        ])
    }

    /// E# 全-减音阶（E# F## G# G### A## B## C## D##）
    @Test("E# WholeDiminished")
    func testESharpWholeDiminished() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),  // E#
            (.F, 2, 67),  // F##
            (.G, 1, 68),  // G#
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.D, 2, 76)   // D##
        ])
    }

    /// Eb 全-减音阶（Eb F Gb G# A B C D）
    @Test("Eb WholeDiminished")
    func testEFlatWholeDiminished() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.F, 0, 65),  // F
            (.G, -1, 66),  // Gb
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 0, 72),  // C
            (.D, 0, 74)   // D
        ])
    }

    /// E## 全-减音阶（E## F### G## G#### A### B### C### D###）
    @Test("E## WholeDiminished")
    func testEDoubleSharpWholeDiminished() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),  // E##
            (.F, 3, 68),  // F###
            (.G, 2, 69),  // G##
            (.G, 4, 71),  // G####
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.D, 3, 77)   // D###
        ])
    }

    /// Ebb 全-减音阶（Ebb Fb Gbb G Ab Bb Cb Db）
    @Test("Ebb WholeDiminished")
    func testEDoubleFlatWholeDiminished() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.G, 0, 67),  // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73)   // Db
        ])
    }

    /// E### 全-减音阶（E### F#### G### G##### A#### B#### C#### D####）
    @Test("E### WholeDiminished")
    func testETripleSharpWholeDiminished() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),  // E###
            (.F, 4, 69),  // F####
            (.G, 3, 70),  // G###
            (.G, 5, 72),  // G#####
            (.A, 4, 73),  // A####
            (.B, 4, 75),  // B####
            (.C, 4, 76),  // C####
            (.D, 4, 78)   // D####
        ])
    }

    /// Ebbb 全-减音阶（Ebbb Fbb Gbbb Gb Abb Bbb Cbb Dbb）
    @Test("Ebbb WholeDiminished")
    func testETripleFlatWholeDiminished() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72)   // Dbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 全-减音阶（F G Ab A# B C# D E）
    @Test("F WholeDiminished")
    func testFWholeDiminished() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),  // F
            (.G, 0, 67),  // G
            (.A, -1, 68),  // Ab
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 0, 74),  // D
            (.E, 0, 76)   // E
        ])
    }

    /// F# 全-减音阶（F# G# A A## B# C## D# E#）
    @Test("F# WholeDiminished")
    func testFSharpWholeDiminished() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.E, 1, 77)   // E#
        ])
    }

    /// Fb 全-减音阶（Fb Gb Abb A Bb C Db Eb）
    @Test("Fb WholeDiminished")
    func testFFlatWholeDiminished() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.A, 0, 69),  // A
            (.B, -1, 70),  // Bb
            (.C, 0, 72),  // C
            (.D, -1, 73),  // Db
            (.E, -1, 75)   // Eb
        ])
    }

    /// F## 全-减音阶（F## G## A# A### B## C### D## E##）
    @Test("F## WholeDiminished")
    func testFDoubleSharpWholeDiminished() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.E, 2, 78)   // E##
        ])
    }

    /// Fbb 全-减音阶（Fbb Gbb Abbb Ab Bbb Cb Dbb Ebb）
    @Test("Fbb WholeDiminished")
    func testFDoubleFlatWholeDiminished() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74)   // Ebb
        ])
    }

    /// F### 全-减音阶（F### G### A## A#### B### C#### D### E###）
    @Test("F### WholeDiminished")
    func testFTripleSharpWholeDiminished() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.A, 4, 73),  // A####
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.E, 3, 79)   // E###
        ])
    }

    /// Fbbb 全-减音阶（Fbbb Gbbb Abbbb Abb Bbbb Cbb Dbbb Ebbb）
    @Test("Fbbb WholeDiminished")
    func testFTripleFlatWholeDiminished() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.A, -4, 65),  // Abbbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 全-减音阶（G A Bb B# C# D# E F#）
    @Test("G WholeDiminished")
    func testGWholeDiminished() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, -1, 70),  // Bb
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.E, 0, 76),  // E
            (.F, 1, 78)   // F#
        ])
    }

    /// G# 全-减音阶（G# A# B B## C## D## E# F##）
    @Test("G# WholeDiminished")
    func testGSharpWholeDiminished() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.E, 1, 77),  // E#
            (.F, 2, 79)   // F##
        ])
    }

    /// Gb 全-减音阶（Gb Ab Bbb B C D Eb F）
    @Test("Gb WholeDiminished")
    func testGFlatWholeDiminished() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.B, 0, 71),  // B
            (.C, 0, 72),  // C
            (.D, 0, 74),  // D
            (.E, -1, 75),  // Eb
            (.F, 0, 77)   // F
        ])
    }

    /// G## 全-减音阶（G## A## B# B### C### D### E## F###）
    @Test("G## WholeDiminished")
    func testGDoubleSharpWholeDiminished() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.E, 2, 78),  // E##
            (.F, 3, 80)   // F###
        ])
    }

    /// Gbb 全-减音阶（Gbb Abb Bbbb Bb Cb Db Ebb Fb）
    @Test("Gbb WholeDiminished")
    func testGDoubleFlatWholeDiminished() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, -1, 76)   // Fb
        ])
    }

    /// G### 全-减音阶（G### A### B## B#### C#### D#### E### F####）
    @Test("G### WholeDiminished")
    func testGTripleSharpWholeDiminished() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.B, 4, 75),  // B####
            (.C, 4, 76),  // C####
            (.D, 4, 78),  // D####
            (.E, 3, 79),  // E###
            (.F, 4, 81)   // F####
        ])
    }

    /// Gbbb 全-减音阶（Gbbb Abbb Bbbbb Bbb Cbb Dbb Ebbb Fbb）
    @Test("Gbbb WholeDiminished")
    func testGTripleFlatWholeDiminished() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67),  // Bbbbb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75)   // Fbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 全-减音阶（A B C C## D# E# F# G#）
    @Test("A WholeDiminished")
    func testAWholeDiminished() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 0, 72),  // C
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.E, 1, 77),  // E#
            (.F, 1, 78),  // F#
            (.G, 1, 80)   // G#
        ])
    }

    /// A# 全-减音阶（A# B# C# C### D## E## F## G##）
    @Test("A# WholeDiminished")
    func testASharpWholeDiminished() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.E, 2, 78),  // E##
            (.F, 2, 79),  // F##
            (.G, 2, 81)   // G##
        ])
    }

    /// Ab 全-减音阶（Ab Bb Cb C# D E F G）
    @Test("Ab WholeDiminished")
    func testAFlatWholeDiminished() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.C, 1, 73),  // C#
            (.D, 0, 74),  // D
            (.E, 0, 76),  // E
            (.F, 0, 77),  // F
            (.G, 0, 79)   // G
        ])
    }

    /// A## 全-减音阶（A## B## C## C#### D### E### F### G###）
    @Test("A## WholeDiminished")
    func testADoubleSharpWholeDiminished() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.E, 3, 79),  // E###
            (.F, 3, 80),  // F###
            (.G, 3, 82)   // G###
        ])
    }

    /// Abb 全-减音阶（Abb Bbb Cbb C Db Eb Fb Gb）
    @Test("Abb WholeDiminished")
    func testADoubleFlatWholeDiminished() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.C, 0, 72),  // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, -1, 76),  // Fb
            (.G, -1, 78)   // Gb
        ])
    }

    /// A### 全-减音阶（A### B### C### C##### D#### E#### F#### G####）
    @Test("A### WholeDiminished")
    func testATripleSharpWholeDiminished() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.C, 5, 77),  // C#####
            (.D, 4, 78),  // D####
            (.E, 4, 80),  // E####
            (.F, 4, 81),  // F####
            (.G, 4, 83)   // G####
        ])
    }

    /// Abbb 全-减音阶（Abbb Bbbb Cbbb Cb Dbb Ebb Fbb Gbb）
    @Test("Abbb WholeDiminished")
    func testATripleFlatWholeDiminished() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77)   // Gbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 全-减音阶（B C# D D## E# F## G# A#）
    @Test("B WholeDiminished")
    func testBWholeDiminished() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 0, 74),  // D
            (.D, 2, 76),  // D##
            (.E, 1, 77),  // E#
            (.F, 2, 79),  // F##
            (.G, 1, 80),  // G#
            (.A, 1, 82)   // A#
        ])
    }

    /// B# 全-减音阶（B# C## D# D### E## F### G## A##）
    @Test("B# WholeDiminished")
    func testBSharpWholeDiminished() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.D, 3, 77),  // D###
            (.E, 2, 78),  // E##
            (.F, 3, 80),  // F###
            (.G, 2, 81),  // G##
            (.A, 2, 83)   // A##
        ])
    }

    /// Bb 全-减音阶（Bb C Db D# E F# G A）
    @Test("Bb WholeDiminished")
    func testBFlatWholeDiminished() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.C, 0, 72),  // C
            (.D, -1, 73),  // Db
            (.D, 1, 75),  // D#
            (.E, 0, 76),  // E
            (.F, 1, 78),  // F#
            (.G, 0, 79),  // G
            (.A, 0, 81)   // A
        ])
    }

    /// B## 全-减音阶（B## C### D## D#### E### F#### G### A###）
    @Test("B## WholeDiminished")
    func testBDoubleSharpWholeDiminished() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.D, 4, 78),  // D####
            (.E, 3, 79),  // E###
            (.F, 4, 81),  // F####
            (.G, 3, 82),  // G###
            (.A, 3, 84)   // A###
        ])
    }

    /// Bbb 全-减音阶（Bbb Cb Dbb D Eb F Gb Ab）
    @Test("Bbb WholeDiminished")
    func testBDoubleFlatWholeDiminished() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.D, 0, 74),  // D
            (.E, -1, 75),  // Eb
            (.F, 0, 77),  // F
            (.G, -1, 78),  // Gb
            (.A, -1, 80)   // Ab
        ])
    }

    /// B### 全-减音阶（B### C#### D### D##### E#### F##### G#### A####）
    @Test("B### WholeDiminished")
    func testBTripleSharpWholeDiminished() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.D, 5, 79),  // D#####
            (.E, 4, 80),  // E####
            (.F, 5, 82),  // F#####
            (.G, 4, 83),  // G####
            (.A, 4, 85)   // A####
        ])
    }

    /// Bbbb 全-减音阶（Bbbb Cbb Dbbb Db Ebb Fb Gbb Abb）
    @Test("Bbbb WholeDiminished")
    func testBTripleFlatWholeDiminished() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyWholeDiminishedScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -2, 77),  // Gbb
            (.A, -2, 79)   // Abb
        ])
    }
}
