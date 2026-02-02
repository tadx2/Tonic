import Foundation
import Testing

@testable import Tonic

@Suite("Note Tests")
struct NoteTests {

    @Test("Initialization")
    func testInitialization() {
        let note1 = Note(letter: .C, accidental: 0, octave: 4)
        #expect(note1.letter == .C)
        #expect(note1.accidental == 0)
        #expect(note1.octave == 4)
    }

    @Test("Pitch Calculation")
    func testPitchCalculation() {
        let c4 = Note(letter: .C, accidental: 0, octave: 4)
        #expect(c4.pitch == 60)

        let a4 = Note(letter: .A, accidental: 0, octave: 4)
        #expect(a4.pitch == 69)

        let c0 = Note(letter: .C, accidental: 0, octave: 0)
        #expect(c0.pitch == 12)

        let a0 = Note(letter: .A, accidental: 0, octave: 0)
        #expect(a0.pitch == 21)

        let c8 = Note(letter: .C, accidental: 0, octave: 8)
        #expect(c8.pitch == 108)

        let cs4 = Note(letter: .C, accidental: 1, octave: 4)
        #expect(cs4.pitch == 61)

        let db4 = Note(letter: .D, accidental: -1, octave: 4)
        #expect(db4.pitch == 61)
    }

    @Test("Equality and Hashable")
    func testEqualityAndHashable() {
        let n1 = Note(letter: .C, accidental: 0, octave: 4)
        let n2 = Note(letter: .C, accidental: 0, octave: 4)
        let n3 = Note(letter: .D, accidental: -2, octave: 4)

        #expect(n1 == n2)
        #expect(n1 != n3)
        #expect(n1.hashValue == n2.hashValue)

        let noteSet: Set<Note> = [n1, n2, n3]
        #expect(noteSet.count == 2)
    }

    @Test("Note Letter Class")
    func testNoteLetterClass() {
        let c4 = Note(letter: .C, accidental: 0, octave: 4)
        // (4 + 1) * 7 + 0 = 35
        #expect(c4.letterClass == 35)

        let cb4 = Note(letter: .C, accidental: -1, octave: 4)
        #expect(cb4.letterClass == 35)

        let d4 = Note(letter: .D, accidental: 0, octave: 4)
        // (4 + 1) * 7 + 1 = 36
        #expect(d4.letterClass == 36)
    }

    @Test("Shifted UP")
    func testShifted() {
        let c4 = Note(letter: .C, accidental: 0, octave: 4)

        #expect(c4.shifted(by: .P1) == Note(letter: .C, accidental: 0, octave: 4))
        #expect(c4.shifted(by: .A1) == Note(letter: .C, accidental: 1, octave: 4))

        #expect(c4.shifted(by: .d2) == Note(letter: .D, accidental: -2, octave: 4))
        #expect(c4.shifted(by: .m2) == Note(letter: .D, accidental: -1, octave: 4))
        #expect(c4.shifted(by: .M2) == Note(letter: .D, accidental: 0, octave: 4))
        #expect(c4.shifted(by: .A2) == Note(letter: .D, accidental: 1, octave: 4))

        #expect(c4.shifted(by: .P5) == Note(letter: .G, accidental: 0, octave: 4))

        #expect(c4.shifted(by: .d7) == Note(letter: .B, accidental: -2, octave: 4))
        #expect(c4.shifted(by: .m7) == Note(letter: .B, accidental: -1, octave: 4))
        #expect(c4.shifted(by: .M7) == Note(letter: .B, accidental: 0, octave: 4))
        #expect(c4.shifted(by: .A7) == Note(letter: .B, accidental: 1, octave: 4))

        #expect(c4.shifted(by: .d8) == Note(letter: .C, accidental: -1, octave: 5))
        #expect(c4.shifted(by: .P8) == Note(letter: .C, accidental: 0, octave: 5))
        #expect(c4.shifted(by: .A8) == Note(letter: .C, accidental: 1, octave: 5))

        #expect(c4.shifted(by: .d9) == Note(letter: .D, accidental: -2, octave: 5))
        #expect(c4.shifted(by: .m9) == Note(letter: .D, accidental: -1, octave: 5))
        #expect(c4.shifted(by: .M9) == Note(letter: .D, accidental: 0, octave: 5))
        #expect(c4.shifted(by: .A9) == Note(letter: .D, accidental: 1, octave: 5))

        #expect(c4.shifted(by: .d11) == Note(letter: .F, accidental: -1, octave: 5))
        #expect(c4.shifted(by: .P11) == Note(letter: .F, accidental: 0, octave: 5))
        #expect(c4.shifted(by: .A11) == Note(letter: .F, accidental: 1, octave: 5))

        #expect(c4.shifted(by: .d13) == Note(letter: .A, accidental: -2, octave: 5))
        #expect(c4.shifted(by: .m13) == Note(letter: .A, accidental: -1, octave: 5))
        #expect(c4.shifted(by: .M13) == Note(letter: .A, accidental: 0, octave: 5))
        #expect(c4.shifted(by: .A13) == Note(letter: .A, accidental: 1, octave: 5))

        let f4 = Note(letter: .F, accidental: 0, octave: 4)
        #expect(f4.shifted(by: .d5) == Note(letter: .C, accidental: -1, octave: 5))
        #expect(f4.shifted(by: .P5) == Note(letter: .C, accidental: 0, octave: 5))
        #expect(f4.shifted(by: .A5) == Note(letter: .C, accidental: 1, octave: 5))

    }

