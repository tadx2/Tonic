//
//  ScaleTests.swift
//  Tonic
//

import Testing
import Foundation
@testable import Tonic

/// Scale 结构的通用测试套件
///
/// 测试音阶的初始化、属性和通用功能
@Suite("Scale Tests")
struct ScaleTests {

    // MARK: Initialization

    /// 测试默认初始化（C 自然大调）
    @Test("Default Initialization")
    func testDefaultInitialization() {
        let scale = Scale()

        #expect(scale.rootNote.letter == .C)
        #expect(scale.rootNote.accidental == 0)
        #expect(scale.rootNote.octave == 4)
        #expect(scale.type == .naturalMajor)
        #expect(scale.semitoneFromRootNote == [0, 2, 4, 5, 7, 9, 11])
        #expect(scale.isFromKeyOctave == true)
        #expect(scale.degreeCount == 7)
    }

    /// 测试使用音阶类型初始化
    @Test("Initialization with ScaleType")
    func testInitializationWithScaleType() {
        let rootNote = Note(letter: .D, accidental: 0, octave: 3)
        let scale = Scale(rootNote: rootNote, type: .naturalMinor, isFromKeyOctave: false)

        #expect(scale.rootNote == rootNote)
        #expect(scale.type == .naturalMinor)
        #expect(scale.semitoneFromRootNote == [0, 2, 3, 5, 7, 8, 10])
        #expect(scale.isFromKeyOctave == false)
        #expect(scale.degreeCount == 7)
    }

    // MARK: Helper Methods & Properties

    /// 测试 allNotes() 方法
    @Test("allNotes Method")
    func testAllNotesMethod() {
        let scale = Scale(type: .naturalMajor)
        let notes = scale.allNotes()

        #expect(notes.count == 7)
        // 验证每个音都不为 nil 且递增
        for i in 0..<notes.count {
            if i > 0 {
                #expect(notes[i].pitch > notes[i-1].pitch)
            }
        }
    }

    /// 测试音阶名称
    @Test("Scale Name")
    func testScaleName() {
        #expect(Scale(type: .naturalMajor).name == "C Major")
        #expect(Scale(rootNote: Note(letter: .D, accidental: 0, octave: 4), type: .naturalMinor).name == "D Natural Minor")
        #expect(Scale(rootNote: Note(letter: .A, accidental: 0, octave: 4), type: .blues).name == "A Blues")
    }

    /// 测试音阶中文名称
    @Test("Scale Chinese Name")
    func testScaleChineseName() {
        #expect(Scale(type: .naturalMajor).chineseName == "C 自然大调")
        #expect(Scale(rootNote: Note(letter: .D, accidental: 0, octave: 4), type: .harmonicMinor).chineseName == "D 和声小调")
        #expect(Scale(type: .pentatonicMajor).chineseName == "C 大调五声音阶")
    }

    // MARK: Cross-Octave Tests

    /// 测试跨八度
    @Test("Octave Crossing")
    func testOctaveCrossing() {
        let scale = Scale(type: .naturalMajor)

        // 第 8 音：C5
        let note8 = scale.note(on: 8)
        #expect(note8?.letter == .C)
        #expect(note8?.octave == 5)
        #expect(note8?.pitch == 72)

        // 第 15 音：C6
        let note15 = scale.note(on: 15)
        #expect(note15?.letter == .C)
        #expect(note15?.octave == 6)
        #expect(note15?.pitch == 84)
    }

    /// 测试 diffPlus 参数
    @Test("diffPlus Parameter")
    func testDiffPlus() {
        let scale = Scale(type: .naturalMajor)

        // 第 1 个降音：Cb4
        let note1b = scale.note(on: 1, diffPlus: -1)
        #expect(note1b?.letter == .C)
        #expect(note1b?.accidental == -1)
        #expect(note1b?.pitch == 59)

        // 第 1 个升音：C#4
        let note1s = scale.note(on: 1, diffPlus: 1)
        #expect(note1s?.letter == .C)
        #expect(note1s?.accidental == 1)
        #expect(note1s?.pitch == 61)
    }

    /// 测试 isFromKeyOctave 参数
    @Test("isFromKeyOctave Parameter")
    func testIsFromKeyOctave() {
        let scale1 = Scale(rootNote: Note(letter: .C, accidental: 0, octave: 4), type: .naturalMajor, isFromKeyOctave: true)
        let note1 = scale1.note(on: 1)
        #expect(note1?.octave == 4)
        #expect(note1?.pitch == 60)

        let scale2 = Scale(rootNote: Note(letter: .C, accidental: 0, octave: 4), type: .naturalMajor, isFromKeyOctave: false)
        let note2 = scale2.note(on: 1)
        #expect(note2?.octave == -1)
        #expect(note2?.pitch == 0)
    }

    // MARK: ScaleType Properties

    /// 测试 ScaleType 的 degreeCount 属性
    @Test("ScaleType degreeCount")
    func testScaleTypeDegreeCount() {
        #expect(ScaleType.naturalMajor.degreeCount == 7)
        #expect(ScaleType.pentatonicMajor.degreeCount == 5)
        #expect(ScaleType.blues.degreeCount == 6)
        #expect(ScaleType.chromatic.degreeCount == 12)
        #expect(ScaleType.diminished.degreeCount == 8)
    }

    /// 测试 ScaleType 的 chineseName 属性
    @Test("ScaleType Chinese Names")
    func testScaleTypeChineseNames() {
        #expect(ScaleType.naturalMajor.chineseName == "自然大调")
        #expect(ScaleType.naturalMinor.chineseName == "自然小调")
        #expect(ScaleType.harmonicMinor.chineseName == "和声小调")
        #expect(ScaleType.melodicMinor.chineseName == "旋律小调")
        #expect(ScaleType.blues.chineseName == "布鲁斯音阶")
        #expect(ScaleType.dorian.chineseName == "多利亚调式")
    }
}
