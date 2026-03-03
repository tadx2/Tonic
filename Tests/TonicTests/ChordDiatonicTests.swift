import Testing
import Tonic

@Suite struct ChordDiatonicTypeTests {

    @Test("majorNatural Series")
    func testMajorNatural() {
        
        // C traid
        var chordDiationc = ChordDiatonic(tonic: .C4, modeType: ModeTypeMain.majorNatural, type: .traid)
        #expect(chordDiationc.getDiatonicChord(at: 1) == .C4M)
        #expect(chordDiationc.getDiatonicChord(at: 2) == .D4m)
        #expect(chordDiationc.getDiatonicChord(at: 3) == .E4m)
        #expect(chordDiationc.getDiatonicChord(at: 4) == .F4M)
        #expect(chordDiationc.getDiatonicChord(at: 5) == .G4M)
        #expect(chordDiationc.getDiatonicChord(at: 6) == .A4m)
        #expect(chordDiationc.getDiatonicChord(at: 7) == .B4dim)
        
        // C seventh
        chordDiationc = ChordDiatonic(tonic: .C4, modeType: ModeTypeMain.majorNatural, type: .seventh)
        #expect(chordDiationc.getDiatonicChord(at: 1) == .C4M7)
        #expect(chordDiationc.getDiatonicChord(at: 2) == .D4m7)
        #expect(chordDiationc.getDiatonicChord(at: 3) == .E4m7)
        #expect(chordDiationc.getDiatonicChord(at: 4) == .F4M7)
        #expect(chordDiationc.getDiatonicChord(at: 5) == .G4x7)
        #expect(chordDiationc.getDiatonicChord(at: 6) == .A4m7)
        #expect(chordDiationc.getDiatonicChord(at: 7) == .B4dim7)
        
        // F traid
        chordDiationc = ChordDiatonic(tonic: .F4, modeType: ModeTypeMain.majorNatural, type: .traid)
        #expect(chordDiationc.getDiatonicChord(at: 1) == Chord(root: .F4,  intervals: .x))
        #expect(chordDiationc.getDiatonicChord(at: 2) == Chord(root: .G4,  intervals: .xm))
        #expect(chordDiationc.getDiatonicChord(at: 3) == Chord(root: .A4,  intervals: .xm))
        #expect(chordDiationc.getDiatonicChord(at: 4) == Chord(root: .B4b, intervals: .xM))
        #expect(chordDiationc.getDiatonicChord(at: 5) == Chord(root: .C5,  intervals: .xM))
        #expect(chordDiationc.getDiatonicChord(at: 6) == Chord(root: .D5,  intervals: .xm))
        #expect(chordDiationc.getDiatonicChord(at: 7) == Chord(root: .E5,  intervals: .xdim))
        
        // F seventh
        chordDiationc = ChordDiatonic(tonic: .F4, modeType: ModeTypeMain.majorNatural, type: .seventh)
        #expect(chordDiationc.getDiatonicChord(at: 1) == Chord(root: .F4,  intervals: .xM7))
        #expect(chordDiationc.getDiatonicChord(at: 2) == Chord(root: .G4,  intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 3) == Chord(root: .A4,  intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 4) == Chord(root: .B4b, intervals:.xM7))
        #expect(chordDiationc.getDiatonicChord(at: 5) == Chord(root: .C5,  intervals: .x7))
        #expect(chordDiationc.getDiatonicChord(at: 6) == Chord(root: .D5,  intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 7) == Chord(root: .E5,  intervals: .xdim7))
        
    }
    
    @Test("minorNatural Series")
    func testMinorNatural() {
        
        // A seventh
        var chordDiationc = ChordDiatonic(tonic: .A4, modeType: ModeTypeMain.minorNatural, type: .seventh)
        #expect(chordDiationc.getDiatonicChord(at: 1) == Chord(root: .A4, intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 2) == Chord(root: .B4, intervals: .xdim7))
        #expect(chordDiationc.getDiatonicChord(at: 3) == Chord(root: .C5, intervals: .xM7))
        #expect(chordDiationc.getDiatonicChord(at: 4) == Chord(root: .D5, intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 5) == Chord(root: .E5, intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 6) == Chord(root: .F5, intervals: .xM7))
        #expect(chordDiationc.getDiatonicChord(at: 7) == Chord(root: .G5, intervals: .x7))
        
        // C seventh
        chordDiationc = ChordDiatonic(tonic: .C4, modeType: ModeTypeMain.minorNatural, type: .seventh)
        #expect(chordDiationc.getDiatonicChord(at: 1) == Chord(root: .C4, intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 2) == Chord(root: .D4, intervals: .xdim7))
        #expect(chordDiationc.getDiatonicChord(at: 3) == Chord(root: .E4b, intervals: .xM7))
        #expect(chordDiationc.getDiatonicChord(at: 4) == Chord(root: .F4, intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 5) == Chord(root: .G4, intervals: .xm7))
        #expect(chordDiationc.getDiatonicChord(at: 6) == Chord(root: .A4b, intervals: .xM7))
        #expect(chordDiationc.getDiatonicChord(at: 7) == Chord(root: .B4b, intervals: .x7))
        
    }

    
}
