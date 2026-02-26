//
//  Chord+Preset.swift
//  Tonic
//
//  Created by 小汤汤 on 2/18/26.
//

// Preset
extension Chord {
    // C 大调顺接和弦 Triad
    public static let C4M: Chord = Chord(root: .C4, intervals: .x)
    public static let D4m: Chord = Chord(root: .D4, intervals: .xm)
    public static let E4m: Chord = Chord(root: .E4, intervals: .xm)
    public static let F4M: Chord = Chord(root: .F4, intervals: .x)
    public static let G4M: Chord = Chord(root: .G4, intervals: .x)
    public static let A4m: Chord = Chord(root: .A4, intervals: .xm)
    public static let B4dim: Chord = Chord(root: .B4, intervals: .xdim)
    
    // C 大调顺接和弦 Seventh
    public static let C4M7: Chord = Chord(root: .C4, intervals: .xM7)
    public static let D4m7: Chord = Chord(root: .D4, intervals: .xm7)
    public static let E4m7: Chord = Chord(root: .E4, intervals: .xm7)
    public static let F4M7: Chord = Chord(root: .F4, intervals: .xM7)
    public static let G4X7: Chord = Chord(root: .G4, intervals: .x7)
    public static let A4m7: Chord = Chord(root: .A4, intervals: .xm7)
    public static let B4dim7: Chord = Chord(root: .B4, intervals: .xdim7)
    
    public static let C3M7:   Chord = Chord(root: .C3, intervals: .xM7)
    public static let D3m7:   Chord = Chord(root: .D3, intervals: .xm7)
    public static let E3m7:   Chord = Chord(root: .E3, intervals: .xm7)
    public static let F3M7:   Chord = Chord(root: .F3, intervals: .xM7)
    public static let G3X7:   Chord = Chord(root: .G3, intervals: .x7)
    public static let A3m7:   Chord = Chord(root: .A3, intervals: .xm7)
    public static let B3dim7: Chord = Chord(root: .B3, intervals: .xdim7)
    
    // C 大调顺接和弦 Seventh Multiple Tension
    public static let C4M7_M9: Chord = Chord(root: .C4, intervals: .xM7_M9)
    public static let C4M7_M13: Chord = Chord(root: .C4, intervals: .xM7_M13)
    public static let C4M7_M9_M13: Chord = Chord(root: .C4, intervals: .xM7_M9_M13)
    public static let C4M7_M9_P11: Chord = Chord(root: .C4, intervals: .xM7_M9_P11)
    public static let C4M7_M9_P11_M13: Chord = Chord(root: .C4, intervals: .xM7_M9_P11_M13)
    
    public static let D4m7_M9: Chord = Chord(root: .D4, intervals: .xm7_M9)
    public static let D4m7_M9_P11: Chord = Chord(root: .D4, intervals: .xm7_M9_P11)
    public static let D4m7_M9_P11_M13: Chord = Chord(root: .D4, intervals: .xm7_M9_P11_M13)
    
    public static let G4x7: Chord = Chord(root: .G4, intervals: .x7)
    public static let G4x7_M9: Chord = Chord(root: .G4, intervals: .x7_M9)
    public static let G4x7_M9_P11: Chord = Chord(root: .G4, intervals: .x7_M9_P11)
    public static let G4x7_M9_M13: Chord = Chord(root: .G4, intervals: .x7_M9_M13)
    
    public static let G4x7_M9_P11_M13: Chord = Chord(root: .G4, intervals: .x7_M9_P11_M13)
    
    // F 大调顺接和弦 Seventh
    // F4M7
    public static let G4m7: Chord = Chord(root: .G4, intervals: .xm7)
    // A4m7
    public static let Bb4M7: Chord = Chord(root: .B4b, intervals: .xM7)
    public static let C4X7: Chord = Chord(root: .C4, intervals: .x7)
    // D4m7
    public static let E4dim7: Chord = Chord(root: .E4, intervals: .xdim7)
    
    // F 大调顺接和弦 Seventh
    // F3M7
    public static let G3m7: Chord = Chord(root: .G3, intervals: .xm7)
    // A3m7
    public static let Bb3M7: Chord = Chord(root: .B3b, intervals: .xM7)
    public static let C3X7: Chord = Chord(root: .C3, intervals: .x7)
    // D3m7
    public static let E3dim7: Chord = Chord(root: .E3, intervals: .xdim7)
    
    // C Sus2
    public static let CSus2: Chord = Chord(root: .C4, intervals: .xSus2)
    public static let CSus2_M9: Chord = Chord(root: .C4, intervals: .xSus2_M9)
    
    // C Sus4
    public static let CSus4_P11: Chord = Chord(root: .C4, intervals: .xSus4_P11)
    
    
    public static let F4X7: Chord = Chord(root: .F4, intervals: .x7)
}
