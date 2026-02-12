//
//  Interval+Preset.swift
//  Tonic
//
//  Created by 小汤汤 on 2/1/26.
//


// MARK: - Common Interval in Scale
extension Interval {

    // MARK: Unison
    // public static let d1 = Interval(degreeInt: 1, semitones: -1) // 不考虑负数的音程表示
    public static let P1 = Interval(degreeInt: 1, semitones: 0)  // Perfect Unison
    public static let A1 = Interval(degreeInt: 1, semitones: 1)

    // MARK: Seconds
    public static let d2 = Interval(degreeInt: 2, semitones: 0)
    public static let m2 = Interval(degreeInt: 2, semitones: 1)
    public static let M2 = Interval(degreeInt: 2, semitones: 2)
    public static let A2 = Interval(degreeInt: 2, semitones: 3)

    // MARK: Thirds
    public static let d3 = Interval(degreeInt: 3, semitones: 2)
    public static let m3 = Interval(degreeInt: 3, semitones: 3)
    public static let M3 = Interval(degreeInt: 3, semitones: 4)
    public static let A3 = Interval(degreeInt: 3, semitones: 5)

    // MARK: Fourths
    public static let d4 = Interval(degreeInt: 4, semitones: 4)  //
    public static let P4 = Interval(degreeInt: 4, semitones: 5)  //
    public static let A4 = Interval(degreeInt: 4, semitones: 6)  // Tritone

    // MARK: Fifths
    public static let d5 = Interval(degreeInt: 5, semitones: 6)  // Tritone
    public static let P5 = Interval(degreeInt: 5, semitones: 7)
    public static let A5 = Interval(degreeInt: 5, semitones: 8)

    // MARK: Sixths
    public static let d6 = Interval(degreeInt: 6, semitones: 7)
    public static let m6 = Interval(degreeInt: 6, semitones: 8)
    public static let M6 = Interval(degreeInt: 6, semitones: 9)
    public static let A6 = Interval(degreeInt: 6, semitones: 10)

    // MARK: Sevenths
    public static let d7 = Interval(degreeInt: 7, semitones: 9)
    public static let m7 = Interval(degreeInt: 7, semitones: 10)
    public static let M7 = Interval(degreeInt: 7, semitones: 11)
    public static let A7 = Interval(degreeInt: 7, semitones: 12)

    // MARK: Octaves     -> Degree = 1
    public static let d8 = Interval(degreeInt: 8, semitones: 11)
    public static let P8 = Interval(degreeInt: 8, semitones: 12)
    public static let A8 = Interval(degreeInt: 8, semitones: 13)

    // MARK: Ninths      -> Degree = 2
    public static let d9 = Interval(degreeInt: 9, semitones: 12)
    public static let m9 = Interval(degreeInt: 9, semitones: 13)
    public static let M9 = Interval(degreeInt: 9, semitones: 14)
    public static let A9 = Interval(degreeInt: 9, semitones: 15)

    // MARK: Tenths      -> Degree = 3
    public static let d10 = Interval(degreeInt: 10, semitones: 14)
    public static let m10 = Interval(degreeInt: 10, semitones: 15)
    public static let M10 = Interval(degreeInt: 10, semitones: 16)
    public static let A10 = Interval(degreeInt: 10, semitones: 17)

    // MARK: Elevenths   -> Degree = 4
    public static let d11 = Interval(degreeInt: 11, semitones: 16)
    public static let P11 = Interval(degreeInt: 11, semitones: 17)
    public static let A11 = Interval(degreeInt: 11, semitones: 18)

    // MARK: Twelfth     -> Degree = 5
    public static let d12 = Interval(degreeInt: 12, semitones: 18)
    public static let P12 = Interval(degreeInt: 12, semitones: 19)
    public static let A12 = Interval(degreeInt: 12, semitones: 20)

    // MARK: Thirteenths -> Degree = 6
    public static let d13 = Interval(degreeInt: 13, semitones: 19)
    public static let m13 = Interval(degreeInt: 13, semitones: 20)
    public static let M13 = Interval(degreeInt: 13, semitones: 21)
    public static let A13 = Interval(degreeInt: 13, semitones: 22)

    // MARK: Fourteenth  -> Degree = 7
    public static let d14 = Interval(degreeInt: 14, semitones: 21)
    public static let m14 = Interval(degreeInt: 14, semitones: 22)
    public static let M14 = Interval(degreeInt: 14, semitones: 23)
    public static let A14 = Interval(degreeInt: 14, semitones: 24)

    // MARK: Fifteenths  -> Degree = 1
    public static let d15 = Interval(degreeInt: 15, semitones: 23)
    public static let P15 = Interval(degreeInt: 15, semitones: 24)
    public static let A15 = Interval(degreeInt: 15, semitones: 25)

}

// MARK: - Common Intervals in Chord
extension Set<Interval> {
    
    public static let x: Set<Interval> = [.P1, .M3, .P5]
    public static let xM: Set<Interval> = [.P1, .M3, .P5]
    public static let xm: Set<Interval> = [.P1, .m3, .P5]
    public static let xdim: Set<Interval> = [.P1, .m3, .d5]
    
    public static let xM7: Set<Interval> = [.P1, .M3, .P5, .M7]
    public static let xM7_M9: Set<Interval> = [.P1, .M3, .P5, .M7, .M9]
    public static let xM7_M13: Set<Interval> = [.P1, .M3, .P5, .M7, .M13]
    public static let xM7_M9_M13: Set<Interval> = [.P1, .M3, .P5, .M7, .M9, .M13]
    public static let xM7_M9_P11: Set<Interval> = [.P1, .M3, .P5, .M7, .M9, .P11]
    public static let xM7_M9_P11_M13: Set<Interval> = [.P1, .M3, .P5, .M7, .M9, .P11, .M13]
    
    public static let xm7: Set<Interval> = [.P1, .m3, .P5, .m7]
    public static let xm7_M9: Set<Interval> = [.P1, .m3, .P5, .m7, .M9]
    public static let xm7_M13: Set<Interval> = [.P1, .m3, .P5, .m7, .M13]
    public static let xm7_M9_M13: Set<Interval> = [.P1, .m3, .P5, .m7, .M13]
    public static let xm7_M9_P11: Set<Interval> = [.P1, .m3, .P5, .m7, .M9, .P11]
    public static let xm7_M9_P11_M13: Set<Interval> = [.P1, .m3, .P5, .m7, .M9, .P11, .M13]
    
    public static let x7: Set<Interval> = [.P1, .M3, .P5, .m7]
    public static let x7_M9: Set<Interval> = [.P1, .M3, .P5, .m7, .M9]
    public static let x7_M9_P11: Set<Interval> = [.P1, .M3, .P5, .m7, .M9, .P11]
    public static let x7_M9_M13: Set<Interval> = [.P1, .M3, .P5, .m7, .M9, .M13]
    public static let x7_M9_P11_M13: Set<Interval> = [.P1, .M3, .P5, .m7, .M9, .P11, .M13]
    
    public static let xdim7: Set<Interval> = [.P1, .m3, .d5, .m7]
    
    // Sus2
    public static let xSus2: Set<Interval> = [.P1, .M2, .P5]
    public static let xSus2_M9: Set<Interval> = [.P1, .M2, .P5, .M9]
    
    // Sus4
    public static let xSus4: Set<Interval> = [.P1, .P4, .P5]
    public static let xSus4_P11: Set<Interval> = [.P1, .P4, .P5, .P11]
    
    public static let x7sharp9flat13: Set<Interval> = [.P1, .M3, .P5, .m7, .m9, .m13]
    
}
