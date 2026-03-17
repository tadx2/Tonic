//
//  ChordSymbolElementInputGroup.swift
//  Tonic
//
//  Created by 小汤汤 on 3/16/26.
//


public typealias ChordSymbolElementGroup = [ChordSymbolElement]

//extension ChordSymbolElementInputGroup {
//    public func displayString(mode: DisplayModeMainSus = .standard) -> String {
//        self.map { input in
//            input.displayString(mode: mode)
//        }.joined()
//    }
//}


// MainPreset
extension ChordSymbolElementGroup {
    public static let major: [ChordSymbolElement] = [.major]
    public static let majorFlat5: [ChordSymbolElement] = [.major, .flat, .five]
    public static let majorSharp5: [ChordSymbolElement] = [.major, .sharp, .five]
    public static let major6: [ChordSymbolElement] = [.major, .six]
    public static let major69: [ChordSymbolElement] = [.major, .six, .nine]
    public static let major7: [ChordSymbolElement] = [.major, .seven]
    public static let majorFlatFlat7: [ChordSymbolElement] = [.major, .flat, .flat, .seven]
    public static let major9: [ChordSymbolElement] = [.major, .nine]
    public static let major11: [ChordSymbolElement] = [.major, .eleven]
    public static let major13: [ChordSymbolElement] = [.major, .thirteen]

    public static let halfDiminished: [ChordSymbolElement] = [.halfDiminished]

    public static let diminished: [ChordSymbolElement] = [.diminished]
    public static let diminished6: [ChordSymbolElement] = [.diminished, .six]
    public static let diminished69: [ChordSymbolElement] = [.diminished, .six, .nine]
    public static let diminished7: [ChordSymbolElement] = [.diminished, .seven]
    public static let diminished9: [ChordSymbolElement] = [.diminished, .nine]
    public static let diminished11: [ChordSymbolElement] = [.diminished, .eleven]
    public static let diminished13: [ChordSymbolElement] = [.diminished, .thirteen]

    public static let minor: [ChordSymbolElement] = [.minor]
    public static let minorSharp5: [ChordSymbolElement] = [.minor, .sharp, .five]
    public static let minorFlat5: [ChordSymbolElement] = [.minor, .flat, .five]
    public static let minorAugmented: [ChordSymbolElement] = [.minor, .augmented]
    public static let minor6: [ChordSymbolElement] = [.minor, .six]
    public static let minor69: [ChordSymbolElement] = [.minor, .six, .nine]
    public static let minor7: [ChordSymbolElement] = [.minor, .seven]
    public static let minorFlatFlat7: [ChordSymbolElement] = [.minor, .flat, .flat, .seven]
    public static let minor9: [ChordSymbolElement] = [.minor, .nine]
    public static let minor11: [ChordSymbolElement] = [.minor, .eleven]
    public static let minor13: [ChordSymbolElement] = [.minor, .thirteen]

    public static let augmented: [ChordSymbolElement] = [.augmented]
    public static let augmented6: [ChordSymbolElement] = [.augmented, .six]
    public static let augmented69: [ChordSymbolElement] = [.augmented, .six, .nine]
    public static let augmented7: [ChordSymbolElement] = [.augmented, .seven]
    public static let augmented9: [ChordSymbolElement] = [.augmented, .nine]
    public static let augmented11: [ChordSymbolElement] = [.augmented, .eleven]
    public static let augmented13: [ChordSymbolElement] = [.augmented, .thirteen]

    public static let flat5: [ChordSymbolElement] = [.flat, .five]
    public static let sharp5: [ChordSymbolElement] = [.sharp, .five]

    public static let seven: [ChordSymbolElement] = [.seven]
    public static let flatFlat7: [ChordSymbolElement] = [.flat, .flat, .seven]
    public static let sevenAlt: [ChordSymbolElement] = [.seven, .alt]

    public static let six: [ChordSymbolElement] = [.six]
    public static let six9: [ChordSymbolElement] = [.six, .nine]

