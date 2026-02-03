import Testing
import Tonic

@Suite struct ChordDiatonicTypeTests {

    @Test("Major Triad Series")
    func testMajorTriadSeries() {
        let rootNote = Note(letter: .C, octave: 4)
        let series = ChordDiatonicType.majorTriad.chordSeries(from: rootNote)

        #expect(series.count == 7)

        // C Major Triad
        #expect(series[0].noteRoot.fullName == "C4")
        #expect(series[0].rawNameBasic == "M")

        // D Minor Triad
        #expect(series[1].noteRoot.fullName == "D4")
        #expect(series[1].rawNameBasic == "m")

        // E Minor Triad
        #expect(series[2].noteRoot.fullName == "E4")
        #expect(series[2].rawNameBasic == "m")

        // F Major Triad
        #expect(series[3].noteRoot.fullName == "F4")
        #expect(series[3].rawNameBasic == "M")

        // G Major Triad
        #expect(series[4].noteRoot.fullName == "G4")
        #expect(series[4].rawNameBasic == "M")

        // A Minor Triad
        #expect(series[5].noteRoot.fullName == "A4")
        #expect(series[5].rawNameBasic == "m")

        // B Diminished Triad
        #expect(series[6].noteRoot.fullName == "B4")
        #expect(series[6].rawNameBasic == "dim")
    }

    @Test("Major Seventh Series")
    func testMajorSeventhSeries() {
        let rootNote = Note(letter: .C, octave: 4)
        let series = ChordDiatonicType.majorSeventh.chordSeries(from: rootNote)

        #expect(series.count == 7)

        // C Major 7
        #expect(series[0].noteRoot.fullName == "C4")
        #expect(series[0].rawNameBasic == "M7")

        // D Minor 7
        #expect(series[1].noteRoot.fullName == "D4")
        #expect(series[1].rawNameBasic == "m7")

        // E Minor 7
        #expect(series[2].noteRoot.fullName == "E4")
        #expect(series[2].rawNameBasic == "m7")

        // F Major 7
        #expect(series[3].noteRoot.fullName == "F4")
        #expect(series[3].rawNameBasic == "M7")

        // G Dominant 7
        #expect(series[4].noteRoot.fullName == "G4")
        #expect(series[4].rawNameBasic == "7")

        // A Minor 7
        #expect(series[5].noteRoot.fullName == "A4")
        #expect(series[5].rawNameBasic == "m7")

        // B Half-Diminished 7
        #expect(series[6].noteRoot.fullName == "B4")
        #expect(series[6].rawNameBasic == "m7")
        #expect(series[6].rawNameFull == "m7(♭5)")
    }

    @Test("Minor Triad Series")
    func testMinorTriadSeries() {
        let rootNote = Note(letter: .A, octave: 4)
        let series = ChordDiatonicType.minorTriad.chordSeries(from: rootNote)

        #expect(series.count == 7)

        // A Minor Triad
        #expect(series[0].noteRoot.fullName == "A4")
        #expect(series[0].rawNameBasic == "m")

        // B Diminished Triad
        #expect(series[1].noteRoot.fullName == "B4")
        #expect(series[1].rawNameBasic == "dim")

        // C Major Triad
        #expect(series[2].noteRoot.fullName == "C5")
        #expect(series[2].rawNameBasic == "M")
    }
}
