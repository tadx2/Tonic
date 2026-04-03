//
//  ChordBasicCase.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public enum ChordBasicCase: String, CaseIterable {

    // 三和弦
    case triadMajor
    case triadAugmented
    case triadMajorFlat5

    case triadMinor
    case triadMinorSharp5
    case triadDiminished

    // 三和弦挂留
    // 三和弦挂留 Sus
    case triadSus
    case triadSusAugmented
    case triadSusFlat5

    // 三和弦挂留 Sus2
    case triadSus2
    case triadSus2Flat5
    case triadSus2Sharp5

    // 三和弦挂留 Sus4
    case triadSus4
    case triadSus4Flat5
    case triadSus4Sharp5

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

    public var symbolShells: [ChordSymbol] {
        switch self {
        // 三和弦
        case .triadMajor:
            return [
                ChordSymbol(),
                ChordSymbol(quality: .major),
            ]
        case .triadAugmented:
            return [
                ChordSymbol(quality: .augmented),
                ChordSymbol(quality: .majorSharp5),
                ChordSymbol(quality: .major, additions: [.sharp5]),
            ]
        case .triadMajorFlat5:
            return [
                ChordSymbol(quality: .majorFlat5),
                ChordSymbol(quality: .major, additions: [.flat5]),
            ]

        case .triadMinor:
            return [
                ChordSymbol(quality: .minor)
            ]
        case .triadMinorSharp5:
            return [
                ChordSymbol(quality: .minorSharp5),
                ChordSymbol(quality: .minor, additions: [.sharp5]),
                ChordSymbol(quality: .minorAugmented),
            ]
        case .triadDiminished:
            return [
                ChordSymbol(quality: .diminished),
                ChordSymbol(quality: .minor, additions: [.flat5]),
                ChordSymbol(quality: .minorFlat5),
            ]

        // 三和弦挂留 sus
        case .triadSus:
            return [
                ChordSymbol(sus: .sus)
            ]
        case .triadSusAugmented:
            return [
                ChordSymbol(sus: .sus, additions: [.sharp5]),
                ChordSymbol(quality: .augmented, sus: .sus),
            ]

        case .triadSusFlat5:
            return [
                ChordSymbol(sus: .sus, additions: [.flat5])
            ]

        // 三和弦挂留 sus2

        case .triadSus2:
            return [
                ChordSymbol(sus: .sus2)
            ]
        case .triadSus2Flat5:
            return [
                ChordSymbol(sus: .sus2, additions: [.flat5])
            ]
        case .triadSus2Sharp5:
            return [
                ChordSymbol(sus: .sus2, additions: [.sharp5])
            ]

        // 三和弦挂留 sus4
        case .triadSus4:
            return [
                ChordSymbol(sus: .sus4)
            ]
        case .triadSus4Flat5:
            return [
                ChordSymbol(sus: .sus4, additions: [.flat5])
            ]
        case .triadSus4Sharp5:
            return [
                ChordSymbol(sus: .sus4, additions: [.sharp5])
            ]

        // 七和弦
        case .sevnethMajor:
            return [
                ChordSymbol(quality: .major7),  // M7
                ChordSymbol(quality: .major, additions: [.seven]),  // M(7)
            ]
        case .sevnethMinorMajor:
            return [
                ChordSymbol(quality: .minorMajor),  // mM
                ChordSymbol(quality: .minorMajor7),  // mM7
            ]
        case .sevnethMajorFlat5:
            return [
                ChordSymbol(quality: .major7, additions: [.flat5]),  // M7(b5)
                ChordSymbol(quality: .majorFlat5, additions: [.seven]),  // Mb5(7)
            ]
        case .sevnethMinorMajorFlat5:
            return [
                ChordSymbol(quality: .minorMajor, additions: [.flat5]),
                ChordSymbol(quality: .minorMajor7, additions: [.flat5]),
                ChordSymbol(quality: .minorMajorFlat5, additions: [.seven]),
            ]
        case .sevnethMajorSharp5:
            return [
                ChordSymbol(quality: .major7, additions: [.sharp5]),  // M7(#5)
                ChordSymbol(quality: .augmented7),  // aug7
                ChordSymbol(quality: .augmented, additions: [.seven]),  // aug(7)
                ChordSymbol(quality: .majorSharp5, additions: [.seven]),  // M#5(7)
            ]

        case .sevnethMinorMajorSharp5:
            return [
                ChordSymbol(quality: .minorMajor, additions: [.sharp5]),  // mM(#5)
                ChordSymbol(quality: .minorMajorSharp5, additions: [.seven]),  // mM#5(7)
                ChordSymbol(quality: .minorMajor7, additions: [.sharp5]),  // mM7(#5)
            ]
        case .sevnethDominant:
            return [
                ChordSymbol(quality: .seven)  // 7
            ]
        case .sevnethMinor:
            return [
                ChordSymbol(quality: .minor7),  // m7
                ChordSymbol(quality: .minor, additions: [.seven]),  // m(7)
            ]
        case .sevnethDominantFlat5:
            return [
                ChordSymbol(quality: .seven, additions: [.flat5])  // 7(b5)
            ]
        case .sevnethHalfDiminished:
            return [
                ChordSymbol(quality: .halfDiminished),  // m7b5
                ChordSymbol(quality: .minor7, additions: [.flat5]),  // m7(b5)
            ]
        case .sevnethDominantSharp5:
            return [
                ChordSymbol(quality: .seven, additions: [.sharp5])  // 7(#5)
            ]
        case .sevnethMinorSharp5:
            return [
                ChordSymbol(quality: .minor7, additions: [.sharp5]),  // m7(#5)
                ChordSymbol(quality: .minorSharp5, additions: [.seven]),  // m#5(7)
            ]
        case .sevnethMajorDoubleFlat7:
            return [
                ChordSymbol(quality: .majorFlatFlat7),  // Mbb7
                ChordSymbol(quality: .major, additions: [.flatFlat7]),  // M(bb7)
            ]
        case .sevnethMinorDoubleFlat7:
            return [
                ChordSymbol(quality: .minorFlatFlat7),  // mbb7
                ChordSymbol(quality: .minor, additions: [.flatFlat7]),  // m(bb7)
            ]
        case .sevnethMajorFlat5DoubleFlat7:
            return [
                ChordSymbol(quality: .majorFlat5, additions: [.flatFlat7]),  // Mb5(bb7)
                ChordSymbol(quality: .majorFlatFlat7, additions: [.flat5]),  // Mbb7(b5)
                ChordSymbol(quality: .major, additions: [.flat5, .flatFlat7]),  // M(b5, bb7)
            ]
        case .sevnethDiminished:
            return [
                ChordSymbol(quality: .diminished7),
                ChordSymbol(quality: .diminished, additions: [.seven]),
            ]
        case .sevnethMajorSharp5DoubleFlat7:
            return [
                ChordSymbol(quality: .majorSharp5, additions: [.flatFlat7]),  // M#5(bb7)
                ChordSymbol(quality: .majorFlatFlat7, additions: [.sharp5]),  // Mbb7(#5)
                ChordSymbol(quality: .major, additions: [.sharp5, .flatFlat7]),  // M(#5 bb7)
            ]
        case .sevnethMinorSharp5DoubleFlat7:
            return [
                ChordSymbol(quality: .minorSharp5, additions: [.flatFlat7]),  // m#5(bb7)
                ChordSymbol(quality: .minorFlatFlat7, additions: [.sharp5]),  // mbb7(#5)
                ChordSymbol(quality: .minor, additions: [.sharp5, .flatFlat7]),  // m(#5 bb7)
            ]

        case .seventhSus:
            return [
                ChordSymbol(quality: .major7, sus: .sus),  // M7sus
                ChordSymbol(quality: .major, sus: .sus, additions: [.seven]),  // Msus(7)
            ]
        case .seventhDominantSus:
            return [
                ChordSymbol(quality: .seven, sus: .sus)  // 7sus
            ]
        case .seventhDoubleFlatSus:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus),  // bb7sus
                ChordSymbol(sus: .sus, additions: [.flatFlat7]),  // sus(bb7)
            ]
        case .seventhMajorSusFlat5:
            return [
                ChordSymbol(quality: .major7, sus: .sus, additions: [.flat5]),  // M7sus(b5)
                ChordSymbol(quality: .majorFlat5, sus: .sus, additions: [.seven]),  // Mb5sus(7)
            ]
        case .seventhDominantSusFlat5:
            return [
                ChordSymbol(quality: .seven, sus: .sus, additions: [.flat5])  // 7sus(b5)
            ]
        case .seventhDoubleFlatSusFlat5:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus, additions: [.flat5]),  // bb7sus(b5)
                ChordSymbol(sus: .sus, additions: [.flat5, .flatFlat7]),  // sus(b5 bb7)
                ChordSymbol(quality: .flat5, sus: .sus, additions: [.flatFlat7]),  // b5sus(bb7)
            ]
        case .seventhMajorSusSharp5:
            return [
                ChordSymbol(quality: .major7, sus: .sus, additions: [.sharp5]),  // M7sus(#5)
                ChordSymbol(quality: .majorSharp5, sus: .sus, additions: [.seven]),  // M#5sus(7)
            ]
        case .seventhDominantSusSharp5:
            return [
                ChordSymbol(quality: .seven, sus: .sus, additions: [.sharp5])  // 7sus(#5)
            ]
        case .seventhDoubleFlatSusSharp5:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus, additions: [.sharp5]),  // bb7sus(#5)
                ChordSymbol(sus: .sus, additions: [.sharp5, .flatFlat7]),  // sus(#5 bb7)
                ChordSymbol(quality: .sharp5, sus: .sus, additions: [.flatFlat7]),  // #5sus(bb7)
            ]

        // 七和弦挂留 sus2
        case .seventhSus2Major:
            return [
                ChordSymbol(quality: .major7, sus: .sus2),  // M7sus2
                ChordSymbol(quality: .major, sus: .sus2, additions: [.seven]),  // Msus2(7)
            ]
        case .seventhMajorSus2Flat5:
            return [
                ChordSymbol(quality: .major7, sus: .sus2, additions: [.flat5]),  // M7sus2(b5)
                ChordSymbol(quality: .majorFlat5, sus: .sus2, additions: [.seven]),  // Mb5sus2(7)
            ]
        case .seventhMajorSus2Sharp5:
            return [
                ChordSymbol(quality: .major7, sus: .sus2, additions: [.sharp5]),  // M7sus2(#5)
                ChordSymbol(quality: .majorSharp5, sus: .sus2, additions: [.seven]),  // M#5sus2(7)
            ]
        case .seventhDominantSus2:
            return [
                ChordSymbol(quality: .seven, sus: .sus2)  // 7sus2
            ]
        case .seventhDominantSus2Flat5:
            return [
                ChordSymbol(quality: .seven, sus: .sus2, additions: [.flat5])  // 7sus2(b5)
            ]
        case .seventhDominantSus2Sharp5:
            return [
                ChordSymbol(quality: .seven, sus: .sus2, additions: [.sharp5])  // 7sus2(#5)
            ]
        case .seventhDoubleFlatSus2:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus2),  // bb7sus2
                ChordSymbol(sus: .sus2, additions: [.flatFlat7]),  // sus2(bb7)
            ]
        case .seventhDoubleFlatSus2Flat5:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus2, additions: [.flat5]),  // bb7sus2(b5)
                ChordSymbol(sus: .sus2, additions: [.flat5, .flatFlat7]),  // sus2(b5 bb7)
                ChordSymbol(quality: .flat5, sus: .sus2, additions: [.flatFlat7]),  // b5sus2(bb7)
            ]
        case .seventhDoubleFlatSus2Sharp5:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus2, additions: [.sharp5]),  // bb7sus2(#5)
                ChordSymbol(sus: .sus2, additions: [.sharp5, .flatFlat7]),  // sus2(#5 bb7)
                ChordSymbol(quality: .sharp5, sus: .sus2, additions: [.flatFlat7]),  // #5sus2(bb7)
            ]

        // 七和弦挂留 sus4
        case .seventhSus4Major:
            return [
                ChordSymbol(quality: .major7, sus: .sus4),  // M7sus4
                ChordSymbol(quality: .major, sus: .sus4, additions: [.seven]),  // Msus4(7)
            ]
        case .seventhMajorSus4Flat5:
            return [
                ChordSymbol(quality: .major7, sus: .sus4, additions: [.flat5]),  // M7sus4(b5)
                ChordSymbol(quality: .majorFlat5, sus: .sus4, additions: [.seven]),  // Mb5sus4(7)
            ]
        case .seventhMajorSus4Sharp5:
            return [
                ChordSymbol(quality: .major7, sus: .sus4, additions: [.sharp5]),  // M7sus4(#5)
                ChordSymbol(quality: .majorSharp5, sus: .sus4, additions: [.seven]),  // M#5sus4(7)
            ]
        case .seventhDominantSus4:
            return [
                ChordSymbol(quality: .seven, sus: .sus4)  // 7sus4
            ]
        case .seventhDominantSus4Flat5:
            return [
                ChordSymbol(quality: .seven, sus: .sus4, additions: [.flat5])  // 7sus4(b5)
            ]
        case .seventhDominantSus4Sharp5:
            return [
                ChordSymbol(quality: .seven, sus: .sus4, additions: [.sharp5])  // 7sus4(#5)
            ]
        case .seventhDoubleFlatSus4:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus4),  // bb7sus4
                ChordSymbol(sus: .sus4, additions: [.flatFlat7]),  // sus4(bb7)
            ]
        case .seventhDoubleFlatSus4Flat5:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus4, additions: [.flat5]),  // bb7sus4(b5)
                ChordSymbol(sus: .sus4, additions: [.flat5, .flatFlat7]),  // sus4(b5 bb7)
                ChordSymbol(quality: .flat5, sus: .sus4, additions: [.flatFlat7]),  // b5sus4(bb7)
            ]
        case .seventhDoubleFlatSus4Sharp5:
            return [
                ChordSymbol(quality: .flatFlat7, sus: .sus4, additions: [.sharp5]),  // bb7sus4(#5)
                ChordSymbol(sus: .sus4, additions: [.sharp5, .flatFlat7]),  // sus4(#5 bb7)
                ChordSymbol(quality: .sharp5, sus: .sus4, additions: [.flatFlat7]),  // #5sus4(bb7)
            ]

        // 六和弦
        case .sixthMajor:
            return [
                ChordSymbol(quality: .six),  // 6
                ChordSymbol(quality: .major6),  // M6
                ChordSymbol(quality: .major, additions: [.six]),  // M(6)
            ]
        case .sixthAugmented:  // 争议表示
            return [
                ChordSymbol(quality: .augmented6),  // aug6
                ChordSymbol(quality: .six, additions: [.sharp5]),  // 6(#5)
                ChordSymbol(quality: .major6, additions: [.sharp5]),  // M6(#5)
                ChordSymbol(quality: .major, additions: [.sharp5, .six]),  // M(#5 6)
            ]
        case .sixthMajorFlat5:
            return [
                ChordSymbol(quality: .six, additions: [.flat5]),  // 6(b5)
                ChordSymbol(quality: .major6, additions: [.flat5]),  // M6(b5)
                ChordSymbol(quality: .major, additions: [.flat5, .six]),  // M(b5 6)
            ]
        case .sixthMinor:
            return [
                ChordSymbol(quality: .minor6),  // m6
                ChordSymbol(quality: .minor, additions: [.six]),  // m(6)
            ]
        case .sixthMinorSharp5:
            return [
                ChordSymbol(quality: .minor6, additions: [.sharp5]),  // m6(#5)
                ChordSymbol(quality: .minor, additions: [.sharp5, .six]),  // m(#5 6)
            ]
        case .sixthDiminished:
            return [
                ChordSymbol(quality: .diminished6),  // dim6
                ChordSymbol(quality: .diminished, additions: [.six]),  // dim(6)
            ]

        case .sixthSus:
            return [
                ChordSymbol(quality: .six, sus: .sus),  // 6sus
                ChordSymbol(quality: .major6, sus: .sus),  // M6sus
            ]
        case .sixthSusSharp5:
            return [
                ChordSymbol(quality: .six, sus: .sus, additions: [.sharp5]),  // 6sus(#5)
                ChordSymbol(quality: .major6, sus: .sus, additions: [.sharp5]),  // M6sus(#5)
                ChordSymbol(quality: .major, sus: .sus, additions: [.sharp5, .six]),  // Msus(#5 6)
            ]
        case .sixthSusFlat5:
            return [
                ChordSymbol(quality: .six, sus: .sus, additions: [.flat5]),  // 6sus(b5)
                ChordSymbol(quality: .major6, sus: .sus, additions: [.flat5]),  // M6sus(b5)
                ChordSymbol(quality: .major, sus: .sus, additions: [.flat5, .six]),  // Msus(b5 6)
            ]

        // 六和弦挂留2
        case .sixthMajorSus2:
            return [
                ChordSymbol(quality: .six, sus: .sus2),  // 6sus2
                ChordSymbol(quality: .major6, sus: .sus2),  // M6sus2
            ]
        case .sixthMajorSus2Sharp5:
            return [
                ChordSymbol(quality: .six, sus: .sus2, additions: [.sharp5]),  // 6sus2(#5)
                ChordSymbol(quality: .major6, sus: .sus2, additions: [.sharp5]),  // M6sus2(#5)
                ChordSymbol(quality: .major, sus: .sus2, additions: [.sharp5, .six]),  // Msus2(#5 6)
            ]
        case .sixthMajorSus2Flat5:
            return [
                ChordSymbol(quality: .six, sus: .sus2, additions: [.flat5]),  // 6sus2(b5)
                ChordSymbol(quality: .major6, sus: .sus2, additions: [.flat5]),  // M6sus2(b5)
                ChordSymbol(quality: .major, sus: .sus2, additions: [.flat5, .six]),  // M6sus2(b5)
            ]

        // 六和弦挂留4
        case .sixthMajorSus4:
            return [
                ChordSymbol(quality: .six, sus: .sus4),  // 6sus4
                ChordSymbol(quality: .major6, sus: .sus4),  // M6sus4
            ]
        case .sixthMajorSus4Sharp5:
            return [
                ChordSymbol(quality: .six, sus: .sus4, additions: [.sharp5]),  // 6sus4(#5)
                ChordSymbol(quality: .major6, sus: .sus4, additions: [.sharp5]),  // M6sus4(#5)
                ChordSymbol(quality: .major, sus: .sus4, additions: [.sharp5, .six]),  // Msus4(#5 6)
            ]
        case .sixthMajorSus4Flat5:
            return [
                ChordSymbol(quality: .six, sus: .sus4, additions: [.flat5]),  // 6sus4(b5)
                ChordSymbol(quality: .major6, sus: .sus4, additions: [.flat5]),  // M6sus4(b5)
                ChordSymbol(quality: .major, sus: .sus4, additions: [.flat5, .six]),  // M6sus4(b5)
            ]
        }
    }

    public var intervals: Set<Interval> {
        switch self {
        // 三和弦
        case .triadMajor: return [.M3, .P5]
        case .triadAugmented: return [.M3, .A5]
        case .triadMajorFlat5: return [.M3, .d5]

        case .triadMinor: return [.m3, .P5]
        case .triadMinorSharp5: return [.m3, .A5]
        case .triadDiminished: return [.m3, .d5]

        case .triadSus: return [.P5]
        case .triadSusAugmented: return [.A5]
        case .triadSusFlat5: return [.d5]

        // 三和弦挂留
        case .triadSus2: return [.M2, .P5]
        case .triadSus2Flat5: return [.M2, .d5]
        case .triadSus2Sharp5: return [.M2, .A5]

        case .triadSus4: return [.P4, .P5]
        case .triadSus4Flat5: return [.P4, .d5]
        case .triadSus4Sharp5: return [.P4, .A5]

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

public extension ChordBasicCase {
    
    enum Attribute {
        case triad, seventh, sixth
        case major, minor, sus, augmented, diminished, halfDiminished
        case flatFive, sharpFive, doubleFlatSeventh
    }
    
    var attributes: [Attribute] {
        switch self {
        case .triadMajor:
            [.triad, .major]
        case .triadAugmented:
            [.triad, .augmented]
        case .triadMajorFlat5:
            [.triad, .major, .flatFive]
        case .triadMinor:
            [.triad, .minor]
        case .triadMinorSharp5:
            [.triad, .minor, .sharpFive]
        case .triadDiminished:
            [.triad, .diminished]
        case .triadSus:
            [.triad, .sus]
        case .triadSusAugmented:
            [.triad, .sus, .augmented]
        case .triadSusFlat5:
            [.triad, .sus, .flatFive]
        case .triadSus2:
            [.triad, .sus]
        case .triadSus2Flat5:
            [.triad, .sus, .flatFive]
        case .triadSus2Sharp5:
            [.triad, .sus, .sharpFive]
        case .triadSus4:
            [.triad, .sus]
        case .triadSus4Flat5:
            [.triad, .sus, .flatFive]
        case .triadSus4Sharp5:
            [.triad, .sus, .sharpFive]
        case .sevnethMajor:
            [.seventh, .major]
        case .sevnethMinor:
            [.seventh, .minor]
        case .sevnethDominant:
            [.seventh]
        case .sevnethHalfDiminished:
            [.seventh, .halfDiminished]
        case .sevnethDiminished:
            [.seventh, .diminished, .doubleFlatSeventh]
        case .sevnethMajorFlat5:
            [.seventh, .major, .flatFive]
        case .sevnethMinorMajor:
            [.seventh, .minor, .major]
        case .sevnethMajorDoubleFlat7:
            [.seventh, .major, .doubleFlatSeventh]
        case .sevnethDominantFlat5:
            [.seventh, .flatFive]
        case .sevnethMajorFlat5DoubleFlat7:
            [.seventh, .major, .flatFive, .doubleFlatSeventh]
        case .sevnethMajorSharp5:
            [.seventh, .major, .sharpFive]
        case .sevnethDominantSharp5:
            [.seventh, .sharpFive]
        case .sevnethMajorSharp5DoubleFlat7:
            [.seventh, .major, .sharpFive, .doubleFlatSeventh]
        case .sevnethMinorDoubleFlat7:
            [.seventh, .minor, .doubleFlatSeventh]
        case .sevnethMinorMajorFlat5:
            [.seventh, .minor, .major, .flatFive]
        case .sevnethMinorMajorSharp5:
            [.seventh, .minor, .major, .sharpFive]
        case .sevnethMinorSharp5:
            [.seventh, .minor, .sharpFive]
        case .sevnethMinorSharp5DoubleFlat7:
            [.seventh, .minor, .sharpFive, .doubleFlatSeventh]
        case .seventhSus:
            [.seventh, .major, .sus]
        case .seventhDominantSus:
            [.seventh, .sus]
        case .seventhDoubleFlatSus:
            [.seventh, .sus, .doubleFlatSeventh]
        case .seventhMajorSusFlat5:
            [.seventh, .major, .sus, .flatFive]
        case .seventhDominantSusFlat5:
            [.seventh, .sus, .flatFive]
        case .seventhDoubleFlatSusFlat5:
            [.seventh, .sus, .flatFive, .doubleFlatSeventh]
        case .seventhMajorSusSharp5:
            [.seventh, .major, .sus, .sharpFive]
        case .seventhDominantSusSharp5:
            [.seventh, .sus, .sharpFive]
        case .seventhDoubleFlatSusSharp5:
            [.seventh, .sus, .sharpFive, .doubleFlatSeventh]
        case .seventhSus2Major:
            [.seventh, .major, .sus]
        case .seventhDominantSus2:
            [.seventh, .sus]
        case .seventhDoubleFlatSus2:
            [.seventh, .sus, .doubleFlatSeventh]
        case .seventhMajorSus2Flat5:
            [.seventh, .major, .sus, .flatFive]
        case .seventhDominantSus2Flat5:
            [.seventh, .sus, .flatFive]
        case .seventhDoubleFlatSus2Flat5:
            [.seventh, .sus, .flatFive, .doubleFlatSeventh]
        case .seventhMajorSus2Sharp5:
            [.seventh, .major, .sus, .sharpFive]
        case .seventhDominantSus2Sharp5:
            [.seventh, .sus, .sharpFive]
        case .seventhDoubleFlatSus2Sharp5:
            [.seventh, .sus, .sharpFive, .doubleFlatSeventh]
        case .seventhSus4Major:
            [.seventh, .major, .sus]
        case .seventhDominantSus4:
            [.seventh, .sus]
        case .seventhDoubleFlatSus4:
            [.seventh, .sus, .doubleFlatSeventh]
        case .seventhMajorSus4Flat5:
            [.seventh, .major, .sus, .flatFive]
        case .seventhDominantSus4Flat5:
            [.seventh, .sus, .flatFive]
        case .seventhDoubleFlatSus4Flat5:
            [.seventh, .sus, .flatFive, .doubleFlatSeventh]
        case .seventhMajorSus4Sharp5:
            [.seventh, .major, .sus, .sharpFive]
        case .seventhDominantSus4Sharp5:
            [.seventh, .sus, .sharpFive]
        case .seventhDoubleFlatSus4Sharp5:
            [.seventh, .sus, .sharpFive, .doubleFlatSeventh]
        case .sixthMajor:
            [.sixth, .major]
        case .sixthAugmented:
            [.sixth, .augmented]
        case .sixthMajorFlat5:
            [.sixth, .major, .flatFive]
        case .sixthMinor:
            [.sixth, .minor]
        case .sixthMinorSharp5:
            [.sixth, .minor, .sharpFive]
        case .sixthDiminished:
            [.sixth, .diminished]
        case .sixthSus:
            [.sixth, .sus]
        case .sixthSusSharp5:
            [.sixth, .sus, .sharpFive]
        case .sixthSusFlat5:
            [.sixth, .sus, .flatFive]
        case .sixthMajorSus2:
            [.sixth, .major, .sus]
        case .sixthMajorSus2Sharp5:
            [.sixth, .major, .sus, .sharpFive]
        case .sixthMajorSus2Flat5:
            [.sixth, .major, .sus, .flatFive]
        case .sixthMajorSus4:
            [.sixth, .major, .sus]
        case .sixthMajorSus4Sharp5:
            [.sixth, .major, .sus, .sharpFive]
        case .sixthMajorSus4Flat5:
            [.sixth, .major, .sus, .flatFive]
        }
    }
}
