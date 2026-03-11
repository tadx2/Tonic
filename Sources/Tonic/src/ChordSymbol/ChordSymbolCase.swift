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
    case traidMajor_Flat5

    case traidMinor
    case traidMinor_Sharp5
    case traidDiminished

    // 三和弦挂留
    case traidSus2
    case traidSus2_Flat5
    case traidSus2_Sharp5

    case traidSus4
    case traidSus4_Flat5
    case traidSus4_Sharp5

    // 七和弦
    case sevnethMajor
    case sevnethMinor
    case sevnethDominant
    case sevnethHalfDiminished
    case sevnethDiminished
    case sevnethMajorFlat5
    case sevnethMinorMajor
    case sevnethMajor_DoubleFlat7
    case sevnethDominant_Flat5
    case sevnethMajor_Flat5_DoubleFlat7
    case sevnethMajor_Sharp5
    case sevnethDominant_Sharp5
    case sevnethMajor_Sharp5_DoubleFlat7
    case sevnethMinor_DoubleFlat7
    case sevnethMinorMajorFlat5
    case sevnethMinorMajor_Sharp5
    case sevnethMinor_Sharp5
    case sevnethMinor_Sharp5_DoubleFlat7

    // 七和弦挂留
    case seventhSus2Major
    case seventhSus2Dominant
    case seventhSus2_DoubleFlat7
    case seventhSus2Major_Flat5
    case seventhSus2Dominant_Flat5
    case seventhSus2FiveFlat_DoubleFlatSeven
    case seventhSus2Major_Sharp5
    case seventhSus2Dominant_Sharp5
    case seventhSus2_Sharp5_DoubleFlat7

    case seventhSus4Major
    case seventhSus4Dominant
    case seventhSus4_DoubleFlat7
    case seventhSus4Major_Flat5
    case seventhSus4Dominant_Flat5
    case seventhSus4_Flat5_DoubleFlat7
    case seventhSus4Major_Sharp5
    case seventhSus4Dominant_Sharp5
    case seventhSus4_Sharp5_DoubleFlat7

    // 六和弦
    case sixthMajor
    case sixthAugmented
    case sixthMajor_Flat5
    case sixthMinor
    case sixthMinor_Sharp5
    case sixthDiminished

    // 六和弦挂留
    case sixthSus2Major
    case sixthSus2Major_Sharp5
    case sixthSus2Major_Flat5

    case sixthSus4Major
    case sixthSus4Major_Sharp5
    case sixthSus4Major_Flat5

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
                ChordSymbol(.majorFiveSharp),
                ChordSymbol(.major, additions: [.fiveSharp]),
            ]
        case .traidMajor_Flat5:
            return [
                ChordSymbol(.majorFiveFlat),
                ChordSymbol(.major, additions: [.fiveFlat]),
            ]

        case .traidMinor:
            return [
                ChordSymbol(.minor)
            ]
        case .traidMinor_Sharp5:
            return [
                ChordSymbol(.minorFiveSharp),
                ChordSymbol(.minor, additions: [.fiveSharp]),
                ChordSymbol(.minorAugmented),
            ]
        case .traidDiminished:
            return [
                ChordSymbol(.diminished),
                ChordSymbol(.minor, additions: [.fiveFlat]),
            ]

        // 三和弦挂留 sus2
        case .traidSus2:
            return [
                ChordSymbol(sus: .sus2)
            ]
        case .traidSus2_Flat5:
            return [
                ChordSymbol(sus: .sus2, additions: [.fiveFlat])
            ]
        case .traidSus2_Sharp5:
            return [
                ChordSymbol(sus: .sus2, additions: [.fiveSharp])
            ]

        // 三和弦挂留 sus4
        case .traidSus4:
            return [
                ChordSymbol(sus: .sus4),
                ChordSymbol(sus: .sus),
            ]
        case .traidSus4_Flat5:
            return [
                ChordSymbol(sus: .sus4, additions: [.fiveFlat]),
                ChordSymbol(sus: .sus, additions: [.fiveFlat]),
            ]
        case .traidSus4_Sharp5:
            return [
                ChordSymbol(sus: .sus4, additions: [.fiveSharp]),
                ChordSymbol(sus: .sus, additions: [.fiveSharp]),
            ]

        // 七和弦
        case .sevnethMajor:
            return [
                ChordSymbol(.majorSeven), // M7
                ChordSymbol(.major, additions: [.seven]) // M(7)
            ]
        case .sevnethMinorMajor:
            return [
                ChordSymbol(.minorMajor), // mM
                ChordSymbol(.minorMajorSeven), // mM7
            ]
        case .sevnethMajorFlat5:
            return [
                ChordSymbol(.majorSeven, additions: [.fiveFlat]), // M7(b5)
                ChordSymbol(.majorFiveFlat, additions: [.seven]) // Mb5(7)
            ]
            
        case .sevnethMinorMajorFlat5:
            return [
                ChordSymbol(.minorMajor, additions: [.fiveFlat]),
                ChordSymbol(.minorMajorSeven, additions: [.fiveFlat]),
                ChordSymbol(.minorMajorFiveFlat, additions: [.seven]),
            ]
            
        case .sevnethMajor_Sharp5:
            return [
                ChordSymbol(.majorSeven, additions: [.fiveSharp]),
                ChordSymbol(.majorFiveSharp, additions: [.seven])
            ]
            
        case .sevnethMinorMajor_Sharp5:
            return [
                ChordSymbol(.minorMajor, additions: [.fiveSharp]),
                ChordSymbol(.minorMajorFiveSharp, additions: [.seven]),
                ChordSymbol(.minorMajorSeven, additions: [.fiveSharp]),
            ]
        case .sevnethDominant:
            return [
                ChordSymbol(.seven),
            ]
        case .sevnethMinor:
            return [
                ChordSymbol(.minorSeven),
                ChordSymbol(.minor, additions: [.seven])
            ]
        case .sevnethDominant_Flat5:
            return [
                ChordSymbol(.seven, additions: [.fiveFlat])
            ]
        case .sevnethHalfDiminished:
            return [
                ChordSymbol(.minorSeven, additions: [.fiveFlat]),
            ]
            
        case .sevnethDominant_Sharp5:
            return [
                ChordSymbol(.seven, additions: [.fiveSharp]),
            ]
        case .sevnethMinor_Sharp5:
            return [
                ChordSymbol(.minorSeven, additions: [.fiveSharp]),
                ChordSymbol(.minorFiveSharp, additions: [.seven])
            ]
        case .sevnethMajor_DoubleFlat7:
            return [
                ChordSymbol(.majorSevenFlatDouble),
                ChordSymbol(.major, additions: [.sevenFlatDouble]),
            ]
        case .sevnethMinor_DoubleFlat7:
            return [
                ChordSymbol(.minorSevenFlatDouble),
                ChordSymbol(.minor, additions: [.sevenFlatDouble]),
            ]
        case .sevnethMajor_Flat5_DoubleFlat7:
            return [
                ChordSymbol(.majorFiveFlat, additions: [.sevenFlatDouble]),
                ChordSymbol(.majorSevenFlatDouble, additions: [.fiveFlat]),
                ChordSymbol(.major, additions: [.fiveFlat, .sevenFlatDouble]),
            ]
        case .sevnethDiminished:
            return [
                ChordSymbol(.diminishedSeven),
            ]
        

        case .sevnethMajor_Sharp5_DoubleFlat7:
            return [
                ChordSymbol(.majorFiveSharp, additions: [.sevenFlatDouble]),
                ChordSymbol(.majorSevenFlatDouble, additions: [.fiveSharp]),
                ChordSymbol(.major, additions: [.fiveSharp, .sevenFlatDouble]),
            ]
        
        case .sevnethMinor_Sharp5_DoubleFlat7:
            return [
                ChordSymbol(.minorFiveSharp, additions: [.sevenFlatDouble]),
                ChordSymbol(.minorSevenFlatDouble, additions: [.fiveSharp]),
                ChordSymbol(.minor, additions: [.fiveSharp, .sevenFlatDouble]),
            ]

        // 七和弦挂留 sus2
        case .seventhSus2Major:
            return [
                ChordSymbol(.majorSeven, sus: .sus2),
                ChordSymbol(.major, sus: .sus2, additions: [.seven])
            ]
        case .seventhSus2Major_Flat5:
            return [
                ChordSymbol(.majorSeven, sus: .sus2, additions: [.fiveFlat]),
                ChordSymbol(.majorFiveFlat, sus: .sus2, additions: [.seven])
            ]
        case .seventhSus2Major_Sharp5:
            return [
                ChordSymbol(.majorSeven, sus: .sus2, additions: [.fiveSharp]),
                ChordSymbol(.majorFiveSharp, sus: .sus2, additions: [.seven])
            ]
        case .seventhSus2Dominant:
            return [
                ChordSymbol(.seven, sus: .sus2),
            ]
        case .seventhSus2Dominant_Flat5:
            return [
                ChordSymbol(.seven, sus: .sus2, additions: [.fiveFlat])
            ]
        case .seventhSus2Dominant_Sharp5:
            return [
                ChordSymbol(.seven, sus: .sus2, additions: [.fiveSharp])
            ]
        case .seventhSus2_DoubleFlat7:
            return [
                ChordSymbol(.sevenFlatDouble, sus: .sus2),
                ChordSymbol(sus: .sus2, additions: [.sevenFlatDouble]),
            ]
        case .seventhSus2FiveFlat_DoubleFlatSeven:
            return [
                ChordSymbol(.sevenFlatDouble, sus: .sus2, additions: [.fiveFlat]),
                ChordSymbol(sus: .sus2, additions: [.fiveFlat, .sevenFlatDouble]),
                ChordSymbol(.fiveFlat, sus: .sus2, additions: [.sevenFlatDouble]),
            ]
        case .seventhSus2_Sharp5_DoubleFlat7:
            return [
                ChordSymbol(.sevenFlatDouble, sus: .sus2, additions: [.fiveSharp]),
                ChordSymbol(sus: .sus2, additions: [.fiveSharp, .sevenFlatDouble]),
                ChordSymbol(.fiveSharp, sus: .sus2, additions: [.sevenFlatDouble]),
            ]

        // 七和弦挂留 sus4
        case .seventhSus4Major:
            return [
                ChordSymbol(.majorSeven, sus: .sus4),
                ChordSymbol(.majorSeven, sus: .sus),
                ChordSymbol(.major, sus: .sus4, additions: [.seven]),
                ChordSymbol(.major, sus: .sus, additions: [.seven]),
            ]
        case .seventhSus4Major_Flat5:
            return [
                ChordSymbol(.majorSeven, sus: .sus4, additions: [.fiveFlat]),
                ChordSymbol(.majorSeven, sus: .sus, additions: [.fiveFlat]),
                ChordSymbol(.majorFiveFlat, sus: .sus4, additions: [.seven]),
                ChordSymbol(.majorFiveFlat, sus: .sus, additions: [.seven]),
            ]
        case .seventhSus4Major_Sharp5:
            return [
                ChordSymbol(.majorSeven, sus: .sus4, additions: [.fiveSharp]),
                ChordSymbol(.majorSeven, sus: .sus, additions: [.fiveSharp]),
                ChordSymbol(.majorFiveSharp, sus: .sus4, additions: [.seven]),
                ChordSymbol(.majorFiveSharp, sus: .sus, additions: [.seven]),
            ]
        case .seventhSus4Dominant:
            return [
                ChordSymbol(.seven, sus: .sus4),
                ChordSymbol(.seven, sus: .sus),
            ]
        case .seventhSus4Dominant_Flat5:
            return [
                ChordSymbol(.seven, sus: .sus4, additions: [.fiveFlat]),
                ChordSymbol(.seven, sus: .sus, additions: [.fiveFlat]),
            ]
        case .seventhSus4Dominant_Sharp5:
            return [
                ChordSymbol(.seven, sus: .sus4, additions: [.fiveSharp]),
                ChordSymbol(.seven, sus: .sus, additions: [.fiveSharp]),
            ]
        case .seventhSus4_DoubleFlat7:
            return [
                ChordSymbol(.sevenFlatDouble, sus: .sus4),
                ChordSymbol(sus: .sus4, additions: [.sevenFlatDouble]),
                ChordSymbol(.sevenFlatDouble, sus: .sus),
                ChordSymbol(sus: .sus, additions: [.sevenFlatDouble]),
            ]

        case .seventhSus4_Flat5_DoubleFlat7:
            return [
                ChordSymbol(.sevenFlatDouble, sus: .sus4, additions: [.fiveFlat]),
                ChordSymbol(.fiveFlat, sus: .sus4, additions: [.sevenFlatDouble]),
                ChordSymbol(sus: .sus4, additions: [.fiveFlat, .sevenFlatDouble]),
                ChordSymbol(.sevenFlatDouble, sus: .sus, additions: [.fiveFlat]),
                ChordSymbol(.fiveFlat, sus: .sus, additions: [.sevenFlatDouble]),
                ChordSymbol(sus: .sus, additions: [.fiveFlat, .sevenFlatDouble]),
            ]
        
        case .seventhSus4_Sharp5_DoubleFlat7:
            return [
                ChordSymbol(.sevenFlatDouble, sus: .sus4, additions: [.fiveSharp]),
                ChordSymbol(.fiveSharp, sus: .sus4, additions: [.sevenFlatDouble]),
                ChordSymbol(sus: .sus4, additions: [.fiveSharp, .sevenFlatDouble]),
                ChordSymbol(.sevenFlatDouble, sus: .sus, additions: [.fiveSharp]),
                ChordSymbol(.fiveSharp, sus: .sus, additions: [.sevenFlatDouble]),
                ChordSymbol(sus: .sus, additions: [.fiveSharp, .sevenFlatDouble]),
            ]
            
            

        // 六和弦
        case .sixthMajor:
            return [
                ChordSymbol(.six),
                ChordSymbol(.majorSix),
            ]
        case .sixthAugmented:  // 争议表示
            return [
                ChordSymbol(.augmentedSix),  // 增和弦加6音
                ChordSymbol(.six, additions: [.fiveSharp]),
                ChordSymbol(.majorSix, additions: [.fiveSharp]),  // 主六和弦加 #5
            ]
        case .sixthMajor_Flat5:
            return [
                ChordSymbol(.six, additions: [.fiveFlat]),
                ChordSymbol(.majorSix, additions: [.fiveFlat]),
            ]
        case .sixthMinor:
            return [
                ChordSymbol(.minorSix)
            ]
        case .sixthMinor_Sharp5:
            return [
                ChordSymbol(.minorSix, additions: [.fiveSharp])
            ]
        case .sixthDiminished:
            return [
                ChordSymbol(.diminishedSix)
            ]

        // 六和弦挂留2
        case .sixthSus2Major:
            return [
                ChordSymbol(.six, sus: .sus2),
                ChordSymbol(.majorSix, sus: .sus2),
            ]
        case .sixthSus2Major_Sharp5:
            return [
                ChordSymbol(.six, sus: .sus2, additions: [.fiveSharp]),
                ChordSymbol(.majorSix, sus: .sus2, additions: [.fiveSharp]),
            ]
        case .sixthSus2Major_Flat5:
            return [
                ChordSymbol(.six, sus: .sus2, additions: [.fiveFlat]),
                ChordSymbol(.majorSix, sus: .sus2, additions: [.fiveFlat]),
            ]
            
        // 六和弦挂留4
        case .sixthSus4Major:
            return [
                ChordSymbol(.six, sus: .sus4),
                ChordSymbol(.six, sus: .sus),
                ChordSymbol(.majorSix, sus: .sus4),
                ChordSymbol(.majorSix, sus: .sus),
            ]
        case .sixthSus4Major_Sharp5:
            return [
                ChordSymbol(.six, sus: .sus4, additions: [.fiveSharp]),
                ChordSymbol(.six, sus: .sus, additions: [.fiveSharp]),
                ChordSymbol(.majorSix, sus: .sus4, additions: [.fiveSharp]),
                ChordSymbol(.majorSix, sus: .sus, additions: [.fiveSharp]),
            ]
        case .sixthSus4Major_Flat5:
            return [
                ChordSymbol(.six, sus: .sus4, additions: [.fiveFlat]),
                ChordSymbol(.six, sus: .sus, additions: [.fiveFlat]),
                ChordSymbol(.majorSix, sus: .sus4, additions: [.fiveFlat]),
                ChordSymbol(.majorSix, sus: .sus, additions: [.fiveFlat]),
            ]

        }
    }

    public var intervals: Set<Interval> {
        switch self {
        // 三和弦
        case .traidMajor: return [.M3, .P5]
        case .traidAugmented: return [.M3, .A5]
        case .traidMajor_Flat5: return [.M3, .d5]

        case .traidMinor: return [.m3, .P5]
        case .traidMinor_Sharp5: return [.m3, .A5]
        case .traidDiminished: return [.m3, .d5]

        // 三和弦挂留
        case .traidSus2: return [.M2, .P5]
        case .traidSus2_Flat5: return [.M2, .d5]
        case .traidSus2_Sharp5: return [.M2, .A5]

        case .traidSus4: return [.P4, .P5]
        case .traidSus4_Flat5: return [.P4, .d5]
        case .traidSus4_Sharp5: return [.P4, .A5]

        // 七和弦
        case .sevnethMajor: return [.M3, .P5, .M7]
        case .sevnethMinor: return [.m3, .P5, .m7]
        case .sevnethDominant: return [.M3, .P5, .m7]
        case .sevnethHalfDiminished: return [.m3, .d5, .m7]
        case .sevnethDiminished: return [.m3, .d5, .d7]
        case .sevnethMajorFlat5: return [.M3, .d5, .M7]
        case .sevnethMinorMajor: return [.m3, .P5, .M7]
        case .sevnethMajor_DoubleFlat7: return [.M3, .P5, .d7]
        case .sevnethDominant_Flat5: return [.M3, .d5, .m7]
        case .sevnethMajor_Flat5_DoubleFlat7: return [.M3, .d5, .d7]
        case .sevnethMajor_Sharp5: return [.M3, .A5, .M7]
        case .sevnethDominant_Sharp5: return [.M3, .A5, .m7]
        case .sevnethMajor_Sharp5_DoubleFlat7: return [.M3, .A5, .d7]
        case .sevnethMinor_DoubleFlat7: return [.m3, .P5, .d7]
        case .sevnethMinorMajorFlat5: return [.m3, .d5, .M7]
        case .sevnethMinorMajor_Sharp5: return [.m3, .A5, .M7]
        case .sevnethMinor_Sharp5: return [.m3, .A5, .m7]
        case .sevnethMinor_Sharp5_DoubleFlat7: return [.m3, .A5, .d7]

        // 七和弦挂留
        case .seventhSus2Major: return [.M2, .P5, .M7]
        case .seventhSus2Dominant: return [.M2, .P5, .m7]
        case .seventhSus2_DoubleFlat7: return [.M2, .P5, .d7]
        case .seventhSus2Major_Flat5: return [.M2, .d5, .M7]
        case .seventhSus2Dominant_Flat5: return [.M2, .d5, .m7]
        case .seventhSus2FiveFlat_DoubleFlatSeven: return [.M2, .d5, .d7]
        case .seventhSus2Major_Sharp5: return [.M2, .A5, .M7]
        case .seventhSus2Dominant_Sharp5: return [.M2, .A5, .m7]
        case .seventhSus2_Sharp5_DoubleFlat7: return [.M2, .A5, .d7]

        case .seventhSus4Major: return [.P4, .P5, .M7]
        case .seventhSus4Dominant: return [.P4, .P5, .m7]
        case .seventhSus4_DoubleFlat7: return [.P4, .P5, .d7]
        case .seventhSus4Major_Flat5: return [.P4, .d5, .M7]
        case .seventhSus4Dominant_Flat5: return [.P4, .d5, .m7]
        case .seventhSus4_Flat5_DoubleFlat7: return [.P4, .d5, .d7]
        case .seventhSus4Major_Sharp5: return [.P4, .A5, .M7]
        case .seventhSus4Dominant_Sharp5: return [.P4, .A5, .m7]
        case .seventhSus4_Sharp5_DoubleFlat7: return [.P4, .A5, .d7]

        // 六和弦
        case .sixthMajor: return [.M3, .P5, .M6]
        case .sixthAugmented: return [.M3, .A5, .M6]
        case .sixthMajor_Flat5: return [.M3, .d5, .M6]
        case .sixthMinor: return [.m3, .P5, .M6]
        case .sixthMinor_Sharp5: return [.m3, .A5, .M6]
        case .sixthDiminished: return [.m3, .d5, .M6]

        // 六和弦挂留
        case .sixthSus2Major: return [.M2, .P5, .M6]
        case .sixthSus2Major_Sharp5: return [.M2, .A5, .M6]
        case .sixthSus2Major_Flat5: return [.M2, .d5, .M6]

        case .sixthSus4Major: return [.P4, .P5, .M6]
        case .sixthSus4Major_Sharp5: return [.P4, .A5, .M6]
        case .sixthSus4Major_Flat5: return [.P4, .d5, .M6]

        }
    }

}