    @Test("Shifted Down")
    func testShiftedDown() {

        // Unison / Primes
        #expect(Note.C4.shifted(by: -.P1) == .C4)

        #expect(Note.C4.shifted(by: -.d2) == .B3s)

        #expect(Note.C4.shifted(by: .P5) == .G4)
        #expect(Note.C4.shifted(by: -.P4) == .G3)

        #expect(Note.G3.shifted(by: .P4) == .C4)
        #expect(Note.G3.shifted(by: -.P5) == .C3)

        #expect(Note.F3.shifted(by: .P5) == .C4)
        #expect(Note.F3.shifted(by: -.P4) == .C3)

    }

    @Test("Note Calculation Interval")
    func testCalculationInterval() {

        // 测试 1- 15度
        #expect(Note.interval(from: .C4, to: .D4) == .M2)
        #expect(Note.interval(from: .D4, to: .C4) == -.M2)

        #expect(Note.interval(from: .C4, to: .E4) == .M3)
        #expect(Note.interval(from: .E4, to: .C4) == -.M3)

        #expect(Note.interval(from: .C4, to: .F4) == .P4)
        #expect(Note.interval(from: .F4, to: .C4) == -.P4)

        #expect(Note.interval(from: .C4, to: .G4) == .P5, "c4 与 g4 之间是纯五度 上行")
        #expect(Note.interval(from: .G4, to: .C4) == -.P5, "g4 与 c4 之间是纯五度 下行")

        #expect(Note.interval(from: .C4, to: .A4) == .M6)
        #expect(Note.interval(from: .A4, to: .C4) == -.M6)

        #expect(Note.interval(from: .C4, to: .B4) == .M7)
        #expect(Note.interval(from: .B4, to: .C4) == -.M7)

        #expect(Note.interval(from: .C4, to: .C5) == .P8)
        #expect(Note.interval(from: .C5, to: .C4) == -.P8)

        #expect(Note.interval(from: .C4, to: .D5) == .M9)
        #expect(Note.interval(from: .D5, to: .C4) == -.M9)

        #expect(Note.interval(from: .C4, to: .E5) == .M10)
        #expect(Note.interval(from: .E5, to: .C4) == -.M10)

        #expect(Note.interval(from: .C4, to: .F5) == .P11)
        #expect(Note.interval(from: .F5, to: .C4) == -.P11)

        #expect(Note.interval(from: .C4, to: .G5) == .P12)
        #expect(Note.interval(from: .G5, to: .C4) == -.P12)

        #expect(Note.interval(from: .C4, to: .A5) == .M13)
        #expect(Note.interval(from: .A5, to: .C4) == -.M13)

        #expect(Note.interval(from: .C4, to: .B5) == .M14)
        #expect(Note.interval(from: .B5, to: .C4) == -.M14)

        #expect(Note.interval(from: .C4, to: .C6) == .P15)
        #expect(Note.interval(from: .C6, to: .C4) == -.P15)

        // other
        #expect(Note.interval(from: .C4, to: .G3) == -.P4)
        #expect(Note.interval(from: .G3, to: .C4) == .P4)

    }

    @Test("Note pitch class")
    func testPitchClass() {
        #expect(Note.C4.pitchClass == 60)
        #expect(Note.C5b.pitchClass == 71)
    }

}
