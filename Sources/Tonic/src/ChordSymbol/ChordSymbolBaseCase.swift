//
//  ChordSymbolBaseCase.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public enum ChordSymbolBaseCase: String, CaseIterable {

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
    case sevnethMajor_Flat5
    case sevnethMinorMajor
    case sevnethMajor_DoubleFlat7
    case sevnethDominant_Flat5
    case sevnethMajor_Flat5_DoubleFlat7
    case sevnethMajor_Sharp5
    case sevnethDominant_Sharp5
    case sevnethMajor_Sharp5_DoubleFlat7
    case sevnethMinor_DoubleFlat7
    case sevnethMinorMajor_Flat5
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

    public var chordSymbols: [ChordSymbol]? {
        switch self {
            
        // 三和弦
        case .traidMajor:
            return [
                ChordSymbol(),
                ChordSymbol(main: .major),
            ]
        case .traidAugmented:
            return [
                ChordSymbol(main: .aug)
            ]
        case .traidMajor_Flat5:
            return [
                ChordSymbol(main: .major, addition: [.fiveFlat])
            ]

        case .traidMinor:
            return [
                ChordSymbol(main: .minor)
            ]
        case .traidMinor_Sharp5:
            return [
                ChordSymbol(main: .minor, addition: [.fiveSharp]),
                ChordSymbol(main: .minorAugmented)
            ]
        case .traidDiminished:
            return [
                ChordSymbol(main: .diminished)
            ]

        // 三和弦挂留 sus2
        case .traidSus2:
            return [
                ChordSymbol(sus: .sus2)
            ]
        case .traidSus2_Flat5:
            return [
                ChordSymbol(sus: .sus2, addition: [.fiveFlat])
            ]
        case .traidSus2_Sharp5:
            return [
                ChordSymbol(sus: .sus2, addition: [.fiveSharp])
            ]
            
        // 三和弦挂留 sus4
        case .traidSus4:
            return [
                ChordSymbol(sus: .sus4),
                ChordSymbol(sus: .sus)
            ]
        case .traidSus4_Flat5:
            return [
                ChordSymbol(sus: .sus4, addition: [.fiveFlat]),
                ChordSymbol(sus: .sus, addition: [.fiveFlat])
            ]
        case .traidSus4_Sharp5:
            return [
                ChordSymbol(sus: .sus4, addition: [.fiveSharp]),
                ChordSymbol(sus: .sus, addition: [.fiveSharp])
            ]

        // 七和弦
        case .sevnethMajor:
            return [
                ChordSymbol(main: .majorSeven)
            ]
        case .sevnethMinor:
            return [
                ChordSymbol(main: .minorSeven)
            ]
        case .sevnethDominant:
            return [
                ChordSymbol(main: .dominent)
            ]
        case .sevnethHalfDiminished:
            // 争议表示，是认定 半减七和弦为一个Symbol 还是 一个Symbol组合
            return [
                ChordSymbol(main: .halfDiminished),
                ChordSymbol(main: .minorSeven, addition: [.fiveFlat]),
            ]
        case .sevnethDiminished:
            return [
                ChordSymbol(main: .diminishedSeven)
            ]
        case .sevnethMajor_Flat5:
            return [
                ChordSymbol(main: .majorSeven, addition: [.fiveFlat])
            ]
        case .sevnethMinorMajor:
            return [
                ChordSymbol(main: .minorMajor)
            ]
        case .sevnethMajor_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .major_DoubleFlat7),
                ChordSymbol(main: .major, addition: [.doubleFlat7]),
            ]
        case .sevnethDominant_Flat5:
            return [
                ChordSymbol(main: .dominent, addition: [.fiveFlat])
            ]
        case .sevnethMajor_Flat5_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .major_DoubleFlat7, addition: [.fiveFlat]),
                ChordSymbol(main: .major, addition: [.fiveFlat, .doubleFlat7]),
            ]
        case .sevnethMajor_Sharp5:
            return [
                ChordSymbol(main: .majorSeven, addition: [.fiveSharp])
            ]
        case .sevnethDominant_Sharp5:
            return [
                ChordSymbol(main: .dominent, addition: [.fiveSharp])
            ]
        case .sevnethMajor_Sharp5_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .major_DoubleFlat7, addition: [.fiveSharp]),
                ChordSymbol(main: .major, addition: [.fiveSharp, .doubleFlat7]),
            ]
        case .sevnethMinor_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .minor_DoubleFlat7),
                ChordSymbol(main: .minor, addition: [.doubleFlat7]),
            ]
        case .sevnethMinorMajor_Flat5:
            return [
                ChordSymbol(main: .minorMajor, addition: [.fiveFlat])
            ]
        case .sevnethMinorMajor_Sharp5:
            return [
                ChordSymbol(main: .minorMajor, addition: [.fiveSharp])
            ]
        case .sevnethMinor_Sharp5:
            return [
                ChordSymbol(main: .minorSeven, addition: [.fiveSharp])
            ]
        case .sevnethMinor_Sharp5_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .minor_DoubleFlat7, addition: [.fiveSharp]),
                ChordSymbol(main: .minor, addition: [.fiveSharp, .doubleFlat7]),
            ]

        // 七和弦挂留 sus2
        case .seventhSus2Major:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus2)
            ]
        case .seventhSus2Dominant:
            return [
                ChordSymbol(main: .dominent, sus: .sus2)
            ]
        case .seventhSus2_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .sevenFlatDouble, sus: .sus2),
                ChordSymbol(sus: .sus2, addition: [.doubleFlat7]),
            ]
        case .seventhSus2Major_Flat5:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus2, addition: [.fiveFlat])
            ]
        case .seventhSus2Dominant_Flat5:
            return [
                ChordSymbol(main: .dominent, sus: .sus2, addition: [.fiveFlat])
            ]
        case .seventhSus2FiveFlat_DoubleFlatSeven:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .sevenFlatDouble, sus: .sus2, addition: [.fiveFlat]),
                ChordSymbol(sus: .sus2, addition: [.fiveFlat, .doubleFlat7]),
            ]
        case .seventhSus2Major_Sharp5:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus2, addition: [.fiveSharp])
            ]
        case .seventhSus2Dominant_Sharp5:
            return [
                ChordSymbol(main: .dominent, sus: .sus2, addition: [.fiveSharp])
            ]
        case .seventhSus2_Sharp5_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .sevenFlatDouble, sus: .sus2, addition: [.fiveSharp]),
                ChordSymbol(sus: .sus2, addition: [.fiveSharp, .doubleFlat7]),
            ]

        // 七和弦挂留 sus4
        case .seventhSus4Major:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus4),
                ChordSymbol(main: .majorSeven, sus: .sus)
            ]
        case .seventhSus4Dominant:
            return [
                ChordSymbol(main: .dominent, sus: .sus4),
                ChordSymbol(main: .dominent, sus: .sus)
            ]
        case .seventhSus4_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .sevenFlatDouble, sus: .sus4),
                ChordSymbol(sus: .sus4, addition: [.doubleFlat7]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus),
                ChordSymbol(sus: .sus, addition: [.doubleFlat7]),
            ]
        case .seventhSus4Major_Flat5:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus4, addition: [.fiveFlat]),
                ChordSymbol(main: .majorSeven, sus: .sus, addition: [.fiveFlat])
            ]
        case .seventhSus4Dominant_Flat5:
            return [
                ChordSymbol(main: .dominent, sus: .sus4, addition: [.fiveFlat]),
                ChordSymbol(main: .dominent, sus: .sus, addition: [.fiveFlat])
            ]
        case .seventhSus4_Flat5_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .sevenFlatDouble, sus: .sus4, addition: [.fiveFlat]),
                ChordSymbol(sus: .sus4, addition: [.fiveFlat, .doubleFlat7]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus, addition: [.fiveFlat]),
                ChordSymbol(sus: .sus, addition: [.fiveFlat, .doubleFlat7]),
            ]
        case .seventhSus4Major_Sharp5:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus4, addition: [.fiveSharp]),
                ChordSymbol(main: .majorSeven, sus: .sus, addition: [.fiveSharp])
            ]
        case .seventhSus4Dominant_Sharp5:
            return [
                ChordSymbol(main: .dominent, sus: .sus4, addition: [.fiveSharp]),
                ChordSymbol(main: .dominent, sus: .sus, addition: [.fiveSharp])
            ]
        case .seventhSus4_Sharp5_DoubleFlat7:
            // 争议表示，是否要把 doubleFlat7 放到 addition外
            return [
                ChordSymbol(main: .sevenFlatDouble, sus: .sus4, addition: [.fiveSharp]),
                ChordSymbol(sus: .sus4, addition: [.fiveSharp, .doubleFlat7]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus, addition: [.fiveSharp]),
                ChordSymbol(sus: .sus, addition: [.fiveSharp, .doubleFlat7]),
            ]

        // 六和弦
        case .sixthMajor:
            return [
                ChordSymbol(main: .majorSix),
                ChordSymbol(main: ChordSymbolPartMain(keywords: [.major],
                                                      numberWithAcc: .six))
            ]
        case .sixthAugmented:  // 争议表示
            return [
                ChordSymbol(main: .augmentedSix),  // 增和弦加6音
                ChordSymbol(main: .majorSix, addition: [.fiveSharp]),  // 主六和弦加 #5
            ]
        case .sixthMajor_Flat5:
            return [
                ChordSymbol(main: .majorSix, addition: [.fiveFlat])
            ]
        case .sixthMinor:
            return [
                ChordSymbol(main: .minorSix)
            ]
        case .sixthMinor_Sharp5:
            return [
                ChordSymbol(main: .minorSix, addition: [.fiveSharp])
            ]
        case .sixthDiminished:
            return [
                ChordSymbol(main: .diminishedSix)
            ]

        // 六和弦挂留
        case .sixthSus2Major:
            return [
                ChordSymbol(main: .majorSix, sus: .sus2)
            ]
        case .sixthSus2Major_Sharp5:
            return [
                ChordSymbol(main: .majorSix, sus: .sus2, addition: [.fiveSharp])
            ]
        case .sixthSus2Major_Flat5:
            return [
                ChordSymbol(main: .majorSix, sus: .sus2, addition: [.fiveFlat])
            ]
        case .sixthSus4Major:
            return [
                ChordSymbol(main: .majorSix, sus: .sus4),
                ChordSymbol(main: .majorSix, sus: .sus)
            ]
        case .sixthSus4Major_Sharp5:
            return [
                ChordSymbol(main: .majorSix, sus: .sus4, addition: [.fiveSharp]),
                ChordSymbol(main: .majorSix, sus: .sus, addition: [.fiveSharp])
            ]
        case .sixthSus4Major_Flat5:
            return [
                ChordSymbol(main: .majorSix, sus: .sus4, addition: [.fiveFlat]),
                ChordSymbol(main: .majorSix, sus: .sus, addition: [.fiveFlat])
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
        case .sevnethMajor_Flat5: return [.M3, .d5, .M7]
        case .sevnethMinorMajor: return [.m3, .P5, .M7]
        case .sevnethMajor_DoubleFlat7: return [.M3, .P5, .d7]
        case .sevnethDominant_Flat5: return [.M3, .d5, .m7]
        case .sevnethMajor_Flat5_DoubleFlat7: return [.M3, .d5, .d7]
        case .sevnethMajor_Sharp5: return [.M3, .A5, .M7]
        case .sevnethDominant_Sharp5: return [.M3, .A5, .m7]
        case .sevnethMajor_Sharp5_DoubleFlat7: return [.M3, .A5, .d7]
        case .sevnethMinor_DoubleFlat7: return [.m3, .P5, .d7]
        case .sevnethMinorMajor_Flat5: return [.m3, .d5, .M7]
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
