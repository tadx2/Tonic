//
//  ChordSymbolElementGroup.swift
//  Tonic
//
//  Created by 小汤汤 on 3/16/26.
//

public typealias ChordSymbolElementGroup = [ChordSymbolElement]

/// Convenient Body Quality
public extension ChordSymbolElementGroup {
    static let major: [ChordSymbolElement] = [.major]
    static let majorFlat5: [ChordSymbolElement] = [.major, .flat, .five]
    static let majorSharp5: [ChordSymbolElement] = [.major, .sharp, .five]
    static let major6: [ChordSymbolElement] = [.major, .six]
    static let major69: [ChordSymbolElement] = [.major, .six, .nine]
    static let major7: [ChordSymbolElement] = [.major, .seven]
    static let majorFlatFlat7: [ChordSymbolElement] = [.major, .flat, .flat, .seven]
    static let major9: [ChordSymbolElement] = [.major, .nine]
    static let major11: [ChordSymbolElement] = [.major, .eleven]
    static let major13: [ChordSymbolElement] = [.major, .thirteen]

    static let halfDiminished: [ChordSymbolElement] = [.halfDiminished]

    static let diminished: [ChordSymbolElement] = [.diminished]
    static let diminished6: [ChordSymbolElement] = [.diminished, .six]
    static let diminished69: [ChordSymbolElement] = [.diminished, .six, .nine]
    static let diminished7: [ChordSymbolElement] = [.diminished, .seven]
    static let diminished9: [ChordSymbolElement] = [.diminished, .nine]
    static let diminished11: [ChordSymbolElement] = [.diminished, .eleven]
    static let diminished13: [ChordSymbolElement] = [.diminished, .thirteen]

    static let minor: [ChordSymbolElement] = [.minor]
    static let minorSharp5: [ChordSymbolElement] = [.minor, .sharp, .five]
    static let minorFlat5: [ChordSymbolElement] = [.minor, .flat, .five]
    static let minorAugmented: [ChordSymbolElement] = [.minor, .augmented]
    static let minor6: [ChordSymbolElement] = [.minor, .six]
    static let minor69: [ChordSymbolElement] = [.minor, .six, .nine]
    static let minor7: [ChordSymbolElement] = [.minor, .seven]
    static let minorFlatFlat7: [ChordSymbolElement] = [.minor, .flat, .flat, .seven]
    static let minor9: [ChordSymbolElement] = [.minor, .nine]
    static let minor11: [ChordSymbolElement] = [.minor, .eleven]
    static let minor13: [ChordSymbolElement] = [.minor, .thirteen]

    static let augmented: [ChordSymbolElement] = [.augmented]
    static let augmented6: [ChordSymbolElement] = [.augmented, .six]
    static let augmented69: [ChordSymbolElement] = [.augmented, .six, .nine]
    static let augmented7: [ChordSymbolElement] = [.augmented, .seven]
    static let augmented9: [ChordSymbolElement] = [.augmented, .nine]
    static let augmented11: [ChordSymbolElement] = [.augmented, .eleven]
    static let augmented13: [ChordSymbolElement] = [.augmented, .thirteen]

    static let flat5: [ChordSymbolElement] = [.flat, .five]
    static let sharp5: [ChordSymbolElement] = [.sharp, .five]

    static let seven: [ChordSymbolElement] = [.seven]
    static let flatFlat7: [ChordSymbolElement] = [.flat, .flat, .seven]
    static let sevenAlt: [ChordSymbolElement] = [.seven, .alt]

    static let six: [ChordSymbolElement] = [.six]
    static let six9: [ChordSymbolElement] = [.six, .nine]

    static let minorMajor: [ChordSymbolElement] = [.minor, .major]
    static let minorMajorFlat5: [ChordSymbolElement] = [.minor, .major, .flat, .five]
    static let minorMajorSharp5: [ChordSymbolElement] = [.minor, .major, .sharp, .five]
    static let minorMajor7: [ChordSymbolElement] = [.minor, .major, .seven]
    static let minorMajor9: [ChordSymbolElement] = [.minor, .major, .nine]
    static let minorMajor11: [ChordSymbolElement] = [.minor, .major, .eleven]
    static let minorMajor13: [ChordSymbolElement] = [.minor, .major, .thirteen]

    static let alt: [ChordSymbolElement] = [.alt]
}