    public static let minorMajor: [ChordSymbolElement] = [.minor, .major]
    public static let minorMajorFlat5: [ChordSymbolElement] = [.minor, .major, .flat, .five]
    public static let minorMajorSharp5: [ChordSymbolElement] = [.minor, .major, .sharp, .five]
    public static let minorMajor7: [ChordSymbolElement] = [.minor, .major, .seven]
    public static let minorMajor9: [ChordSymbolElement] = [.minor, .major, .nine]
    public static let minorMajor11: [ChordSymbolElement] = [.minor, .major, .eleven]
    public static let minorMajor13: [ChordSymbolElement] = [.minor, .major, .thirteen]

    public static let alt: [ChordSymbolElement] = [.alt]
}

// SusPreset
extension ChordSymbolElementGroup {
    public static let sus: [ChordSymbolElement] = [.sus]
    public static let sus2: [ChordSymbolElement] = [.sus, .two]
    public static let sus4: [ChordSymbolElement] = [.sus, .four]
}

// TensionPreset
extension ChordSymbolElementGroup {
    public static let nine: [ChordSymbolElement] = [.nine]
    public static let flat9: [ChordSymbolElement] = [.flat, .nine]
    public static let sharp9: [ChordSymbolElement] = [.sharp, .nine]
    public static let eleven: [ChordSymbolElement] = [.eleven]
    public static let sharp11: [ChordSymbolElement] = [.sharp, .eleven]
    public static let thirteen: [ChordSymbolElement] = [.thirteen]
    public static let flat13: [ChordSymbolElement] = [.flat, .thirteen]
    public static let sharp13: [ChordSymbolElement] = [.sharp, .thirteen]
}


// RootNotePreset
extension ChordSymbolElementGroup {
    public static let C: [ChordSymbolElement] = [.C]
    public static let Cb: [ChordSymbolElement] = [.C, .flat]
    public static let Cbb: [ChordSymbolElement] = [.C, .flat, .flat]
    public static let Cs: [ChordSymbolElement] = [.C, .sharp]
    public static let Css: [ChordSymbolElement] = [.C, .sharp, .sharp]
    
    public static let D: [ChordSymbolElement] = [.D]
    public static let Db: [ChordSymbolElement] = [.D, .flat]
    public static let Dbb: [ChordSymbolElement] = [.D, .flat, .flat]
    public static let Ds: [ChordSymbolElement] = [.D, .sharp]
    public static let Dss: [ChordSymbolElement] = [.D, .sharp, .sharp]

    public static let E: [ChordSymbolElement] = [.E]
    public static let Eb: [ChordSymbolElement] = [.E, .flat]
    public static let Ebb: [ChordSymbolElement] = [.E, .flat, .flat]
    public static let Es: [ChordSymbolElement] = [.E, .sharp]
    public static let Ess: [ChordSymbolElement] = [.E, .sharp, .sharp]

    public static let F: [ChordSymbolElement] = [.F]
    public static let Fb: [ChordSymbolElement] = [.F, .flat]
    public static let Fbb: [ChordSymbolElement] = [.F, .flat, .flat]
    public static let Fs: [ChordSymbolElement] = [.F, .sharp]
    public static let Fss: [ChordSymbolElement] = [.F, .sharp, .sharp]

    public static let G: [ChordSymbolElement] = [.G]
    public static let Gb: [ChordSymbolElement] = [.G, .flat]
    public static let Gbb: [ChordSymbolElement] = [.G, .flat, .flat]
    public static let Gs: [ChordSymbolElement] = [.G, .sharp]
    public static let Gss: [ChordSymbolElement] = [.G, .sharp, .sharp]

    public static let A: [ChordSymbolElement] = [.A]
    public static let Ab: [ChordSymbolElement] = [.A, .flat]
    public static let Abb: [ChordSymbolElement] = [.A, .flat, .flat]
    public static let As: [ChordSymbolElement] = [.A, .sharp]
    public static let Ass: [ChordSymbolElement] = [.A, .sharp, .sharp]

    public static let B: [ChordSymbolElement] = [.B]
    public static let Bb: [ChordSymbolElement] = [.B, .flat]
    public static let Bbb: [ChordSymbolElement] = [.B, .flat, .flat]
    public static let Bs: [ChordSymbolElement] = [.B, .sharp]
    public static let Bss: [ChordSymbolElement] = [.B, .sharp, .sharp]
}
