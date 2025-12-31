import Testing
import Foundation
@testable import Tonic

@Suite("ChordRaw Tests")
struct ChordRawTests {

    @Test("inUsedDegreeInt")
    func testInUsedDegreeInt() {
        // 三和弦
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM).inUsedDegreeInt == [1, 3, 5])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm).inUsedDegreeInt == [1, 3, 5])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xdim).inUsedDegreeInt == [1, 3, 5])

        // 七和弦
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM7).inUsedDegreeInt == [1, 3, 5, 7])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7).inUsedDegreeInt == [1, 3, 5, 7])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.x7).inUsedDegreeInt == [1, 3, 5, 7])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xdim7).inUsedDegreeInt == [1, 3, 5, 7])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7falt5).inUsedDegreeInt == [1, 3, 5, 7])

        // 九和弦
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM9).inUsedDegreeInt == [1, 3, 5, 7, 9])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9).inUsedDegreeInt == [1, 3, 5, 7, 9])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.x9).inUsedDegreeInt == [1, 3, 5, 7, 9])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7flat5flat9).inUsedDegreeInt == [1, 3, 5, 7, 9])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xdimflat9).inUsedDegreeInt == [1, 3, 5, 7, 9])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7flat9).inUsedDegreeInt == [1, 3, 5, 7, 9])

        // 十三和弦
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM13).inUsedDegreeInt == [1, 3, 5, 7, 9, 11, 13])

        // Sus2和弦
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xSus2).inUsedDegreeInt == [1, 2, 5])

        // 其他和弦
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.x7sharp9flat13).inUsedDegreeInt == [1, 3, 5, 7, 9, 13])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM7sus4b5).inUsedDegreeInt == [1, 4, 5, 7])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9flat13).inUsedDegreeInt == [1, 3, 5, 7, 9, 13])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9Shrop11flat13).inUsedDegreeInt == [1, 3, 5, 7, 9, 11, 13])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9flat5Shrop11flat13).inUsedDegreeInt == [1, 3, 5, 7, 9, 11, 13])
        #expect(ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xMflat99Shrop11flat13).inUsedDegreeInt == [1, 3, 5, 9, 11, 13])
    }

    @Test("getInterval - Valid degrees with values")
    func testGetInterval_CMajor() {

        // Given: A C Major chord (C4 with major triad DNA)
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM)

        // When/Then: Get intervals for degrees 1, 3, 5
        // Degree 1 (root): 0 semitones -> Perfect Unison
        let interval_1 = chord.getInterval(chordDegreeInt: 1)
        #expect(interval_1 != nil)
        #expect(interval_1?.semitones == 0)
        #expect(interval_1?.degreeInt == 1)

        // Degree 3 (third): 4 semitones -> Major Third
        let interval_3 = chord.getInterval(chordDegreeInt: 3)
        #expect(interval_3 != nil)
        #expect(interval_3 == .M3)  // Major Third
        #expect(interval_3?.semitones == 4)
        #expect(interval_3?.degreeInt == 3)

        // Degree 5 (fifth): 7 semitones -> Perfect Fifth
        let interval_5 = chord.getInterval(chordDegreeInt: 5)
        #expect(interval_5 != nil)
        #expect(interval_5 == .P5)  // Perfect Fifth
        #expect(interval_5?.semitones == 7)
        #expect(interval_5?.degreeInt == 5)

        // When/Then: Get intervals for degrees that are nil in the DNA
        #expect(chord.getInterval(chordDegreeInt: 0) == nil)   // Invalid
        #expect(chord.getInterval(chordDegreeInt: 2) == nil)  // No 2nd
        #expect(chord.getInterval(chordDegreeInt: 4) == nil)  // No 4th
        #expect(chord.getInterval(chordDegreeInt: 6) == nil)  // No 6th
        #expect(chord.getInterval(chordDegreeInt: 7) == nil)  // No 7th
        #expect(chord.getInterval(chordDegreeInt: 8) == nil)   // Invalid
        #expect(chord.getInterval(chordDegreeInt: 9) == nil)  // No 9th
        #expect(chord.getInterval(chordDegreeInt: 10) == nil)  // Invalid
        #expect(chord.getInterval(chordDegreeInt: 11) == nil)  // No 11th
        #expect(chord.getInterval(chordDegreeInt: 12) == nil)  // Invalid
        #expect(chord.getInterval(chordDegreeInt: 13) == nil)  // No 13th
        #expect(chord.getInterval(chordDegreeInt: 14) == nil)  // Invalid

        #expect(chord.getInterval(chordDegreeInt: 15) == .P1)
        #expect(chord.getInterval(chordDegreeInt: 17) == .M3)
    }