/// Convenient Body Sus
public extension ChordSymbolElementGroup {
    static let sus: [ChordSymbolElement] = [.sus]
    static let sus2: [ChordSymbolElement] = [.sus, .two]
    static let sus4: [ChordSymbolElement] = [.sus, .four]
}

/// Convenient Body Tension
public extension ChordSymbolElementGroup {
    // Valid
    static let flat9: [ChordSymbolElement] = [.flat, .nine]
    static let sharp9: [ChordSymbolElement] = [.sharp, .nine]
    static let nine: [ChordSymbolElement] = [.nine]

    static let flat11: [ChordSymbolElement] = [.flat, .eleven]
    static let sharp11: [ChordSymbolElement] = [.sharp, .eleven]
    static let eleven: [ChordSymbolElement] = [.eleven]

    static let flat13: [ChordSymbolElement] = [.flat, .thirteen]
    static let sharp13: [ChordSymbolElement] = [.sharp, .thirteen]
    static let thirteen: [ChordSymbolElement] = [.thirteen]

    /// Error
    static let FlatFlatnine: [ChordSymbolElement] = bb + nine
}

/// Convenient Note
public extension ChordSymbolElementGroup {
    static let C: [ChordSymbolElement] = [.C]
    static let Cb: [ChordSymbolElement] = [.C, .flat]
    static let Cbb: [ChordSymbolElement] = [.C, .flat, .flat]
    static let Cs: [ChordSymbolElement] = [.C, .sharp]
    static let Css: [ChordSymbolElement] = [.C, .sharp, .sharp]

    static let D: [ChordSymbolElement] = [.D]
    static let Db: [ChordSymbolElement] = [.D, .flat]
    static let Dbb: [ChordSymbolElement] = [.D, .flat, .flat]
    static let Ds: [ChordSymbolElement] = [.D, .sharp]
    static let Dss: [ChordSymbolElement] = [.D, .sharp, .sharp]

    static let E: [ChordSymbolElement] = [.E]
    static let Eb: [ChordSymbolElement] = [.E, .flat]
    static let Ebb: [ChordSymbolElement] = [.E, .flat, .flat]
    static let Es: [ChordSymbolElement] = [.E, .sharp]
    static let Ess: [ChordSymbolElement] = [.E, .sharp, .sharp]

    static let F: [ChordSymbolElement] = [.F]
    static let Fb: [ChordSymbolElement] = [.F, .flat]
    static let Fbb: [ChordSymbolElement] = [.F, .flat, .flat]
    static let Fs: [ChordSymbolElement] = [.F, .sharp]
    static let Fss: [ChordSymbolElement] = [.F, .sharp, .sharp]

    static let G: [ChordSymbolElement] = [.G]
    static let Gb: [ChordSymbolElement] = [.G, .flat]
    static let Gbb: [ChordSymbolElement] = [.G, .flat, .flat]
    static let Gs: [ChordSymbolElement] = [.G, .sharp]
    static let Gss: [ChordSymbolElement] = [.G, .sharp, .sharp]

    static let A: [ChordSymbolElement] = [.A]
    static let Ab: [ChordSymbolElement] = [.A, .flat]
    static let Abb: [ChordSymbolElement] = [.A, .flat, .flat]
    static let As: [ChordSymbolElement] = [.A, .sharp]
    static let Ass: [ChordSymbolElement] = [.A, .sharp, .sharp]

    static let B: [ChordSymbolElement] = [.B]
    static let Bb: [ChordSymbolElement] = [.B, .flat]
    static let Bbb: [ChordSymbolElement] = [.B, .flat, .flat]
    static let Bs: [ChordSymbolElement] = [.B, .sharp]
    static let Bss: [ChordSymbolElement] = [.B, .sharp, .sharp]
}

/// Convenient Note Acc
public extension ChordSymbolElementGroup {
    // Valid
    static let b: [ChordSymbolElement] = [.flat]
    static let bb: [ChordSymbolElement] = [.flat, .flat]
    static let s: [ChordSymbolElement] = [.sharp]
    static let ss: [ChordSymbolElement] = [.sharp, .sharp]

    // Error
    static let bbb: [ChordSymbolElement] = [.flat, .flat, .flat]
    static let bbbb: [ChordSymbolElement] = [.flat, .flat, .flat, .flat]
    static let sss: [ChordSymbolElement] = [.sharp, .sharp, .sharp]
    static let ssss: [ChordSymbolElement] = [.sharp, .sharp, .sharp, .sharp]
}
