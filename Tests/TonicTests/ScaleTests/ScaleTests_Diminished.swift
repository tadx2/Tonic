//
//  DiminishedScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  减音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Diminished Scale Comprehensive Tests")
struct DiminishedScaleTests {

    // MARK: - Helper Methods

    /// 验证减音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 8 个音符 (letter, accidental, pitch)
    func verifyDiminishedScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .diminished)
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

    /// C 减音阶（C C# Eb E F# G A Bb）
    @Test("C Diminished")
    func testCDiminished() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),  // C
            (.C, 1, 61),  // C#
            (.E, -1, 63),  // Eb
            (.E, 0, 64),  // E
            (.F, 1, 66),  // F#
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, -1, 70)   // Bb
        ])
    }

    /// C# 减音阶（C# C## E E# F## G# A# B）
    @Test("C# Diminished")
    func testCSharpDiminished() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),  // C#
            (.C, 2, 62),  // C##
            (.E, 0, 64),  // E
            (.E, 1, 65),  // E#
            (.F, 2, 67),  // F##
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 0, 71)   // B
        ])
    }

    /// Cb 减音阶（Cb C Ebb Eb F Gb Ab Bbb）
    @Test("Cb Diminished")
    func testCFlatDiminished() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.C, 0, 60),  // C
            (.E, -2, 62),  // Ebb
            (.E, -1, 63),  // Eb
            (.F, 0, 65),  // F
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69)   // Bbb
        ])
    }

    /// C## 减音阶（C## C### E# E## F### G## A## B#）
    @Test("C## Diminished")
    func testCDoubleSharpDiminished() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),  // C##
            (.C, 3, 63),  // C###
            (.E, 1, 65),  // E#
            (.E, 2, 66),  // E##
            (.F, 3, 68),  // F###
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 1, 72)   // B#
        ])
    }

    /// Cbb 减音阶（Cbb Cb Ebbb Ebb Fb Gbb Abb Bbbb）
    @Test("Cbb Diminished")
    func testCDoubleFlatDiminished() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.C, -1, 59),  // Cb
            (.E, -3, 61),  // Ebbb
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68)   // Bbbb
        ])
    }

    /// C### 减音阶（C### C#### E## E### F#### G### A### B##）
    @Test("C### Diminished")
    func testCTripleSharpDiminished() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),  // C###
            (.C, 4, 64),  // C####
            (.E, 2, 66),  // E##
            (.E, 3, 67),  // E###
            (.F, 4, 69),  // F####
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 2, 73)   // B##
        ])
    }

    /// Cbbb 减音阶（Cbbb Cbb Ebbbb Ebbb Fbb Gbbb Abbb Bbbbb）
    @Test("Cbbb Diminished")
    func testCTripleFlatDiminished() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.C, -2, 58),  // Cbb
            (.E, -4, 60),  // Ebbbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.B, -4, 67)   // Bbbbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 减音阶（D D# F F# G# A B C）
    @Test("D Diminished")
    func testDDiminished() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),  // D
            (.D, 1, 63),  // D#
            (.F, 0, 65),  // F
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 0, 72)   // C
        ])
    }

    /// D# 减音阶（D# D## F# F## G## A# B# C#）
    @Test("D# Diminished")
    func testDSharpDiminished() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),  // D#
            (.D, 2, 64),  // D##
            (.F, 1, 66),  // F#
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 1, 73)   // C#
        ])
    }

    /// Db 减音阶（Db D Fb F G Ab Bb Cb）
    @Test("Db Diminished")
    func testDFlatDiminished() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.D, 0, 62),  // D
            (.F, -1, 64),  // Fb
            (.F, 0, 65),  // F
            (.G, 0, 67),  // G
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71)   // Cb
        ])
    }

    /// D## 减音阶（D## D### F## F### G### A## B## C##）
    @Test("D## Diminished")
    func testDDoubleSharpDiminished() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),  // D##
            (.D, 3, 65),  // D###
            (.F, 2, 67),  // F##
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 2, 74)   // C##
        ])
    }

    /// Dbb 减音阶（Dbb Db Fbb Fb Gb Abb Bbb Cbb）
    @Test("Dbb Diminished")
    func testDDoubleFlatDiminished() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.D, -1, 61),  // Db
            (.F, -2, 63),  // Fbb
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70)   // Cbb
        ])
    }

    /// D### 减音阶（D### D#### F### F#### G#### A### B### C###）
    @Test("D### Diminished")
    func testDTripleSharpDiminished() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),  // D###
            (.D, 4, 66),  // D####
            (.F, 3, 68),  // F###
            (.F, 4, 69),  // F####
            (.G, 4, 71),  // G####
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 3, 75)   // C###
        ])
    }

    /// Dbbb 减音阶（Dbbb Dbb Fbbb Fbb Gbb Abbb Bbbb Cbbb）
    @Test("Dbbb Diminished")
    func testDTripleFlatDiminished() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.D, -2, 60),  // Dbb
            (.F, -3, 62),  // Fbbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69)   // Cbbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 减音阶（E E# G G# A# B C# D）
    @Test("E Diminished")
    func testEDiminished() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),  // E
            (.E, 1, 65),  // E#
            (.G, 0, 67),  // G
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 0, 74)   // D
        ])
    }

    /// E# 减音阶（E# E## G# G## A## B# C## D#）
    @Test("E# Diminished")
    func testESharpDiminished() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),  // E#
            (.E, 2, 66),  // E##
            (.G, 1, 68),  // G#
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 1, 75)   // D#
        ])
    }

    /// Eb 减音阶（Eb E Gb G A Bb C Db）
    @Test("Eb Diminished")
    func testEFlatDiminished() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.E, 0, 64),  // E
            (.G, -1, 66),  // Gb
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.B, -1, 70),  // Bb
            (.C, 0, 72),  // C
            (.D, -1, 73)   // Db
        ])
    }

    /// E## 减音阶（E## E### G## G### A### B## C### D##）
    @Test("E## Diminished")
    func testEDoubleSharpDiminished() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),  // E##
            (.E, 3, 67),  // E###
            (.G, 2, 69),  // G##
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 2, 76)   // D##
        ])
    }

    /// Ebb 减音阶（Ebb Eb Gbb Gb Ab Bbb Cb Dbb）
    @Test("Ebb Diminished")
    func testEDoubleFlatDiminished() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.E, -1, 63),  // Eb
            (.G, -2, 65),  // Gbb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72)   // Dbb
        ])
    }

    /// E### 减音阶（E### E#### G### G#### A#### B### C#### D###）
    @Test("E### Diminished")
    func testETripleSharpDiminished() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),  // E###
            (.E, 4, 68),  // E####
            (.G, 3, 70),  // G###
            (.G, 4, 71),  // G####
            (.A, 4, 73),  // A####
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 3, 77)   // D###
        ])
    }

    /// Ebbb 减音阶（Ebbb Ebb Gbbb Gbb Abb Bbbb Cbb Dbbb）
    @Test("Ebbb Diminished")
    func testETripleFlatDiminished() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.E, -2, 62),  // Ebb
            (.G, -3, 64),  // Gbbb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71)   // Dbbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 减音阶（F F# Ab A B C D Eb）
    @Test("F Diminished")
    func testFDiminished() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),  // F
            (.F, 1, 66),  // F#
            (.A, -1, 68),  // Ab
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.C, 0, 72),  // C
            (.D, 0, 74),  // D
            (.E, -1, 75)   // Eb
        ])
    }

    /// F# 减音阶（F# F## A A# B# C# D# E）
    @Test("F# Diminished")
    func testFSharpDiminished() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),  // F#
            (.F, 2, 67),  // F##
            (.A, 0, 69),  // A
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.E, 0, 76)   // E
        ])
    }

    /// Fb 减音阶（Fb F Abb Ab Bb Cb Db Ebb）
    @Test("Fb Diminished")
    func testFFlatDiminished() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.F, 0, 65),  // F
            (.A, -2, 67),  // Abb
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74)   // Ebb
        ])
    }

    /// F## 减音阶（F## F### A# A## B## C## D## E#）
    @Test("F## Diminished")
    func testFDoubleSharpDiminished() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),  // F##
            (.F, 3, 68),  // F###
            (.A, 1, 70),  // A#
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.E, 1, 77)   // E#
        ])
    }

    /// Fbb 减音阶（Fbb Fb Abbb Abb Bbb Cbb Dbb Ebbb）
    @Test("Fbb Diminished")
    func testFDoubleFlatDiminished() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.F, -1, 64),  // Fb
            (.A, -3, 66),  // Abbb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    /// F### 减音阶（F### F#### A## A### B### C### D### E##）
    @Test("F### Diminished")
    func testFTripleSharpDiminished() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),  // F###
            (.F, 4, 69),  // F####
            (.A, 2, 71),  // A##
            (.A, 3, 72),  // A###
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.E, 2, 78)   // E##
        ])
    }

    /// Fbbb 减音阶（Fbbb Fbb Abbbb Abbb Bbbb Cbbb Dbbb Ebbbb）
    @Test("Fbbb Diminished")
    func testFTripleFlatDiminished() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.F, -2, 63),  // Fbb
            (.A, -4, 65),  // Abbbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.E, -4, 72)   // Ebbbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 减音阶（G G# Bb B C# D E F）
    @Test("G Diminished")
    func testGDiminished() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),  // G
            (.G, 1, 68),  // G#
            (.B, -1, 70),  // Bb
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.D, 0, 74),  // D
            (.E, 0, 76),  // E
            (.F, 0, 77)   // F
        ])
    }

    /// G# 减音阶（G# G## B B# C## D# E# F#）
    @Test("G# Diminished")
    func testGSharpDiminished() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),  // G#
            (.G, 2, 69),  // G##
            (.B, 0, 71),  // B
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.E, 1, 77),  // E#
            (.F, 1, 78)   // F#
        ])
    }

    /// Gb 减音阶（Gb G Bbb Bb C Db Eb Fb）
    @Test("Gb Diminished")
    func testGFlatDiminished() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.G, 0, 67),  // G
            (.B, -2, 69),  // Bbb
            (.B, -1, 70),  // Bb
            (.C, 0, 72),  // C
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, -1, 76)   // Fb
        ])
    }

    /// G## 减音阶（G## G### B# B## C### D## E## F##）
    @Test("G## Diminished")
    func testGDoubleSharpDiminished() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),  // G##
            (.G, 3, 70),  // G###
            (.B, 1, 72),  // B#
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.E, 2, 78),  // E##
            (.F, 2, 79)   // F##
        ])
    }

    /// Gbb 减音阶（Gbb Gb Bbbb Bbb Cb Dbb Ebb Fbb）
    @Test("Gbb Diminished")
    func testGDoubleFlatDiminished() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.G, -1, 66),  // Gb
            (.B, -3, 68),  // Bbbb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75)   // Fbb
        ])
    }

    /// G### 减音阶（G### G#### B## B### C#### D### E### F###）
    @Test("G### Diminished")
    func testGTripleSharpDiminished() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),  // G###
            (.G, 4, 71),  // G####
            (.B, 2, 73),  // B##
            (.B, 3, 74),  // B###
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.E, 3, 79),  // E###
            (.F, 3, 80)   // F###
        ])
    }

    /// Gbbb 减音阶（Gbbb Gbb Bbbbb Bbbb Cbb Dbbb Ebbb Fbbb）
    @Test("Gbbb Diminished")
    func testGTripleFlatDiminished() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.G, -2, 65),  // Gbb
            (.B, -4, 67),  // Bbbbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.F, -3, 74)   // Fbbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 减音阶（A A# C C# D# E F# G）
    @Test("A Diminished")
    func testADiminished() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),  // A
            (.A, 1, 70),  // A#
            (.C, 0, 72),  // C
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.E, 0, 76),  // E
            (.F, 1, 78),  // F#
            (.G, 0, 79)   // G
        ])
    }

    /// A# 减音阶（A# A## C# C## D## E# F## G#）
    @Test("A# Diminished")
    func testASharpDiminished() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),  // A#
            (.A, 2, 71),  // A##
            (.C, 1, 73),  // C#
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.E, 1, 77),  // E#
            (.F, 2, 79),  // F##
            (.G, 1, 80)   // G#
        ])
    }

    /// Ab 减音阶（Ab A Cb C D Eb F Gb）
    @Test("Ab Diminished")
    func testAFlatDiminished() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.A, 0, 69),  // A
            (.C, -1, 71),  // Cb
            (.C, 0, 72),  // C
            (.D, 0, 74),  // D
            (.E, -1, 75),  // Eb
            (.F, 0, 77),  // F
            (.G, -1, 78)   // Gb
        ])
    }

    /// A## 减音阶（A## A### C## C### D### E## F### G##）
    @Test("A## Diminished")
    func testADoubleSharpDiminished() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),  // A##
            (.A, 3, 72),  // A###
            (.C, 2, 74),  // C##
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.E, 2, 78),  // E##
            (.F, 3, 80),  // F###
            (.G, 2, 81)   // G##
        ])
    }

    /// Abb 减音阶（Abb Ab Cbb Cb Db Ebb Fb Gbb）
    @Test("Abb Diminished")
    func testADoubleFlatDiminished() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.A, -1, 68),  // Ab
            (.C, -2, 70),  // Cbb
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.F, -1, 76),  // Fb
            (.G, -2, 77)   // Gbb
        ])
    }

    /// A### 减音阶（A### A#### C### C#### D#### E### F#### G###）
    @Test("A### Diminished")
    func testATripleSharpDiminished() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),  // A###
            (.A, 4, 73),  // A####
            (.C, 3, 75),  // C###
            (.C, 4, 76),  // C####
            (.D, 4, 78),  // D####
            (.E, 3, 79),  // E###
            (.F, 4, 81),  // F####
            (.G, 3, 82)   // G###
        ])
    }

    /// Abbb 减音阶（Abbb Abb Cbbb Cbb Dbb Ebbb Fbb Gbbb）
    @Test("Abbb Diminished")
    func testATripleFlatDiminished() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.A, -2, 67),  // Abb
            (.C, -3, 69),  // Cbbb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.F, -2, 75),  // Fbb
            (.G, -3, 76)   // Gbbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 减音阶（B B# D D# E# F# G# A）
    @Test("B Diminished")
    func testBDiminished() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),  // B
            (.B, 1, 72),  // B#
            (.D, 0, 74),  // D
            (.D, 1, 75),  // D#
            (.E, 1, 77),  // E#
            (.F, 1, 78),  // F#
            (.G, 1, 80),  // G#
            (.A, 0, 81)   // A
        ])
    }

    /// B# 减音阶（B# B## D# D## E## F## G## A#）
    @Test("B# Diminished")
    func testBSharpDiminished() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),  // B#
            (.B, 2, 73),  // B##
            (.D, 1, 75),  // D#
            (.D, 2, 76),  // D##
            (.E, 2, 78),  // E##
            (.F, 2, 79),  // F##
            (.G, 2, 81),  // G##
            (.A, 1, 82)   // A#
        ])
    }

    /// Bb 减音阶（Bb B Db D E F G Ab）
    @Test("Bb Diminished")
    func testBFlatDiminished() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.B, 0, 71),  // B
            (.D, -1, 73),  // Db
            (.D, 0, 74),  // D
            (.E, 0, 76),  // E
            (.F, 0, 77),  // F
            (.G, 0, 79),  // G
            (.A, -1, 80)   // Ab
        ])
    }

    /// B## 减音阶（B## B### D## D### E### F### G### A##）
    @Test("B## Diminished")
    func testBDoubleSharpDiminished() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),  // B##
            (.B, 3, 74),  // B###
            (.D, 2, 76),  // D##
            (.D, 3, 77),  // D###
            (.E, 3, 79),  // E###
            (.F, 3, 80),  // F###
            (.G, 3, 82),  // G###
            (.A, 2, 83)   // A##
        ])
    }

    /// Bbb 减音阶（Bbb Bb Dbb Db Eb Fb Gb Abb）
    @Test("Bbb Diminished")
    func testBDoubleFlatDiminished() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.B, -1, 70),  // Bb
            (.D, -2, 72),  // Dbb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.F, -1, 76),  // Fb
            (.G, -1, 78),  // Gb
            (.A, -2, 79)   // Abb
        ])
    }

    /// B### 减音阶（B### B#### D### D#### E#### F#### G#### A###）
    @Test("B### Diminished")
    func testBTripleSharpDiminished() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),  // B###
            (.B, 4, 75),  // B####
            (.D, 3, 77),  // D###
            (.D, 4, 78),  // D####
            (.E, 4, 80),  // E####
            (.F, 4, 81),  // F####
            (.G, 4, 83),  // G####
            (.A, 3, 84)   // A###
        ])
    }

    /// Bbbb 减音阶（Bbbb Bbb Dbbb Dbb Ebb Fbb Gbb Abbb）
    @Test("Bbbb Diminished")
    func testBTripleFlatDiminished() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyDiminishedScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.B, -2, 69),  // Bbb
            (.D, -3, 71),  // Dbbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75),  // Fbb
            (.G, -2, 77),  // Gbb
            (.A, -3, 78)   // Abbb
        ])
    }
}
