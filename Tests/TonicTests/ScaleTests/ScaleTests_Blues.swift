//
//  BluesScaleTests.swift
//  Tonic
//
//  Created by Claude Code
//
//  布鲁斯音阶的全面测试套件
//  测试所有 7 个字母（C D E F G A B）的 7 种变化（自然音、升、降、重升、重降、三升、三降）
//  总共 49 个测试用例

import Testing
import Foundation
@testable import Tonic

@Suite("Blues Scale Comprehensive Tests")
struct BluesScaleTests {

    // MARK: - Helper Methods

    /// 验证布鲁斯音阶的所有音符
    /// - Parameters:
    ///   - rootNote: 根音
    ///   - expectedNotes: 期望的 6 个音符 (letter, accidental, pitch)
    func verifyBluesScale(rootNote: Note, expectedNotes: [(Letter, Int, Int)]) {
        let scale = Scale(rootNote: rootNote, type: .blues)
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

    /// C 布鲁斯音阶（C Eb F F# G Bb）
    @Test("C Blues")
    func testCBlues() {
        let root = Note(letter: .C, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, 0, 60),   // C
            (.E, -1, 63),  // Eb
            (.F, 0, 65),   // F
            (.F, 1, 66),   // F#
            (.G, 0, 67),   // G
            (.B, -1, 70)   // Bb
        ])
    }

    /// C# 布鲁斯音阶（C# E F# F## G# B）
    @Test("C# Blues")
    func testCSharpBlues() {
        let root = Note(letter: .C, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, 1, 61),  // C#
            (.E, 0, 64),  // E
            (.F, 1, 66),  // F#
            (.F, 2, 67),  // F##
            (.G, 1, 68),  // G#
            (.B, 0, 71)   // B
        ])
    }

    /// Cb 布鲁斯音阶（Cb Ebb Fb F Gb Bbb）
    @Test("Cb Blues")
    func testCFlatBlues() {
        let root = Note(letter: .C, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, -1, 59),  // Cb
            (.E, -2, 62),  // Ebb
            (.F, -1, 64),  // Fb
            (.F, 0, 65),   // F
            (.G, -1, 66),  // Gb
            (.B, -2, 69)   // Bbb
        ])
    }

    /// C## 布鲁斯音阶（C## E# F## F### G## B#）
    @Test("C## Blues")
    func testCDoubleSharpBlues() {
        let root = Note(letter: .C, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, 2, 62),  // C##
            (.E, 1, 65),  // E#
            (.F, 2, 67),  // F##
            (.F, 3, 68),  // F###
            (.G, 2, 69),  // G##
            (.B, 1, 72)   // B#
        ])
    }

    /// Cbb 布鲁斯音阶（Cbb Ebbb Fbb Fb Gbb Bbbb）
    @Test("Cbb Blues")
    func testCDoubleFlatBlues() {
        let root = Note(letter: .C, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, -2, 58),  // Cbb
            (.E, -3, 61),  // Ebbb
            (.F, -2, 63),  // Fbb
            (.F, -1, 64),  // Fb
            (.G, -2, 65),  // Gbb
            (.B, -3, 68)   // Bbbb
        ])
    }

    /// C### 布鲁斯音阶（C### E## F### F#### G### B##）
    @Test("C### Blues")
    func testCTripleSharpBlues() {
        let root = Note(letter: .C, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, 3, 63),  // C###
            (.E, 2, 66),  // E##
            (.F, 3, 68),  // F###
            (.F, 4, 69),  // F####
            (.G, 3, 70),  // G###
            (.B, 2, 73)   // B##
        ])
    }

    /// Cbbb 布鲁斯音阶（Cbbb Ebbbb Fbbb Fbb Gbbb Bbbbb）
    @Test("Cbbb Blues")
    func testCTripleFlatBlues() {
        let root = Note(letter: .C, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.C, -3, 57),  // Cbbb
            (.E, -4, 60),  // Ebbbb
            (.F, -3, 62),  // Fbbb
            (.F, -2, 63),  // Fbb
            (.G, -3, 64),  // Gbbb
            (.B, -4, 67)   // Bbbbb
        ])
    }

    // MARK: - D 音的 7 种变化

    /// D 布鲁斯音阶（D F G G# A C）
    @Test("D Blues")
    func testDBlues() {
        let root = Note(letter: .D, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, 0, 62),  // D
            (.F, 0, 65),  // F
            (.G, 0, 67),  // G
            (.G, 1, 68),  // G#
            (.A, 0, 69),  // A
            (.C, 0, 72)   // C
        ])
    }

    /// D# 布鲁斯音阶（D# F# G# G## A# C#）
    @Test("D# Blues")
    func testDSharpBlues() {
        let root = Note(letter: .D, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, 1, 63),  // D#
            (.F, 1, 66),  // F#
            (.G, 1, 68),  // G#
            (.G, 2, 69),  // G##
            (.A, 1, 70),  // A#
            (.C, 1, 73)   // C#
        ])
    }

    /// Db 布鲁斯音阶（Db Fb Gb G Ab Cb）
    @Test("Db Blues")
    func testDFlatBlues() {
        let root = Note(letter: .D, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, -1, 61),  // Db
            (.F, -1, 64),  // Fb
            (.G, -1, 66),  // Gb
            (.G, 0, 67),   // G
            (.A, -1, 68),  // Ab
            (.C, -1, 71)   // Cb
        ])
    }

    /// D## 布鲁斯音阶（D## F## G## G### A## C##）
    @Test("D## Blues")
    func testDDoubleSharpBlues() {
        let root = Note(letter: .D, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, 2, 64),  // D##
            (.F, 2, 67),  // F##
            (.G, 2, 69),  // G##
            (.G, 3, 70),  // G###
            (.A, 2, 71),  // A##
            (.C, 2, 74)   // C##
        ])
    }

    /// Dbb 布鲁斯音阶（Dbb Fbb Gbb Gb Abb Cbb）
    @Test("Dbb Blues")
    func testDDoubleFlatBlues() {
        let root = Note(letter: .D, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, -2, 60),  // Dbb
            (.F, -2, 63),  // Fbb
            (.G, -2, 65),  // Gbb
            (.G, -1, 66),  // Gb
            (.A, -2, 67),  // Abb
            (.C, -2, 70)   // Cbb
        ])
    }

    /// D### 布鲁斯音阶（D### F### G### G#### A### C###）
    @Test("D### Blues")
    func testDTripleSharpBlues() {
        let root = Note(letter: .D, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, 3, 65),  // D###
            (.F, 3, 68),  // F###
            (.G, 3, 70),  // G###
            (.G, 4, 71),  // G####
            (.A, 3, 72),  // A###
            (.C, 3, 75)   // C###
        ])
    }

    /// Dbbb 布鲁斯音阶（Dbbb Fbbb Gbbb Gbb Abbb Cbbb）
    @Test("Dbbb Blues")
    func testDTripleFlatBlues() {
        let root = Note(letter: .D, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.D, -3, 59),  // Dbbb
            (.F, -3, 62),  // Fbbb
            (.G, -3, 64),  // Gbbb
            (.G, -2, 65),  // Gbb
            (.A, -3, 66),  // Abbb
            (.C, -3, 69)   // Cbbb
        ])
    }

    // MARK: - E 音的 7 种变化

    /// E 布鲁斯音阶（E G A A# B D）
    @Test("E Blues")
    func testEBlues() {
        let root = Note(letter: .E, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, 0, 64),  // E
            (.G, 0, 67),  // G
            (.A, 0, 69),  // A
            (.A, 1, 70),  // A#
            (.B, 0, 71),  // B
            (.D, 0, 74)   // D
        ])
    }

    /// E# 布鲁斯音阶（E# G# A# A## B# D#）
    @Test("E# Blues")
    func testESharpBlues() {
        let root = Note(letter: .E, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, 1, 65),  // E#
            (.G, 1, 68),  // G#
            (.A, 1, 70),  // A#
            (.A, 2, 71),  // A##
            (.B, 1, 72),  // B#
            (.D, 1, 75)   // D#
        ])
    }

    /// Eb 布鲁斯音阶（Eb Gb Ab A Bb Db）
    @Test("Eb Blues")
    func testEFlatBlues() {
        let root = Note(letter: .E, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, -1, 63),  // Eb
            (.G, -1, 66),  // Gb
            (.A, -1, 68),  // Ab
            (.A, 0, 69),   // A
            (.B, -1, 70),  // Bb
            (.D, -1, 73)   // Db
        ])
    }

    /// E## 布鲁斯音阶（E## G## A## A### B## D##）
    @Test("E## Blues")
    func testEDoubleSharpBlues() {
        let root = Note(letter: .E, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, 2, 66),  // E##
            (.G, 2, 69),  // G##
            (.A, 2, 71),  // A##
            (.A, 3, 72),  // A###
            (.B, 2, 73),  // B##
            (.D, 2, 76)   // D##
        ])
    }

    /// Ebb 布鲁斯音阶（Ebb Gbb Abb Ab Bbb Dbb）
    @Test("Ebb Blues")
    func testEDoubleFlatBlues() {
        let root = Note(letter: .E, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, -2, 62),  // Ebb
            (.G, -2, 65),  // Gbb
            (.A, -2, 67),  // Abb
            (.A, -1, 68),  // Ab
            (.B, -2, 69),  // Bbb
            (.D, -2, 72)   // Dbb
        ])
    }

    /// E### 布鲁斯音阶（E### G### A### A#### B### D###）
    @Test("E### Blues")
    func testETripleSharpBlues() {
        let root = Note(letter: .E, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, 3, 67),  // E###
            (.G, 3, 70),  // G###
            (.A, 3, 72),  // A###
            (.A, 4, 73),  // A####
            (.B, 3, 74),  // B###
            (.D, 3, 77)   // D###
        ])
    }

    /// Ebbb 布鲁斯音阶（Ebbb Gbbb Abbb Abb Bbbb Dbbb）
    @Test("Ebbb Blues")
    func testETripleFlatBlues() {
        let root = Note(letter: .E, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.E, -3, 61),  // Ebbb
            (.G, -3, 64),  // Gbbb
            (.A, -3, 66),  // Abbb
            (.A, -2, 67),  // Abb
            (.B, -3, 68),  // Bbbb
            (.D, -3, 71)   // Dbbb
        ])
    }

    // MARK: - F 音的 7 种变化

    /// F 布鲁斯音阶（F Ab Bb B C Eb）
    @Test("F Blues")
    func testFBlues() {
        let root = Note(letter: .F, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, 0, 65),   // F
            (.A, -1, 68),  // Ab
            (.B, -1, 70),  // Bb
            (.B, 0, 71),   // B
            (.C, 0, 72),   // C
            (.E, -1, 75)   // Eb
        ])
    }

    /// F# 布鲁斯音阶（F# A B B# C# E）
    @Test("F# Blues")
    func testFSharpBlues() {
        let root = Note(letter: .F, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, 1, 66),  // F#
            (.A, 0, 69),  // A
            (.B, 0, 71),  // B
            (.B, 1, 72),  // B#
            (.C, 1, 73),  // C#
            (.E, 0, 76)   // E
        ])
    }

    /// Fb 布鲁斯音阶（Fb Abb Bbb Bb Cb Ebb）
    @Test("Fb Blues")
    func testFFlatBlues() {
        let root = Note(letter: .F, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, -1, 64),  // Fb
            (.A, -2, 67),  // Abb
            (.B, -2, 69),  // Bbb
            (.B, -1, 70),  // Bb
            (.C, -1, 71),  // Cb
            (.E, -2, 74)   // Ebb
        ])
    }

    /// F## 布鲁斯音阶（F## A# B# B## C## E#）
    @Test("F## Blues")
    func testFDoubleSharpBlues() {
        let root = Note(letter: .F, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, 2, 67),  // F##
            (.A, 1, 70),  // A#
            (.B, 1, 72),  // B#
            (.B, 2, 73),  // B##
            (.C, 2, 74),  // C##
            (.E, 1, 77)   // E#
        ])
    }

    /// Fbb 布鲁斯音阶（Fbb Abbb Bbbb Bbb Cbb Ebbb）
    @Test("Fbb Blues")
    func testFDoubleFlatBlues() {
        let root = Note(letter: .F, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, -2, 63),  // Fbb
            (.A, -3, 66),  // Abbb
            (.B, -3, 68),  // Bbbb
            (.B, -2, 69),  // Bbb
            (.C, -2, 70),  // Cbb
            (.E, -3, 73)   // Ebbb
        ])
    }

    /// F### 布鲁斯音阶（F### A## B## B### C### E##）
    @Test("F### Blues")
    func testFTripleSharpBlues() {
        let root = Note(letter: .F, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, 3, 68),  // F###
            (.A, 2, 71),  // A##
            (.B, 2, 73),  // B##
            (.B, 3, 74),  // B###
            (.C, 3, 75),  // C###
            (.E, 2, 78)   // E##
        ])
    }

    /// Fbbb 布鲁斯音阶（Fbbb Abbbb Bbbbb Bbbb Cbbb Ebbbb）
    @Test("Fbbb Blues")
    func testFTripleFlatBlues() {
        let root = Note(letter: .F, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.F, -3, 62),  // Fbbb
            (.A, -4, 65),  // Abbbb
            (.B, -4, 67),  // Bbbbb
            (.B, -3, 68),  // Bbbb
            (.C, -3, 69),  // Cbbb
            (.E, -4, 72)   // Ebbbb
        ])
    }

    // MARK: - G 音的 7 种变化

    /// G 布鲁斯音阶（G Bb C C# D F）
    @Test("G Blues")
    func testGBlues() {
        let root = Note(letter: .G, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, 0, 67),   // G
            (.B, -1, 70),  // Bb
            (.C, 0, 72),   // C
            (.C, 1, 73),   // C#
            (.D, 0, 74),   // D
            (.F, 0, 77)    // F
        ])
    }

    /// G# 布鲁斯音阶（G# B C# C## D# F#）
    @Test("G# Blues")
    func testGSharpBlues() {
        let root = Note(letter: .G, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, 1, 68),  // G#
            (.B, 0, 71),  // B
            (.C, 1, 73),  // C#
            (.C, 2, 74),  // C##
            (.D, 1, 75),  // D#
            (.F, 1, 78)   // F#
        ])
    }

    /// Gb 布鲁斯音阶（Gb Bbb Cb C Db Fb）
    @Test("Gb Blues")
    func testGFlatBlues() {
        let root = Note(letter: .G, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, -1, 66),  // Gb
            (.B, -2, 69),  // Bbb
            (.C, -1, 71),  // Cb
            (.C, 0, 72),   // C
            (.D, -1, 73),  // Db
            (.F, -1, 76)   // Fb
        ])
    }

    /// G## 布鲁斯音阶（G## B# C## C### D## F##）
    @Test("G## Blues")
    func testGDoubleSharpBlues() {
        let root = Note(letter: .G, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, 2, 69),  // G##
            (.B, 1, 72),  // B#
            (.C, 2, 74),  // C##
            (.C, 3, 75),  // C###
            (.D, 2, 76),  // D##
            (.F, 2, 79)   // F##
        ])
    }

    /// Gbb 布鲁斯音阶（Gbb Bbbb Cbb Cb Dbb Fbb）
    @Test("Gbb Blues")
    func testGDoubleFlatBlues() {
        let root = Note(letter: .G, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, -2, 65),  // Gbb
            (.B, -3, 68),  // Bbbb
            (.C, -2, 70),  // Cbb
            (.C, -1, 71),  // Cb
            (.D, -2, 72),  // Dbb
            (.F, -2, 75)   // Fbb
        ])
    }

    /// G### 布鲁斯音阶（G### B## C### C#### D### F###）
    @Test("G### Blues")
    func testGTripleSharpBlues() {
        let root = Note(letter: .G, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, 3, 70),  // G###
            (.B, 2, 73),  // B##
            (.C, 3, 75),  // C###
            (.C, 4, 76),  // C####
            (.D, 3, 77),  // D###
            (.F, 3, 80)   // F###
        ])
    }

    /// Gbbb 布鲁斯音阶（Gbbb Bbbbb Cbbb Cbb Dbbb Fbbb）
    @Test("Gbbb Blues")
    func testGTripleFlatBlues() {
        let root = Note(letter: .G, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.G, -3, 64),  // Gbbb
            (.B, -4, 67),  // Bbbbb
            (.C, -3, 69),  // Cbbb
            (.C, -2, 70),  // Cbb
            (.D, -3, 71),  // Dbbb
            (.F, -3, 74)   // Fbbb
        ])
    }

    // MARK: - A 音的 7 种变化

    /// A 布鲁斯音阶（A C D D# E G）
    @Test("A Blues")
    func testABlues() {
        let root = Note(letter: .A, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, 0, 69),  // A
            (.C, 0, 72),  // C
            (.D, 0, 74),  // D
            (.D, 1, 75),  // D#
            (.E, 0, 76),  // E
            (.G, 0, 79)   // G
        ])
    }

    /// A# 布鲁斯音阶（A# C# D# D## E# G#）
    @Test("A# Blues")
    func testASharpBlues() {
        let root = Note(letter: .A, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, 1, 70),  // A#
            (.C, 1, 73),  // C#
            (.D, 1, 75),  // D#
            (.D, 2, 76),  // D##
            (.E, 1, 77),  // E#
            (.G, 1, 80)   // G#
        ])
    }

    /// Ab 布鲁斯音阶（Ab Cb Db D Eb Gb）
    @Test("Ab Blues")
    func testAFlatBlues() {
        let root = Note(letter: .A, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, -1, 68),  // Ab
            (.C, -1, 71),  // Cb
            (.D, -1, 73),  // Db
            (.D, 0, 74),   // D
            (.E, -1, 75),  // Eb
            (.G, -1, 78)   // Gb
        ])
    }

    /// A## 布鲁斯音阶（A## C## D## D### E## G##）
    @Test("A## Blues")
    func testADoubleSharpBlues() {
        let root = Note(letter: .A, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, 2, 71),  // A##
            (.C, 2, 74),  // C##
            (.D, 2, 76),  // D##
            (.D, 3, 77),  // D###
            (.E, 2, 78),  // E##
            (.G, 2, 81)   // G##
        ])
    }

    /// Abb 布鲁斯音阶（Abb Cbb Dbb Db Ebb Gbb）
    @Test("Abb Blues")
    func testADoubleFlatBlues() {
        let root = Note(letter: .A, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, -2, 67),  // Abb
            (.C, -2, 70),  // Cbb
            (.D, -2, 72),  // Dbb
            (.D, -1, 73),  // Db
            (.E, -2, 74),  // Ebb
            (.G, -2, 77)   // Gbb
        ])
    }

    /// A### 布鲁斯音阶（A### C### D### D#### E### G###）
    @Test("A### Blues")
    func testATripleSharpBlues() {
        let root = Note(letter: .A, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, 3, 72),  // A###
            (.C, 3, 75),  // C###
            (.D, 3, 77),  // D###
            (.D, 4, 78),  // D####
            (.E, 3, 79),  // E###
            (.G, 3, 82)   // G###
        ])
    }

    /// Abbb 布鲁斯音阶（Abbb Cbbb Dbbb Dbb Ebbb Gbbb）
    @Test("Abbb Blues")
    func testATripleFlatBlues() {
        let root = Note(letter: .A, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.A, -3, 66),  // Abbb
            (.C, -3, 69),  // Cbbb
            (.D, -3, 71),  // Dbbb
            (.D, -2, 72),  // Dbb
            (.E, -3, 73),  // Ebbb
            (.G, -3, 76)   // Gbbb
        ])
    }

    // MARK: - B 音的 7 种变化

    /// B 布鲁斯音阶（B D E E# F# A）
    @Test("B Blues")
    func testBBlues() {
        let root = Note(letter: .B, accidental: 0, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, 0, 71),  // B
            (.D, 0, 74),  // D
            (.E, 0, 76),  // E
            (.E, 1, 77),  // E#
            (.F, 1, 78),  // F#
            (.A, 0, 81)   // A
        ])
    }

    /// B# 布鲁斯音阶（B# D# E# E## F## A#）
    @Test("B# Blues")
    func testBSharpBlues() {
        let root = Note(letter: .B, accidental: 1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, 1, 72),  // B#
            (.D, 1, 75),  // D#
            (.E, 1, 77),  // E#
            (.E, 2, 78),  // E##
            (.F, 2, 79),  // F##
            (.A, 1, 82)   // A#
        ])
    }

    /// Bb 布鲁斯音阶（Bb Db Eb E F Ab）
    @Test("Bb Blues")
    func testBFlatBlues() {
        let root = Note(letter: .B, accidental: -1, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, -1, 70),  // Bb
            (.D, -1, 73),  // Db
            (.E, -1, 75),  // Eb
            (.E, 0, 76),   // E
            (.F, 0, 77),   // F
            (.A, -1, 80)   // Ab
        ])
    }

    /// B## 布鲁斯音阶（B## D## E## E### F### A##）
    @Test("B## Blues")
    func testBDoubleSharpBlues() {
        let root = Note(letter: .B, accidental: 2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, 2, 73),  // B##
            (.D, 2, 76),  // D##
            (.E, 2, 78),  // E##
            (.E, 3, 79),  // E###
            (.F, 3, 80),  // F###
            (.A, 2, 83)   // A##
        ])
    }

    /// Bbb 布鲁斯音阶（Bbb Dbb Ebb Eb Fb Abb）
    @Test("Bbb Blues")
    func testBDoubleFlatBlues() {
        let root = Note(letter: .B, accidental: -2, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, -2, 69),  // Bbb
            (.D, -2, 72),  // Dbb
            (.E, -2, 74),  // Ebb
            (.E, -1, 75),  // Eb
            (.F, -1, 76),  // Fb
            (.A, -2, 79)   // Abb
        ])
    }

    /// B### 布鲁斯音阶（B### D### E### E#### F#### A###）
    @Test("B### Blues")
    func testBTripleSharpBlues() {
        let root = Note(letter: .B, accidental: 3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, 3, 74),  // B###
            (.D, 3, 77),  // D###
            (.E, 3, 79),  // E###
            (.E, 4, 80),  // E####
            (.F, 4, 81),  // F####
            (.A, 3, 84)   // A###
        ])
    }

    /// Bbbb 布鲁斯音阶（Bbbb Dbbb Ebbb Ebb Fbb Abbb）
    @Test("Bbbb Blues")
    func testBTripleFlatBlues() {
        let root = Note(letter: .B, accidental: -3, octave: 4)
        verifyBluesScale(rootNote: root, expectedNotes: [
            (.B, -3, 68),  // Bbbb
            (.D, -3, 71),  // Dbbb
            (.E, -3, 73),  // Ebbb
            (.E, -2, 74),  // Ebb
            (.F, -2, 75),  // Fbb
            (.A, -3, 78)   // Abbb
        ])
    }
}
