//
//  ChordSymbolBaseCase.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public enum ChordSymbolCase: String, CaseIterable {

    // 三和弦
    case traidMajor
    case traidAugmented
    case traidMajorFlat5

    case traidMinor
    case traidMinorSharp5
    case traidDiminished

    // 三和弦挂留
    // 三和弦挂留 Sus
    case traidSus
    case traidSusAugmented
    case traidSusFlat5
    
    // 三和弦挂留 Sus2
    case traidSus2
    case traidSus2Flat5
    case traidSus2Sharp5
    
    // 三和弦挂留 Sus4
    case traidSus4
    case traidSus4Flat5
    case traidSus4Sharp5

    // 七和弦
    case sevnethMajor
    case sevnethMinor
    case sevnethDominant
    case sevnethHalfDiminished
    case sevnethDiminished
    case sevnethMajorFlat5
    case sevnethMinorMajor
    case sevnethMajorDoubleFlat7
    case sevnethDominantFlat5
    case sevnethMajorFlat5DoubleFlat7
    case sevnethMajorSharp5
    case sevnethDominantSharp5
    case sevnethMajorSharp5DoubleFlat7
    case sevnethMinorDoubleFlat7
    case sevnethMinorMajorFlat5
    case sevnethMinorMajorSharp5
    case sevnethMinorSharp5
    case sevnethMinorSharp5DoubleFlat7

    // 七和弦挂留 Sus
    case seventhSus
    case seventhDominantSus
    case seventhDoubleFlatSus
    case seventhMajorSusFlat5
    case seventhDominantSusFlat5
    case seventhDoubleFlatSusFlat5
    case seventhMajorSusSharp5
    case seventhDominantSusSharp5
    case seventhDoubleFlatSusSharp5
    
    // 七和弦挂留 Sus2
    case seventhSus2Major
    case seventhDominantSus2
    case seventhDoubleFlatSus2
    case seventhMajorSus2Flat5
    case seventhDominantSus2Flat5
    case seventhDoubleFlatSus2Flat5
    case seventhMajorSus2Sharp5
    case seventhDominantSus2Sharp5
    case seventhDoubleFlatSus2Sharp5

    // 七和弦挂留 Sus4
    case seventhSus4Major
    case seventhDominantSus4
    case seventhDoubleFlatSus4
    case seventhMajorSus4Flat5
    case seventhDominantSus4Flat5
    case seventhDoubleFlatSus4Flat5
    case seventhMajorSus4Sharp5
    case seventhDominantSus4Sharp5
    case seventhDoubleFlatSus4Sharp5

    // 六和弦
    case sixthMajor
    case sixthAugmented
    case sixthMajorFlat5
    case sixthMinor
    case sixthMinorSharp5
    case sixthDiminished

    // 六和弦挂留
    // 六和弦挂留 Sus
    case sixthSus
    case sixthSusSharp5
    case sixthSusFlat5
    
    // 六和弦挂留 Sus2
    case sixthMajorSus2
    case sixthMajorSus2Sharp5
    case sixthMajorSus2Flat5

    // 六和弦挂留 Sus4
    case sixthMajorSus4
    case sixthMajorSus4Sharp5
    case sixthMajorSus4Flat5

    public var chordSymbols: [ChordSymbol] {
        switch self {
        // 三和弦
        case .traidMajor:
            return [
                ChordSymbol(),
                ChordSymbol(.major),
            ]
        case .traidAugmented:
            return [
                ChordSymbol(.augmented),
                ChordSymbol(.majorSharp5),
                ChordSymbol(.major, additions: [.sharp5]),
            ]
        case .traidMajorFlat5:
            return [
                ChordSymbol(.majorFlat5),
                ChordSymbol(.major, additions: [.flat5]),
            ]

        case .traidMinor:
            return [
                ChordSymbol(.minor)
            ]
        case .traidMinorSharp5:
            return [
                ChordSymbol(.minorSharp5),
                ChordSymbol(.minor, additions: [.sharp5]),
                ChordSymbol(.minorAugmented),
            ]
        case .traidDiminished:
            return [
                ChordSymbol(.diminished),
                ChordSymbol(.minor, additions: [.flat5]),
            ]
        
        // 三和弦挂留 sus
        case .traidSus:
            return [
                ChordSymbol(sus: .sus)
            ]
        case .traidSusAugmented:
            return [
                ChordSymbol(sus: .sus, additions: [.sharp5]),
                ChordSymbol(.augmented, sus: .sus)
            ]
            
        case .traidSusFlat5:
            return [
                ChordSymbol(sus: .sus, additions: [.flat5]),
            ]

        // 三和弦挂留 sus2
            
        case .traidSus2:
            return [
                ChordSymbol(sus: .sus2)
            ]
        case .traidSus2Flat5:
            return [
                ChordSymbol(sus: .sus2, additions: [.flat5])
            ]
        case .traidSus2Sharp5:
            return [
                ChordSymbol(sus: .sus2, additions: [.sharp5])
            ]

        // 三和弦挂留 sus4
        case .traidSus4:
            return [
                ChordSymbol(sus: .sus4),
            ]
        case .traidSus4Flat5:
            return [
                ChordSymbol(sus: .sus4, additions: [.flat5]),
            ]
        case .traidSus4Sharp5:
            return [
                ChordSymbol(sus: .sus4, additions: [.sharp5]),
            ]

        // 七和弦
        case .sevnethMajor:
            return [
                ChordSymbol(.major7), // M7
                ChordSymbol(.major, additions: [.seven]) // M(7)
            ]
        case .sevnethMinorMajor:
            return [
                ChordSymbol(.minorMajor), // mM
                ChordSymbol(.minorMajor7), // mM7
            ]
        case .sevnethMajorFlat5:
            return [
                ChordSymbol(.major7, additions: [.flat5]), // M7(b5)
                ChordSymbol(.majorFlat5, additions: [.seven]) // Mb5(7)
            ]
        case .sevnethMinorMajorFlat5:
            return [
                ChordSymbol(.minorMajor, additions: [.flat5]),
                ChordSymbol(.minorMajor7, additions: [.flat5]),
                ChordSymbol(.minorMajorFlat5, additions: [.seven]),
            ]
        case .sevnethMajorSharp5:
            return [
                ChordSymbol(.major7, additions: [.sharp5]), // M7(#5)
                ChordSymbol(.augmented7), // aug7
                ChordSymbol(.augmented, additions: [.seven]), // aug(7)
                ChordSymbol(.majorSharp5, additions: [.seven])  // M#5(7)
            ]
            
        case .sevnethMinorMajorSharp5:
            return [
                ChordSymbol(.minorMajor, additions: [.sharp5]),         // mM(#5)
                ChordSymbol(.minorMajorSharp5, additions: [.seven]), // mM#5(7)
                ChordSymbol(.minorMajor7, additions: [.sharp5]), // mM7(#5)
            ]
        case .sevnethDominant:
            return [
                ChordSymbol(.seven), // 7
            ]
        case .sevnethMinor:
            return [
                ChordSymbol(.minor7), // m7
                ChordSymbol(.minor, additions: [.seven]) // m(7)
            ]
        case .sevnethDominantFlat5:
            return [
                ChordSymbol(.seven, additions: [.flat5]) // 7(b5)
            ]
        case .sevnethHalfDiminished:
            return [
                ChordSymbol(.halfDiminished), // m7b5
                ChordSymbol(.minor7, additions: [.flat5]), // m7(b5)
            ]
        case .sevnethDominantSharp5:
            return [
                ChordSymbol(.seven, additions: [.sharp5]), // 7(#5)
            ]
        case .sevnethMinorSharp5:
            return [
                ChordSymbol(.minor7, additions: [.sharp5]), // m7(#5)
                ChordSymbol(.minorSharp5, additions: [.seven]) // m#5(7)
            ]
        case .sevnethMajorDoubleFlat7:
            return [
                ChordSymbol(.majorFlatFlat7), // Mbb7
                ChordSymbol(.major, additions: [.flatFlat7]), // M(bb7)
            ]
        case .sevnethMinorDoubleFlat7:
            return [
                ChordSymbol(.minorFlatFlat7), // mbb7
                ChordSymbol(.minor, additions: [.flatFlat7]), // m(bb7)
            ]
        case .sevnethMajorFlat5DoubleFlat7:
            return [
                ChordSymbol(.majorFlat5, additions: [.flatFlat7]), // Mb5(bb7)
                ChordSymbol(.majorFlatFlat7, additions: [.flat5]), // Mbb7(b5)
                ChordSymbol(.major, additions: [.flat5, .flatFlat7]), // M(b5, bb7)
            ]
        case .sevnethDiminished:
            return [
                ChordSymbol(.diminished7),
                ChordSymbol(.diminished, additions: [.seven]),
            ]
        case .sevnethMajorSharp5DoubleFlat7:
            return [
                ChordSymbol(.majorSharp5, additions: [.flatFlat7]), // M#5(bb7)
                ChordSymbol(.majorFlatFlat7, additions: [.sharp5]), // Mbb7(#5)
                ChordSymbol(.major, additions: [.sharp5, .flatFlat7]), // M(#5 bb7)
            ]
        case .sevnethMinorSharp5DoubleFlat7:
            return [
                ChordSymbol(.minorSharp5, additions: [.flatFlat7]), // m#5(bb7)
                ChordSymbol(.minorFlatFlat7, additions: [.sharp5]), // mbb7(#5)
                ChordSymbol(.minor, additions: [.sharp5, .flatFlat7]), // m(#5 bb7)
            ]
            
        case .seventhSus:
            return [
                ChordSymbol(.major7, sus: .sus), // M7sus
                ChordSymbol(.major, sus: .sus, additions: [.seven]), // Msus(7)
            ]
        case .seventhDominantSus:
            return [
                ChordSymbol(.seven, sus: .sus), // 7sus
            ]
        case .seventhDoubleFlatSus:
            return [
                ChordSymbol(.flatFlat7, sus: .sus), // bb7sus
                ChordSymbol(sus: .sus, additions: [.flatFlat7]), // sus(bb7)
            ]
        case .seventhMajorSusFlat5:
            return [
                ChordSymbol(.major7, sus: .sus, additions: [.flat5]), // M7sus(b5)
                ChordSymbol(.majorFlat5, sus: .sus, additions: [.seven]), // Mb5sus(7)
            ]
        case .seventhDominantSusFlat5:
            return [
                ChordSymbol(.seven, sus: .sus, additions: [.flat5]), // 7sus(b5)
            ]
        case .seventhDoubleFlatSusFlat5:
            return [
                ChordSymbol(.flatFlat7, sus: .sus, additions: [.flat5]), // bb7sus(b5)
                ChordSymbol(sus: .sus, additions: [.flat5, .flatFlat7]), // sus(b5 bb7)
                ChordSymbol(.flat5, sus: .sus, additions: [.flatFlat7]), // b5sus(bb7)
            ]
        case .seventhMajorSusSharp5:
            return [
                ChordSymbol(.major7, sus: .sus, additions: [.sharp5]), // M7sus(#5)
                ChordSymbol(.majorSharp5, sus: .sus, additions: [.seven]), // M#5sus(7)
            ]
        case .seventhDominantSusSharp5:
            return [
                ChordSymbol(.seven, sus: .sus, additions: [.sharp5]), // 7sus(#5)
            ]
        case .seventhDoubleFlatSusSharp5:
            return [
                ChordSymbol(.flatFlat7, sus: .sus, additions: [.sharp5]), // bb7sus(#5)
                ChordSymbol(sus: .sus, additions: [.sharp5, .flatFlat7]), // sus(#5 bb7)
                ChordSymbol(.sharp5, sus: .sus, additions: [.flatFlat7]), // #5sus(bb7)
            ]
            
        // 七和弦挂留 sus2
        case .seventhSus2Major:
            return [
                ChordSymbol(.major7, sus: .sus2), // M7sus2
                ChordSymbol(.major, sus: .sus2, additions: [.seven]), // Msus2(7)
            ]
        case .seventhMajorSus2Flat5:
            return [
                ChordSymbol(.major7, sus: .sus2, additions: [.flat5]), // M7sus2(b5)
                ChordSymbol(.majorFlat5, sus: .sus2, additions: [.seven]), // Mb5sus2(7)
            ]
        case .seventhMajorSus2Sharp5:
            return [
                ChordSymbol(.major7, sus: .sus2, additions: [.sharp5]), // M7sus2(#5)
                ChordSymbol(.majorSharp5, sus: .sus2, additions: [.seven]), // M#5sus2(7)
            ]
        case .seventhDominantSus2:
            return [
                ChordSymbol(.seven, sus: .sus2), // 7sus2
            ]
        case .seventhDominantSus2Flat5:
            return [
                ChordSymbol(.seven, sus: .sus2, additions: [.flat5]), // 7sus2(b5)
            ]
        case .seventhDominantSus2Sharp5:
            return [
                ChordSymbol(.seven, sus: .sus2, additions: [.sharp5]), // 7sus2(#5)
            ]
        case .seventhDoubleFlatSus2:
            return [
                ChordSymbol(.flatFlat7, sus: .sus2), // bb7sus2
                ChordSymbol(sus: .sus2, additions: [.flatFlat7]), // sus2(bb7)
            ]
        case .seventhDoubleFlatSus2Flat5:
            return [
                ChordSymbol(.flatFlat7, sus: .sus2, additions: [.flat5]), // bb7sus2(b5)
                ChordSymbol(sus: .sus2, additions: [.flat5, .flatFlat7]),   // sus2(b5 bb7)
                ChordSymbol(.flat5, sus: .sus2, additions: [.flatFlat7]), // b5sus2(bb7)
            ]
        case .seventhDoubleFlatSus2Sharp5:
            return [
                ChordSymbol(.flatFlat7, sus: .sus2, additions: [.sharp5]), // bb7sus2(#5)
                ChordSymbol(sus: .sus2, additions: [.sharp5, .flatFlat7]),   // sus2(#5 bb7)
                ChordSymbol(.sharp5, sus: .sus2, additions: [.flatFlat7]), // #5sus2(bb7)
            ]

        // 七和弦挂留 sus4
        case .seventhSus4Major:
            return [
                ChordSymbol(.major7, sus: .sus4), // M7sus4
                ChordSymbol(.major, sus: .sus4, additions: [.seven]), // Msus4(7)
            ]
        case .seventhMajorSus4Flat5:
            return [
                ChordSymbol(.major7, sus: .sus4, additions: [.flat5]), // M7sus4(b5)
                ChordSymbol(.majorFlat5, sus: .sus4, additions: [.seven]), // Mb5sus4(7)
            ]
        case .seventhMajorSus4Sharp5:
            return [
                ChordSymbol(.major7, sus: .sus4, additions: [.sharp5]), // M7sus4(#5)
                ChordSymbol(.majorSharp5, sus: .sus4, additions: [.seven]), // M#5sus4(7)
            ]
        case .seventhDominantSus4:
            return [
                ChordSymbol(.seven, sus: .sus4), // 7sus4
            ]
        case .seventhDominantSus4Flat5:
            return [
                ChordSymbol(.seven, sus: .sus4, additions: [.flat5]), // 7sus4(b5)
            ]
        case .seventhDominantSus4Sharp5:
            return [
                ChordSymbol(.seven, sus: .sus4, additions: [.sharp5]), // 7sus4(#5)
            ]
        case .seventhDoubleFlatSus4:
            return [
                ChordSymbol(.flatFlat7, sus: .sus4), // bb7sus4
                ChordSymbol(sus: .sus4, additions: [.flatFlat7]), // sus4(bb7)
            ]
        case .seventhDoubleFlatSus4Flat5:
            return [
                ChordSymbol(.flatFlat7, sus: .sus4, additions: [.flat5]),  // bb7sus4(b5)
                ChordSymbol(sus: .sus4, additions: [.flat5, .flatFlat7]),  // sus4(b5 bb7)
                ChordSymbol(.flat5, sus: .sus4, additions: [.flatFlat7]),  // b5sus4(bb7)
            ]
        case .seventhDoubleFlatSus4Sharp5:
            return [
                ChordSymbol(.flatFlat7, sus: .sus4, additions: [.sharp5]), // bb7sus4(#5)
                ChordSymbol(sus: .sus4, additions: [.sharp5, .flatFlat7]), // sus4(#5 bb7)
                ChordSymbol(.sharp5, sus: .sus4, additions: [.flatFlat7]), // #5sus4(bb7)
            ]


        // 六和弦
        case .sixthMajor:
            return [
                ChordSymbol(.six), // 6
                ChordSymbol(.major6), // M6
                ChordSymbol(.major, additions: [.six]), // M(6)
            ]
        case .sixthAugmented:  // 争议表示
            return [
                ChordSymbol(.augmented6),  // aug6
                ChordSymbol(.six, additions: [.sharp5]), // 6(#5)
                ChordSymbol(.major6, additions: [.sharp5]),  // M6(#5)
                ChordSymbol(.major, additions: [.sharp5, .six]),  // M(#5 6)
            ]
        case .sixthMajorFlat5:
            return [
                ChordSymbol(.six, additions: [.flat5]), // 6(b5)
                ChordSymbol(.major6, additions: [.flat5]), // M6(b5)
                ChordSymbol(.major, additions: [.flat5, .six]),  // M(b5 6)
            ]
        case .sixthMinor:
            return [
                ChordSymbol(.minor6), // m6
                ChordSymbol(.minor, additions: [.six]), // m(6)
            ]
        case .sixthMinorSharp5:
            return [
                ChordSymbol(.minor6, additions: [.sharp5]), // m6(#5)
                ChordSymbol(.minor, additions: [.sharp5, .six]), // m(#5 6)
            ]
        case .sixthDiminished:
            return [
                ChordSymbol(.diminished6), // dim6
                ChordSymbol(.diminished, additions: [.six]), // dim(6)
            ]
            
        case .sixthSus:
            return [
                ChordSymbol(.six, sus: .sus), // 6sus
                ChordSymbol(.major6, sus: .sus), // M6sus
            ]
        case .sixthSusSharp5:
            return [
                ChordSymbol(.six, sus: .sus, additions: [.sharp5]), // 6sus(#5)
                ChordSymbol(.major6, sus: .sus, additions: [.sharp5]), // M6sus(#5)
                ChordSymbol(.major, sus: .sus, additions: [.sharp5, .six]), // Msus(#5 6)
            ]
        case .sixthSusFlat5:
            return [
                ChordSymbol(.six, sus: .sus, additions: [.flat5]), // 6sus(b5)
                ChordSymbol(.major6, sus: .sus, additions: [.flat5]), // M6sus(b5)
                ChordSymbol(.major, sus: .sus, additions: [.flat5, .six]), // Msus(b5 6)
            ]

        // 六和弦挂留2
        case .sixthMajorSus2:
            return [
                ChordSymbol(.six, sus: .sus2), // 6sus2
                ChordSymbol(.major6, sus: .sus2), // M6sus2
            ]
        case .sixthMajorSus2Sharp5:
            return [
                ChordSymbol(.six, sus: .sus2, additions: [.sharp5]), // 6sus2(#5)
                ChordSymbol(.major6, sus: .sus2, additions: [.sharp5]), // M6sus2(#5)
                ChordSymbol(.major, sus: .sus2, additions: [.sharp5, .six]), // Msus2(#5 6)
            ]
        case .sixthMajorSus2Flat5:
            return [
                ChordSymbol(.six, sus: .sus2, additions: [.flat5]), // 6sus2(b5)
                ChordSymbol(.major6, sus: .sus2, additions: [.flat5]), // M6sus2(b5)
                ChordSymbol(.major, sus: .sus2, additions: [.flat5, .six]), // M6sus2(b5)
            ]

        // 六和弦挂留4
        case .sixthMajorSus4:
            return [
                ChordSymbol(.six, sus: .sus4), // 6sus4
                ChordSymbol(.major6, sus: .sus4), // M6sus4
            ]
        case .sixthMajorSus4Sharp5:
            return [
                ChordSymbol(.six, sus: .sus4, additions: [.sharp5]), // 6sus4(#5)
                ChordSymbol(.major6, sus: .sus4, additions: [.sharp5]), // M6sus4(#5)
                ChordSymbol(.major, sus: .sus4, additions: [.sharp5, .six]), // Msus4(#5 6)
            ]
        case .sixthMajorSus4Flat5:
            return [
                ChordSymbol(.six, sus: .sus4, additions: [.flat5]), // 6sus4(b5)
                ChordSymbol(.major6, sus: .sus4, additions: [.flat5]), // M6sus4(b5)
                ChordSymbol(.major, sus: .sus4, additions: [.flat5, .six]), // M6sus4(b5)
            ]
        }
    }

    public var intervals: Set<Interval> {
        switch self {
        // 三和弦
        case .traidMajor: return [.M3, .P5]
        case .traidAugmented: return [.M3, .A5]
        case .traidMajorFlat5: return [.M3, .d5]

        case .traidMinor: return [.m3, .P5]
        case .traidMinorSharp5: return [.m3, .A5]
        case .traidDiminished: return [.m3, .d5]
            
        case .traidSus: return [.P5]
        case .traidSusAugmented: return [.A5]
        case .traidSusFlat5: return [.d5]

        // 三和弦挂留
        case .traidSus2: return [.M2, .P5]
        case .traidSus2Flat5: return [.M2, .d5]
        case .traidSus2Sharp5: return [.M2, .A5]

        case .traidSus4: return [.P4, .P5]
        case .traidSus4Flat5: return [.P4, .d5]
        case .traidSus4Sharp5: return [.P4, .A5]

        // 七和弦
        case .sevnethMajor: return [.M3, .P5, .M7]
        case .sevnethMinor: return [.m3, .P5, .m7]
        case .sevnethDominant: return [.M3, .P5, .m7]
        case .sevnethHalfDiminished: return [.m3, .d5, .m7]
        case .sevnethDiminished: return [.m3, .d5, .d7]
        case .sevnethMajorFlat5: return [.M3, .d5, .M7]
        case .sevnethMinorMajor: return [.m3, .P5, .M7]
        case .sevnethMajorDoubleFlat7: return [.M3, .P5, .d7]
        case .sevnethDominantFlat5: return [.M3, .d5, .m7]
        case .sevnethMajorFlat5DoubleFlat7: return [.M3, .d5, .d7]
        case .sevnethMajorSharp5: return [.M3, .A5, .M7]
        case .sevnethDominantSharp5: return [.M3, .A5, .m7]
        case .sevnethMajorSharp5DoubleFlat7: return [.M3, .A5, .d7]
        case .sevnethMinorDoubleFlat7: return [.m3, .P5, .d7]
        case .sevnethMinorMajorFlat5: return [.m3, .d5, .M7]
        case .sevnethMinorMajorSharp5: return [.m3, .A5, .M7]
        case .sevnethMinorSharp5: return [.m3, .A5, .m7]
        case .sevnethMinorSharp5DoubleFlat7: return [.m3, .A5, .d7]
            
        case .seventhSus: return [.P5, .M7]
        case .seventhDominantSus: return [.P5, .m7]
        case .seventhDoubleFlatSus: return [.P5, .d7]
        case .seventhMajorSusFlat5: return [.d5, .M7]
        case .seventhDominantSusFlat5: return [.d5, .m7]
        case .seventhDoubleFlatSusFlat5: return [.d5, .d7]
        case .seventhMajorSusSharp5: return [.A5, .M7]
        case .seventhDominantSusSharp5: return [.A5, .m7]
        case .seventhDoubleFlatSusSharp5: return [.A5, .d7]

        // 七和弦挂留
        case .seventhSus2Major: return [.M2, .P5, .M7]
        case .seventhDominantSus2: return [.M2, .P5, .m7]
        case .seventhDoubleFlatSus2: return [.M2, .P5, .d7]
        case .seventhMajorSus2Flat5: return [.M2, .d5, .M7]
        case .seventhDominantSus2Flat5: return [.M2, .d5, .m7]
        case .seventhDoubleFlatSus2Flat5: return [.M2, .d5, .d7]
        case .seventhMajorSus2Sharp5: return [.M2, .A5, .M7]
        case .seventhDominantSus2Sharp5: return [.M2, .A5, .m7]
        case .seventhDoubleFlatSus2Sharp5: return [.M2, .A5, .d7]

        case .seventhSus4Major: return [.P4, .P5, .M7]
        case .seventhDominantSus4: return [.P4, .P5, .m7]
        case .seventhDoubleFlatSus4: return [.P4, .P5, .d7]
        case .seventhMajorSus4Flat5: return [.P4, .d5, .M7]
        case .seventhDominantSus4Flat5: return [.P4, .d5, .m7]
        case .seventhDoubleFlatSus4Flat5: return [.P4, .d5, .d7]
        case .seventhMajorSus4Sharp5: return [.P4, .A5, .M7]
        case .seventhDominantSus4Sharp5: return [.P4, .A5, .m7]
        case .seventhDoubleFlatSus4Sharp5: return [.P4, .A5, .d7]

        // 六和弦
        case .sixthMajor: return [.M3, .P5, .M6]
        case .sixthAugmented: return [.M3, .A5, .M6]
        case .sixthMajorFlat5: return [.M3, .d5, .M6]
        case .sixthMinor: return [.m3, .P5, .M6]
        case .sixthMinorSharp5: return [.m3, .A5, .M6]
        case .sixthDiminished: return [.m3, .d5, .M6]
            
        case .sixthSus: return [.P5, .M6]
        case .sixthSusSharp5: return [.A5, .M6]
        case .sixthSusFlat5: return [.d5, .M6]

        // 六和弦挂留
        case .sixthMajorSus2: return [.M2, .P5, .M6]
        case .sixthMajorSus2Sharp5: return [.M2, .A5, .M6]
        case .sixthMajorSus2Flat5: return [.M2, .d5, .M6]

        case .sixthMajorSus4: return [.P4, .P5, .M6]
        case .sixthMajorSus4Sharp5: return [.P4, .A5, .M6]
        case .sixthMajorSus4Flat5: return [.P4, .d5, .M6]

        }
    }

}
