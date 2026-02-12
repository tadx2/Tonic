//
//  TestRawDNA.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/6/12.
//


struct MockRawDNA{
    
    // [0, 2, 4, 5, 7, 9, 11, 14, 17, 21]
    
    // 三和弦
    static let xM               = [0,nil,4,nil,7,nil,nil,nil,nil,nil]
    static let xm               = [0,nil,3,nil,7,nil,nil,nil,nil,nil]
    static let xdim             = [0,nil,3,nil,6,nil,nil,nil,nil,nil]
    
    // 七和弦
    static let xM7              = [0,nil,4,nil,7,nil,11,nil,nil,nil]
    static let xm7              = [0,nil,3,nil,7,nil,10,nil,nil,nil]
    static let x7               = [0,nil,4,nil,7,nil,10,nil,nil,nil]
    static let xdim7            = [0,nil,3,nil,6,nil, 9,nil,nil,nil]
    static let xm7falt5         = [0,nil,3,nil,6,nil,10,nil,nil,nil]
    
    // 九和弦
    static let xM9              = [0,nil,4,nil,7,nil, 11, 14,nil,nil]
    static let xm9              = [0,nil,3,nil,7,nil, 10, 14,nil,nil]
    static let x9               = [0,nil,4,nil,7,nil, 10, 14,nil,nil]
    static let xm7flat5flat9    = [0,nil,3,nil,6,nil, 10, 13,nil,nil]
    static let xdimflat9        = [0,nil,3,nil,6,nil,  9, 13,nil,nil]
    static let xm7flat9         = [0,nil,3,nil,7,nil, 10, 13,nil,nil]
    
    // 十三和弦
    static let xM13              = [0,nil,4,nil,7,nil, 11,14,17,21]
    
    static let xSus2            = [0,2,nil,nil,7,nil,nil,nil,nil,nil]
    // 其他怪怪的和弦
    static let x7sharp9flat13 = [0,nil,4,nil,7,nil,10,15,nil,20]
    static let xM7sus4b5 = [0,nil,nil,5,6,nil,11,nil,nil,nil]
    static let xm9flat13 = [0,nil,3,nil,7,nil,10,14,nil,20]
    static let xm9Shrop11flat13 = [0,nil,3,nil,7,nil,10,14,18,20]
    static let xm9flat5Shrop11flat13 = [0,nil,3,nil,6,nil,10,14,18,20]
    static let xMflat99Shrop11flat13 = [0,nil,3,nil,7,nil,nil,14,18,20]
}

public struct MockIntervals{
    
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

public struct MockChord{
    
    // C 大调顺接和弦 Triad
    public static let C4M: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.x)
    public static let D4m: Chord = Chord(root: MockNote.D4, intervals: MockIntervals.xm)
    public static let E4m: Chord = Chord(root: MockNote.E4, intervals: MockIntervals.xm)
    public static let F4M: Chord = Chord(root: MockNote.F4, intervals: MockIntervals.x)
    public static let G4M: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x)
    public static let A4m: Chord = Chord(root: MockNote.A4, intervals: MockIntervals.xm)
    public static let B4dim: Chord = Chord(root: MockNote.B4, intervals: MockIntervals.xdim)
    
    // C 大调顺接和弦 Seventh
    public static let C4M7: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xM7)
    public static let D4m7: Chord = Chord(root: MockNote.D4, intervals: MockIntervals.xm7)
    public static let E4m7: Chord = Chord(root: MockNote.E4, intervals: MockIntervals.xm7)
    public static let F4M7: Chord = Chord(root: MockNote.F4, intervals: MockIntervals.xM7)
    public static let G4X7: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x7)
    public static let A4m7: Chord = Chord(root: MockNote.A4, intervals: MockIntervals.xm7)
    public static let B4dim7: Chord = Chord(root: MockNote.B4, intervals: MockIntervals.xdim7)
    
    // C 大调顺接和弦 Seventh Multiple Tension
    public static let C4M7_M9: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xM7_M9)
    public static let C4M7_M13: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xM7_M13)
    public static let C4M7_M9_M13: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xM7_M9_M13)
    public static let C4M7_M9_P11: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xM7_M9_P11)
    public static let C4M7_M9_P11_M13: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xM7_M9_P11_M13)
    
    public static let D4m7_M9: Chord = Chord(root: MockNote.D4, intervals: MockIntervals.xm7_M9)
    public static let D4m7_M9_P11: Chord = Chord(root: MockNote.D4, intervals: MockIntervals.xm7_M9_P11)
    public static let D4m7_M9_P11_M13: Chord = Chord(root: MockNote.D4, intervals: MockIntervals.xm7_M9_P11_M13)
    
    public static let G4x7: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x7)
    public static let G4x7_M9: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x7_M9)
    public static let G4x7_M9_P11: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x7_M9_P11)
    public static let G4x7_M9_M13: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x7_M9_M13)
    
    public static let G4x7_M9_P11_M13: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.x7_M9_P11_M13)
    
    // F 大调顺接和弦 Seventh
    // F4M7
    public static let G4m7: Chord = Chord(root: MockNote.G4, intervals: MockIntervals.xm7)
    // A4m7
    public static let Bb4M7: Chord = Chord(root: MockNote.Bb4, intervals: MockIntervals.xM7)
    public static let C4X7: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.x7)
    // D4m7
    public static let E4dim7: Chord = Chord(root: MockNote.E4, intervals: MockIntervals.xdim7)
    
    // C Sus2
    public static let CSus2: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xSus2)
    public static let CSus2_M9: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xSus2_M9)
    
    // C Sus4
    public static let CSus4_P11: Chord = Chord(root: MockNote.C4, intervals: MockIntervals.xSus4_P11)
}


