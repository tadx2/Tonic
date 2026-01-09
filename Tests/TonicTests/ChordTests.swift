import Foundation
import Testing

@testable import Tonic

@Suite("Chord Tests")
struct ChordTests {
    @Test("Chord Note Generation")
    func testChordNoteGeneration() {

        let rootNote = Note(letter: .C, accidental: 0, octave: 4)
        // Fix: Use available initializer with explicit intervals for C Major (Major 3rd, Perfect 5th)
        let cMajor = Chord(root: rootNote, intervals: [.M3, .P5])
        let noteToInterval = cMajor.noteToIntervalRaw

        let noteC4 = rootNote
        let noteE4 = Note(letter: .E, accidental: 0, octave: 4)
        let noteG4 = Note(letter: .G, accidental: 0, octave: 4)

        #expect(noteToInterval[noteC4] == Interval.P1)
        #expect(noteToInterval[noteE4] == Interval.M3)
        #expect(noteToInterval[noteG4] == Interval.P5)
    }

    @Test("Debug Chord Output")
    /// swift test --filter testChordDebugOutput 2>&1 | grep ">>>"
    func testChordDebugOutput() {
        let rootNote = Note(letter: .A, accidental: 0, octave: 4)
        let cMajor = Chord(root: rootNote, intervals: [.M2, .m3, .P5])

        // 输出的结果按照 interval 的大小排序输出
        print(">>> intervalsRaw: \(cMajor.intervalsRaw)")
        for (note, interval) in cMajor.noteToIntervalRaw.sorted(by: { $0.value < $1.value }) {
            print(">>> \(interval) -> \(note.fullName)")
        }
    }

    @Test("Get Interval By Pitch")
    func testChordGetIntervalByPitch() {
        // Setup Chord: Root = C4, Intervals = [.M2, .P5, .M9]
        // C4 = 60
        // M2 -> D4 (62)
        // P5 -> G4 (67)
        // M9 -> D5 (74)
        let rootNote = Note(letter: .C, accidental: 0, octave: 4)
        // Fix: Use available initializer with explicit intervals for C Major (Major 3rd, Perfect 5th)
        let chord = Chord(root: rootNote, intervals: [.M2, .P5, .M9])

        // Test case 1: Pitch 50 (D3) should match .M2 and .M9 (both are 'D')
        // D3 = 50. 50 % 12 = 2. 62 % 12 = 2. 74 % 12 = 2.
        // Test case 1: Pitch 50 (D3) should match .M2 and .M9 (both are 'D')
        // D3 = 50. 50 % 12 = 2. 62 % 12 = 2. 74 % 12 = 2.
        let result1 = chord.getNoteToIntervalRaw(by: 50)
        #expect(result1.count == 2)
        #expect(result1.values.contains(Interval.M2))
        #expect(result1.values.contains(Interval.M9))

        // Test case 2: Pitch 67 (G4) should match .P5
        // G4 = 67. 67 % 12 = 7.
        let result2 = chord.getNoteToIntervalRaw(by: 67)
        #expect(result2.count == 1)
        #expect(result2.values.contains(Interval.P5))

        // Test case 3: Pitch 61 (C#4) should match nothing
        // C#4 = 61. 61 % 12 = 1.
        let result3 = chord.getNoteToIntervalRaw(by: 61)
        #expect(result3.isEmpty)

        // Test case 4: Root note C4 (60)
        // Note: The init adds .P1 automatically.
        // C4 = 60. 60 % 12 = 0.
        let result4 = chord.getNoteToIntervalRaw(by: 60)
        #expect(result4.values.contains(Interval.P1))
    }
}
