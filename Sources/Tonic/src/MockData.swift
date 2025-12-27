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

struct MockNote{
    
    // C大调 octave = 0
    static let C0 = Note(letter: .C, accidental: 0, octave: 0)
    static let D0 = Note(letter: .D, accidental: 0, octave: 0)
    static let E0 = Note(letter: .E, accidental: 0, octave: 0)
    static let F0 = Note(letter: .F, accidental: 0, octave: 0)
    static let G0 = Note(letter: .G, accidental: 0, octave: 0)
    static let A0 = Note(letter: .A, accidental: 0, octave: 0)
    static let B0 = Note(letter: .B, accidental: 0, octave: 0)
    
    // C大调 octave = 1
    static let C1 = Note(letter: .C, accidental: 0, octave: 1)
    static let D1 = Note(letter: .D, accidental: 0, octave: 1)
    static let E1 = Note(letter: .E, accidental: 0, octave: 1)
    static let F1 = Note(letter: .F, accidental: 0, octave: 1)
    static let G1 = Note(letter: .G, accidental: 0, octave: 1)
    static let A1 = Note(letter: .A, accidental: 0, octave: 1)
    static let B1 = Note(letter: .B, accidental: 0, octave: 1)
    
    // C大调 octave = 3
    static let C3 = Note(letter: .C, accidental: 0, octave: 3)
    static let D3 = Note(letter: .D, accidental: 0, octave: 3)
    static let E3 = Note(letter: .E, accidental: 0, octave: 3)
    static let F3 = Note(letter: .F, accidental: 0, octave: 3)
    static let G3 = Note(letter: .G, accidental: 0, octave: 3)
    static let A3 = Note(letter: .A, accidental: 0, octave: 3)
    static let B3 = Note(letter: .B, accidental: 0, octave: 3)
    
    // C大调 octave = 4
    static let C4 = Note(letter: .C, accidental: 0, octave: 4)
    static let D4 = Note(letter: .D, accidental: 0, octave: 4)
    static let E4 = Note(letter: .E, accidental: 0, octave: 4)
    static let F4 = Note(letter: .F, accidental: 0, octave: 4)
    static let G4 = Note(letter: .G, accidental: 0, octave: 4)
    static let A4 = Note(letter: .A, accidental: 0, octave: 4)
    static let B4 = Note(letter: .B, accidental: 0, octave: 4)
    
    // C大调 octave = 8
    static let C8 = Note(letter: .C, accidental: 0, octave: 8)
    static let D8 = Note(letter: .D, accidental: 0, octave: 8)
    static let E8 = Note(letter: .E, accidental: 0, octave: 8)
    static let F8 = Note(letter: .F, accidental: 0, octave: 8)
    static let G8 = Note(letter: .G, accidental: 0, octave: 8)
    static let A8 = Note(letter: .A, accidental: 0, octave: 8)
    static let B8 = Note(letter: .B, accidental: 0, octave: 8)
    
    // Ab大调 octave = 4
    static let Ab4 = Note(letter: .A, accidental: -1, octave: 4)
    static let Bb4 = Note(letter: .B, accidental: -1, octave: 4)
//    static let C4 = Note(letter: .C, accidental: 0, octave: 4)
    static let Db4 = Note(letter: .D, accidental: -1, octave: 4)
    static let Eb4 = Note(letter: .E, accidental: -1, octave: 4)
//    static let F4 = Note(letter: .F, accidental: 0, octave: 4)
//    static let G4 = Note(letter: .G, accidental: 0, octave: 4)
    
    static let G4s = Note(letter: .G, accidental: 1, octave: 4)
    static let C3s = Note(letter: .C, accidental: 1, octave: 3)
    static let F4s = Note(letter: .F, accidental: 1, octave: 4)
    static let B4b = Note(letter: .B, accidental: -1, octave: 4)
    static let B4bbbb = Note(letter: .B, accidental: -4, octave: 4)
}

