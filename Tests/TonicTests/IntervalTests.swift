import Foundation
import Testing

@testable import Tonic

@Suite("Interval Tests")
struct IntervalTests {

    @Test("Interval Name Test")
    func testIntervalNameSeventh() {

        #expect(Interval.P1.description == "P1")
        #expect(Interval.A1.description == "A1")

        #expect(Interval.d2.description == "d2")
        #expect(Interval.m2.description == "m2")
        #expect(Interval.M2.description == "M2")
        #expect(Interval.A2.description == "A2")

        #expect(Interval.d5.description == "d5")
        #expect(Interval.P5.description == "P5")
        #expect(Interval.A5.description == "A5")

        #expect(Interval.d7.description == "d7")
        #expect(Interval.m7.description == "m7")
        #expect(Interval.M7.description == "M7")
        #expect(Interval.A7.description == "A7")
        #expect(Interval(degreeInt: 7, semitones: 8).description == "dd7")
        #expect(Interval(degreeInt: 7, semitones: 9).description == "d7")
        #expect(Interval(degreeInt: 7, semitones: 10).description == "m7")
        #expect(Interval(degreeInt: 7, semitones: 11).description == "M7")
        #expect(Interval(degreeInt: 7, semitones: 12).description == "A7")
        #expect(Interval(degreeInt: 7, semitones: 13).description == "AA7")
        #expect(Interval(degreeInt: 7, semitones: 14).description == "AAA7")
        #expect(Interval(degreeInt: 7, semitones: 15).description == "AAAA7")

        #expect(Interval.d8.description == "d8")
        #expect(Interval.P8.description == "P8")
        #expect(Interval.A8.description == "A8")
        #expect(Interval(degreeInt: 8, semitones: 10).description == "dd8")
        #expect(Interval(degreeInt: 8, semitones: 11).description == "d8")
        #expect(Interval(degreeInt: 8, semitones: 12).description == "P8")
        #expect(Interval(degreeInt: 8, semitones: 13).description == "A8")
        #expect(Interval(degreeInt: 8, semitones: 14).description == "AA8")

        #expect(Interval.d9.description == "d9")
        #expect(Interval.m9.description == "m9")
        #expect(Interval.M9.description == "M9")
        #expect(Interval.A9.description == "A9")
        #expect(Interval(degreeInt: 9, semitones: 11).description == "dd9")
        #expect(Interval(degreeInt: 9, semitones: 12).description == "d9")
        #expect(Interval(degreeInt: 9, semitones: 13).description == "m9")
        #expect(Interval(degreeInt: 9, semitones: 14).description == "M9")
        #expect(Interval(degreeInt: 9, semitones: 15).description == "A9")
        #expect(Interval(degreeInt: 9, semitones: 16).description == "AA9")
        #expect(Interval(degreeInt: 9, semitones: 17).description == "AAA9")
        #expect(Interval(degreeInt: 9, semitones: 18).description == "AAAA9")

        #expect(Interval.d14.description == "d14")
        #expect(Interval.m14.description == "m14")
        #expect(Interval.M14.description == "M14")
        #expect(Interval.A14.description == "A14")
        #expect(Interval(degreeInt: 14, semitones: 20).description == "dd14")
        #expect(Interval(degreeInt: 14, semitones: 21).description == "d14")
        #expect(Interval(degreeInt: 14, semitones: 22).description == "m14")
        #expect(Interval(degreeInt: 14, semitones: 23).description == "M14")
        #expect(Interval(degreeInt: 14, semitones: 24).description == "A14")
        #expect(Interval(degreeInt: 14, semitones: 25).description == "AA14")
        #expect(Interval(degreeInt: 14, semitones: 26).description == "AAA14")
        #expect(Interval(degreeInt: 14, semitones: 27).description == "AAAA14")

        #expect(Interval.d15.description == "d15")
        #expect(Interval.P15.description == "P15")
        #expect(Interval.A15.description == "A15")
        #expect(Interval(degreeInt: 15, semitones: 22).description == "dd15")
        #expect(Interval(degreeInt: 15, semitones: 23).description == "d15")
        #expect(Interval(degreeInt: 15, semitones: 24).description == "P15")
        #expect(Interval(degreeInt: 15, semitones: 25).description == "A15")
        #expect(Interval(degreeInt: 15, semitones: 26).description == "AA15")

    }

    @Test("Interval Name Test Down")
    func testIntervalNameOctave() {
        #expect(Interval(degreeInt: 15, semitones: 26, direction: .down).description == "-AA15")
    }

    @Test("Interval Name Test Number")
    func testIntervalNameNumber() {
        #expect(Interval.d5.descriptionNumber == "♭5")
        #expect(Interval.P5.descriptionNumber == "5")
        #expect(Interval.A5.descriptionNumber == "♯5")

        #expect(Interval.d7.descriptionNumber == "𝄫7")
        #expect(Interval.m7.descriptionNumber == "♭7")
        #expect(Interval.M7.descriptionNumber == "7")
        #expect(Interval.A7.descriptionNumber == "♯7")
    }

}
