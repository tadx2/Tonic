import Testing
@testable import Tonic

struct NoteIntervalTests {

    @Test func testCommonIntervalDescriptions() {
        // Unison
        #expect(NoteInterval.P1.description == "P1")
        
        // Seconds
        #expect(NoteInterval.m2.description == "m2")
        #expect(NoteInterval.M2.description == "M2")
        #expect(NoteInterval.A2.description == "A2")
        #expect(NoteInterval.d2.description == "d2")
        
        // Thirds
        #expect(NoteInterval.m3.description == "m3")
        #expect(NoteInterval.M3.description == "M3")
        
        // Fourths
        #expect(NoteInterval.P4.description == "P4")
        #expect(NoteInterval.A4.description == "A4")
        
        // Fifths
        #expect(NoteInterval.d5.description == "d5")
        #expect(NoteInterval.P5.description == "P5")
        
        // Sixths
        #expect(NoteInterval.m6.description == "m6")
        #expect(NoteInterval.M6.description == "M6")
        
        // Sevenths
        #expect(NoteInterval.m7.description == "m7")
        #expect(NoteInterval.M7.description == "M7")
        #expect(NoteInterval.d7.description == "d7")
        #expect(NoteInterval.A7.description == "A7")
        
        // Octave
        #expect(NoteInterval.P8.description == "P8")
        
        // Extensions
        #expect(NoteInterval.m9.description == "m9")
        #expect(NoteInterval.M9.description == "M9")
        #expect(NoteInterval.P11.description == "P11")
        #expect(NoteInterval.A11.description == "A11")
        #expect(NoteInterval.M13.description == "M13")
        
        // P15
        #expect(NoteInterval.P15.description == "P15")
    }
    
    @Test func testDescriptionNumber() {
        // P1 -> semitone 0, expected 0 -> diff 0 -> "" + "1" -> "1"
        #expect(NoteInterval.P1.descriptionNumber == "1")
        
        // m2 -> semitone 1, expected 2 -> diff -1 -> "♭" + "2" -> "♭2"
        #expect(NoteInterval.m2.descriptionNumber == "♭2")
        
        // M2 -> semitone 2, expected 2 -> diff 0 -> "2"
        #expect(NoteInterval.M2.descriptionNumber == "2")
        
        // A2 -> semitone 3, expected 2 -> diff 1 -> "♯" + "2" -> "♯2"
        #expect(NoteInterval.A2.descriptionNumber == "♯2")
        
        // d5 -> semitone 6, expected 7 -> diff -1 -> "♭5"
        #expect(NoteInterval.d5.descriptionNumber == "♭5")
        
        // A4 -> semitone 6, expected 5 -> diff 1 -> "♯4"
        #expect(NoteInterval.A4.descriptionNumber == "♯4")
        
        // M7 -> semitone 11, expected 11 -> diff 0 -> "7"
        #expect(NoteInterval.M7.descriptionNumber == "7")
        
        // m7 -> semitone 10, expected 11 -> diff -1 -> "♭7"
        #expect(NoteInterval.m7.descriptionNumber == "♭7")
        
        // P8 -> semitone 12. 12%12=0. expected(0) = 0. diff 0. -> "8"
        #expect(NoteInterval.P8.descriptionNumber == "8")
        
        // d9 -> semitone 12. 12%12=0. expected(9->1->2)=2. diff -2 -> "♭♭9"
        #expect(NoteInterval.d9.descriptionNumber == "♭♭9")
    }
    
    @Test func testDegreeIndex() {
        #expect(NoteInterval.P1.degreeIndexInChordRawDna == 0)
        #expect(NoteInterval.M3.degreeIndexInChordRawDna == 2)
        #expect(NoteInterval.P5.degreeIndexInChordRawDna == 4)
        #expect(NoteInterval.M7.degreeIndexInChordRawDna == 6)
        #expect(NoteInterval.M9.degreeIndexInChordRawDna == 7)
    }
}