//struct MockChord{
//    
//    static let C47 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.x7)
//    
//    static let C4dim7 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xdim7)
//    static let C3Sm9 = Chord(rootNote: MockNote.C3s, rawDNA: MockRawDNA.xm9)
//    static let C3Sm9flat13 = Chord(rootNote: MockNote.C3s, rawDNA: MockRawDNA.xm9flat13)
//    static let C4m7 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xm7)
//    static let G4sM7sus4b5 = Chord(rootNote: MockNote.G4s, rawDNA: MockRawDNA.xM7sus4b5)
//    static let B4bM7sus4b5 = Chord(rootNote: MockNote.B4b, rawDNA: MockRawDNA.xM7sus4b5)
//    static let B4bbbbM7sus4b5 = Chord(rootNote: MockNote.B4bbbb, rawDNA: MockRawDNA.xM7sus4b5)
//    static let B4bbbbx7sharp9flat13 = Chord(rootNote: MockNote.B4bbbb, rawDNA: MockRawDNA.x7sharp9flat13)
//    
//    static let B4bx7sharp9flat13 = Chord(rootNote: MockNote.B4b, rawDNA: MockRawDNA.x7sharp9flat13)
//    
//    static let B4x7sharp9flat13 = Chord(rootNote: MockNote.B4, rawDNA: MockRawDNA.x7sharp9flat13)
//    
//    static let B4bxm9Shrop11flat13 = Chord(rootNote: MockNote.B4b, rawDNA: MockRawDNA.xm9Shrop11flat13)
//    
//    static let B4bMflat99Shrop11flat13 = Chord(rootNote: MockNote.B4b, rawDNA: MockRawDNA.xMflat99Shrop11flat13)
//    static let B4bm9flat5Shrop11flat13 = Chord(rootNote: MockNote.B4b, rawDNA: MockRawDNA.xm9flat5Shrop11flat13)
//    
//    // C自然大调 顺阶3和弦 octave = 4
//    static let C4_M     = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xM)
//    static let D4_m     = Chord(rootNote: MockNote.D4, rawDNA: MockRawDNA.xm)
//    static let E4_m     = Chord(rootNote: MockNote.E4, rawDNA: MockRawDNA.xm)
//    static let F4_m     = Chord(rootNote: MockNote.F4, rawDNA: MockRawDNA.xM)
//    static let G4_m     = Chord(rootNote: MockNote.G4, rawDNA: MockRawDNA.xM)
//    static let A4_m     = Chord(rootNote: MockNote.A4, rawDNA: MockRawDNA.xm)
//    static let B4_dim   = Chord(rootNote: MockNote.B4, rawDNA: MockRawDNA.xdim)
//    
//    static let C4_Diatonic_3_Chords = [
//        C4_M,D4_m,E4_m,F4_m,G4_m,A4_m,B4_dim
//    ]
//    
//    // Ab自然大调 顺阶3和弦 octave = 4
//    static let Ab4_M = Chord(rootNote: MockNote.Ab4, rawDNA: MockRawDNA.xM)
//    static let Bb4_m = Chord(rootNote: MockNote.Bb4, rawDNA: MockRawDNA.xm)
//    static let C4_m = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xm)
//    static let Db4_m = Chord(rootNote: MockNote.Db4, rawDNA: MockRawDNA.xM)
//    static let Eb4_m = Chord(rootNote: MockNote.Eb4, rawDNA: MockRawDNA.xM)
////    static let F4_m = Chord(rootNote: MockNote.F4, rawDNA: MockRawDNA.xm)
//    static let G4_dim = Chord(rootNote: MockNote.G4, rawDNA: MockRawDNA.xdim)
//    
//    static let Ab4_Diatonic_3_Chords = [
//        Ab4_M,Bb4_m,C4_m,Db4_m,Eb4_m,F4_m,G4_dim
//    ]
//    
//    
//    // C自然大调 顺阶9和弦 octave = 4
//    static let C4_M9 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xM9)
//    static let D4_m9 = Chord(rootNote: MockNote.D4, rawDNA: MockRawDNA.xm9)
//    static let E4_m7flat9 = Chord(rootNote: MockNote.E4, rawDNA: MockRawDNA.xm7flat9)
//    static let F4_M9 = Chord(rootNote: MockNote.F4, rawDNA: MockRawDNA.xM9)
//    static let G4_9 = Chord(rootNote: MockNote.G4, rawDNA: MockRawDNA.x9)
//    static let A4_m9 = Chord(rootNote: MockNote.A4, rawDNA: MockRawDNA.xm9)
//    static let B4_m7flat5flat9 = Chord(rootNote: MockNote.B4, rawDNA: MockRawDNA.xm7flat5flat9)
//
//    static let C4_Diatonic_9_Chords = [
//        C4_M9,D4_m9,E4_m7flat9,F4_M9,G4_9,A4_m9,B4_m7flat5flat9
//    ]
//    
//    // C自然大调 顺阶7和弦 octave = 4
//    static let C4_M7 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xM7)
//    static let D4_m7 = Chord(rootNote: MockNote.D4, rawDNA: MockRawDNA.xm7)
//    static let E4_m7 = Chord(rootNote: MockNote.E4, rawDNA: MockRawDNA.xm7)
//    static let F4_M7 = Chord(rootNote: MockNote.F4, rawDNA: MockRawDNA.xM7)
//    static let G4_7 = Chord(rootNote: MockNote.G4, rawDNA: MockRawDNA.x7)
//    static let A4_m7 = Chord(rootNote: MockNote.A4, rawDNA: MockRawDNA.xm7)
//    static let B4_m7flat5 = Chord(rootNote: MockNote.B4, rawDNA: MockRawDNA.xm7falt5)
//
//    static let C4_Diatonic_7_Chords = [
//        C4_M7,
//        D4_m7,
//        E4_m7,
//        F4_M7,
//        G4_7,
//        A4_m7,
//        B4_m7flat5,
//    ]
//    
//    // C自然大调 顺阶13和弦 octave = 4
//    static let C4_M13 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xM13)
//    
//    // 常用 sus2 和弦
//    static let C3_sus2 = Chord(rootNote: MockNote.C3, rawDNA: MockRawDNA.xSus2)
//    static let C4_sus2 = Chord(rootNote: MockNote.C4, rawDNA: MockRawDNA.xSus2)
//    static let D4_sus2 = Chord(rootNote: MockNote.D4, rawDNA: MockRawDNA.xSus2)
//    static let E4_sus2 = Chord(rootNote: MockNote.E4, rawDNA: MockRawDNA.xSus2)
//    static let F4_sus2 = Chord(rootNote: MockNote.F4, rawDNA: MockRawDNA.xSus2)
//    static let G4_sus2 = Chord(rootNote: MockNote.G4, rawDNA: MockRawDNA.xSus2)
//    static let A4_sus2 = Chord(rootNote: MockNote.A4, rawDNA: MockRawDNA.xSus2)
//    static let B4_sus2 = Chord(rootNote: MockNote.B4, rawDNA: MockRawDNA.xSus2)
//    
//    static let common_use_sus2_triad_chords = [
//        C4_sus2,
//        D4_sus2,
//        E4_sus2,
//        F4_sus2,
//        G4_sus2,
//        A4_sus2,
//        B4_sus2,
//    ]
//    
//}