//    @Test("getIntervals - Multiple chord types")
//    func testGetIntervals_MultipleChords() {
//
//        // Test 1: C4 Major Triad (C E G)
//        // Expected intervals: P1 (0), M3 (4), P5 (7)
//        let intervals_M = MockChordRaw.C4_M.getIntervals()
//        #expect(intervals_M.count == 3)
//        #expect(intervals_M[0] == .P1)  // Root
//        #expect(intervals_M[1] == .M3)  // Major Third
//        #expect(intervals_M[2] == .P5)  // Perfect Fifth
//
//        // Test 2: C4 Minor Triad (C Eb G)
//        // Expected intervals: P1 (0), m3 (3), P5 (7)
//        let intervals_m = MockChordRaw.C4_m.getIntervals()
//        #expect(intervals_m.count == 3)
//        #expect(intervals_m[0] == .P1)  // Root
//        #expect(intervals_m[1] == .m3)  // Minor Third
//        #expect(intervals_m[2] == .P5)  // Perfect Fifth
//
//        // Test 3: C4 Diminished Triad (C Eb Gb)
//        // Expected intervals: P1 (0), m3 (3), d5 (6)
//        let intervals_dim = MockChordRaw.C4_dim.getIntervals()
//        #expect(intervals_dim.count == 3)
//        #expect(intervals_dim[0] == .P1)  // Root
//        #expect(intervals_dim[1] == .m3)  // Minor Third
//        #expect(intervals_dim[2] == .d5)  // Diminished Fifth
//
//        // Test 4: C4 Major 7th (C E G B)
//        // Expected intervals: P1 (0), M3 (4), P5 (7), M7 (11)
//        let intervals_M7 = MockChordRaw.C4_M7.getIntervals()
//        #expect(intervals_M7.count == 4)
//        #expect(intervals_M7[0] == .P1)  // Root
//        #expect(intervals_M7[1] == .M3)  // Major Third
//        #expect(intervals_M7[2] == .P5)  // Perfect Fifth
//        #expect(intervals_M7[3] == .M7)  // Major Seventh
//
//        // Test 5: C4 Minor 7th (C Eb G Bb)
//        // Expected intervals: P1 (0), m3 (3), P5 (7), m7 (10)
//        let intervals_m7 = MockChordRaw.C4_m7.getIntervals()
//        #expect(intervals_m7.count == 4)
//        #expect(intervals_m7[0] == .P1)  // Root
//        #expect(intervals_m7[1] == .m3)  // Minor Third
//        #expect(intervals_m7[2] == .P5)  // Perfect Fifth
//        #expect(intervals_m7[3] == .m7)  // Minor Seventh
//
//        // Test 6: C4 Diminished 7th (C Eb Gb Bbb/A)
//        // Expected intervals: P1 (0), m3 (3), d5 (6), d7 (9)
//        let intervals_dim7 = MockChordRaw.C4_dim7.getIntervals()
//        #expect(intervals_dim7.count == 4)
//        #expect(intervals_dim7[0] == .P1)  // Root
//        #expect(intervals_dim7[1] == .m3)  // Minor Third
//        #expect(intervals_dim7[2] == .d5)  // Diminished Fifth
//        #expect(intervals_dim7[3] == .d7)  // Diminished Seventh
//
//        // Test 7: C4 Minor 7 flat 5 (C Eb Gb Bb) - Half Diminished
//        // Expected intervals: P1 (0), m3 (3), d5 (6), m7 (10)
//        let intervals_m7flat5 = MockChordRaw.C4_7falt5.getIntervals()
//        #expect(intervals_m7flat5.count == 4)
//        #expect(intervals_m7flat5[0] == .P1)  // Root
//        #expect(intervals_m7flat5[1] == .m3)  // Minor Third
//        #expect(intervals_m7flat5[2] == .d5)  // Diminished Fifth
//        #expect(intervals_m7flat5[3] == .m7)  // Minor Seventh
//    }

    @Test("getPitchIntervalDict - Multiple chord types")
    func testGetPitchIntervalDict_MultipleChords() {

        // Test 1: C4 Major Triad (C E G)
        // C4=60, E4=64, G4=67
        let dict_M = MockChordRaw.C4_M.getPitchIntervalDict()
        #expect(dict_M.count == 3)
        #expect(dict_M[60] == .P1)  // C4 -> Root
        #expect(dict_M[64] == .M3)  // E4 -> Major Third
        #expect(dict_M[67] == .P5)  // G4 -> Perfect Fifth

        // Test 2: C4 Minor Triad (C Eb G)
        // C4=60, Eb4=63, G4=67
        let dict_m = MockChordRaw.C4_m.getPitchIntervalDict()
        #expect(dict_m.count == 3)
        #expect(dict_m[60] == .P1)  // C4 -> Root
        #expect(dict_m[63] == .m3)  // Eb4 -> Minor Third
        #expect(dict_m[67] == .P5)  // G4 -> Perfect Fifth

        // Test 3: C4 Diminished Triad (C Eb Gb)
        // C4=60, Eb4=63, Gb4=66
        let dict_dim = MockChordRaw.C4_dim.getPitchIntervalDict()
        #expect(dict_dim.count == 3)
        #expect(dict_dim[60] == .P1)  // C4 -> Root
        #expect(dict_dim[63] == .m3)  // Eb4 -> Minor Third
        #expect(dict_dim[66] == .d5)  // Gb4 -> Diminished Fifth

        // Test 4: C4 Major 7th (C E G B)
        // C4=60, E4=64, G4=67, B4=71
        let dict_M7 = MockChordRaw.C4_M7.getPitchIntervalDict()
        #expect(dict_M7.count == 4)
        #expect(dict_M7[60] == .P1)  // C4 -> Root
        #expect(dict_M7[64] == .M3)  // E4 -> Major Third
        #expect(dict_M7[67] == .P5)  // G4 -> Perfect Fifth
        #expect(dict_M7[71] == .M7)  // B4 -> Major Seventh

        // Test 5: C4 Minor 7th (C Eb G Bb)
        // C4=60, Eb4=63, G4=67, Bb4=70
        let dict_m7 = MockChordRaw.C4_m7.getPitchIntervalDict()
        #expect(dict_m7.count == 4)
        #expect(dict_m7[60] == .P1)  // C4 -> Root
        #expect(dict_m7[63] == .m3)  // Eb4 -> Minor Third
        #expect(dict_m7[67] == .P5)  // G4 -> Perfect Fifth
        #expect(dict_m7[70] == .m7)  // Bb4 -> Minor Seventh

        // Test 6: C4 Diminished 7th (C Eb Gb Bbb/A)
        // C4=60, Eb4=63, Gb4=66, A4=69
        let dict_dim7 = MockChordRaw.C4_dim7.getPitchIntervalDict()
        #expect(dict_dim7.count == 4)
        #expect(dict_dim7[60] == .P1)  // C4 -> Root
        #expect(dict_dim7[63] == .m3)  // Eb4 -> Minor Third
        #expect(dict_dim7[66] == .d5)  // Gb4 -> Diminished Fifth
        #expect(dict_dim7[69] == .d7)  // A4 (Bbb enharmonic) -> Diminished Seventh

        // Test 7: C4 Minor 7 flat 5 (C Eb Gb Bb) - Half Diminished
        // C4=60, Eb4=63, Gb4=66, Bb4=70
        let dict_m7flat5 = MockChordRaw.C4_7falt5.getPitchIntervalDict()
        #expect(dict_m7flat5.count == 4)
        #expect(dict_m7flat5[60] == .P1)  // C4 -> Root
        #expect(dict_m7flat5[63] == .m3)  // Eb4 -> Minor Third
        #expect(dict_m7flat5[66] == .d5)  // Gb4 -> Diminished Fifth
        #expect(dict_m7flat5[70] == .m7)  // Bb4 -> Minor Seventh

        // Additional verification: Check that dictionary keys match inUsedPitches
        let pitches_M = MockChordRaw.C4_M.inUsedPitches
        #expect(Set(dict_M.keys) == Set(pitches_M))

        let pitches_M7 = MockChordRaw.C4_M7.inUsedPitches
        #expect(Set(dict_M7.keys) == Set(pitches_M7))
    }
}