public struct MockNote{
    
    // C大调 octave = 0
    public static let C0 = Note(letter: .C, accidental: 0, octave: 0)
    public static let D0 = Note(letter: .D, accidental: 0, octave: 0)
    public static let E0 = Note(letter: .E, accidental: 0, octave: 0)
    public static let F0 = Note(letter: .F, accidental: 0, octave: 0)
    public static let G0 = Note(letter: .G, accidental: 0, octave: 0)
    public static let A0 = Note(letter: .A, accidental: 0, octave: 0)
    public static let B0 = Note(letter: .B, accidental: 0, octave: 0)
    
    // C大调 octave = 1
    public static let C1 = Note(letter: .C, accidental: 0, octave: 1)
    public static let D1 = Note(letter: .D, accidental: 0, octave: 1)
    public static let E1 = Note(letter: .E, accidental: 0, octave: 1)
    public static let F1 = Note(letter: .F, accidental: 0, octave: 1)
    public static let G1 = Note(letter: .G, accidental: 0, octave: 1)
    public static let A1 = Note(letter: .A, accidental: 0, octave: 1)
    public static let B1 = Note(letter: .B, accidental: 0, octave: 1)
    
    // C大调 octave = 3
    static let C3 = Note(letter: .C, accidental: 0, octave: 3)
    static let D3 = Note(letter: .D, accidental: 0, octave: 3)
    static let E3 = Note(letter: .E, accidental: 0, octave: 3)
    static let F3 = Note(letter: .F, accidental: 0, octave: 3)
    static let G3 = Note(letter: .G, accidental: 0, octave: 3)
    static let A3 = Note(letter: .A, accidental: 0, octave: 3)
    static let B3 = Note(letter: .B, accidental: 0, octave: 3)
    
    // C大调 octave = 4
    public static let C4 = Note(letter: .C, accidental: 0, octave: 4)
    public static let D4 = Note(letter: .D, accidental: 0, octave: 4)
    public static let E4 = Note(letter: .E, accidental: 0, octave: 4)
    public static let F4 = Note(letter: .F, accidental: 0, octave: 4)
    public static let G4 = Note(letter: .G, accidental: 0, octave: 4)
    public static let A4 = Note(letter: .A, accidental: 0, octave: 4)
    public static let B4 = Note(letter: .B, accidental: 0, octave: 4)
    
    // C大调 octave = 8
    static let C8 = Note(letter: .C, accidental: 0, octave: 8)
    static let D8 = Note(letter: .D, accidental: 0, octave: 8)
    static let E8 = Note(letter: .E, accidental: 0, octave: 8)
    static let F8 = Note(letter: .F, accidental: 0, octave: 8)
    static let G8 = Note(letter: .G, accidental: 0, octave: 8)
    static let A8 = Note(letter: .A, accidental: 0, octave: 8)
    static let B8 = Note(letter: .B, accidental: 0, octave: 8)
    
    // Ab大调 octave = 4
    public static let Ab4 = Note(letter: .A, accidental: -1, octave: 4)
    public static let Bb4 = Note(letter: .B, accidental: -1, octave: 4)
//    static let C4 = Note(letter: .C, accidental: 0, octave: 4)
    public static let Db4 = Note(letter: .D, accidental: -1, octave: 4)
    public static let Eb4 = Note(letter: .E, accidental: -1, octave: 4)
//    static let F4 = Note(letter: .F, accidental: 0, octave: 4)
//    static let G4 = Note(letter: .G, accidental: 0, octave: 4)
    
    // Other
    static let G4s = Note(letter: .G, accidental: 1, octave: 4)
    static let C3s = Note(letter: .C, accidental: 1, octave: 3)
    static let F4s = Note(letter: .F, accidental: 1, octave: 4)
    static let B4b = Note(letter: .B, accidental: -1, octave: 4)
    static let B4bbbb = Note(letter: .B, accidental: -4, octave: 4)
}


