//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

/// 核心逻辑：
/// 1. 符号顺序 每个和弦有 1-2个 Symbol（符号顺序）(symbol 个数)
/// 2. 符号写法：每个顺序有1-3种 符号写法(PrintType)
/// 3. tensionMerge方式：如果有tension是否要与main中的7简写

import Foundation

public protocol ChordSymbolElement: Sendable {}

// 组成和弦名的基本单位
public enum ChordSymbolElementLetter: ChordSymbolElement {
    case A, B, C, D, E, F, G, X
}

public enum ChordSymbolElementlBasicCharacter: String, CaseIterable, ChordSymbolElement {
    case major, minor, augmented, diminished, halfDiminished
    case sus

    public var symbolStringStandard: String {
        switch self {
        case .major:
            return "M"
        case .minor:
            return "m"
        case .augmented:
            return "Aug"
        case .diminished:
            return "dim"
        case .halfDiminished:
            return "m7♭5"
        case .sus:
            return "sus"
        }
    }

    public var symbolStringGraph: String {
        switch self {
        case .major:
            return "△"
        case .minor:
            return "-"
        case .augmented:
            return "+"
        case .diminished:
            return "o"
        case .halfDiminished:
            return "ø"
        case .sus:
            return "sus"
        }
    }
}

public enum ChordSymbolElementAccidental: String, CaseIterable, ChordSymbolElement {
    case flat, sharp

    public var symbolString: String {
        switch self {
        case .flat:
            return "♭"
        case .sharp:
            return "♯"
        }
    }
}

public enum ChordSymbolElementNumber: Int, CaseIterable, ChordSymbolElement {
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case nine = 9
    case eleven = 11
    case thirteen = 13
    case sixNine = 69
}

// 组合
public struct ChordSymbolElementNumberWithAccidental: Sendable, Equatable, Hashable {

    var accidentals: [ChordSymbolElementAccidental]
    var number: ChordSymbolElementNumber

    public var symbolString: String {
        if accidentals == [.flat, .flat] {
            return "𝄫" + String(number.rawValue)
        } else if accidentals == [.sharp, .sharp] {
            return "𝄪" + String(number.rawValue)
        }

        return self.accidentals.map { $0.symbolString }.joined() + String(number.rawValue)
    }

}

extension ChordSymbolElementNumberWithAccidental {
    public static let two = ChordSymbolElementNumberWithAccidental(accidentals: [], number: .two)
    public static let four = ChordSymbolElementNumberWithAccidental(accidentals: [], number: .four)
    static let six = ChordSymbolElementNumberWithAccidental(accidentals: [], number: .six)

    // Five
    public static let five = ChordSymbolElementNumberWithAccidental(accidentals: [], number: .five)
    public static let fiveFlat = ChordSymbolElementNumberWithAccidental(
        accidentals: [.flat], number: .five)
    public static let fiveSharp = ChordSymbolElementNumberWithAccidental(
        accidentals: [.sharp], number: .five)

    // seven
    public static let seven = ChordSymbolElementNumberWithAccidental(
        accidentals: [], number: .seven)
    public static let sevenFlatDouble = ChordSymbolElementNumberWithAccidental(
        accidentals: [.flat, .flat], number: .seven)

    // nine
    public static let nine = ChordSymbolElementNumberWithAccidental(accidentals: [], number: .nine)
    public static let nineFlat = ChordSymbolElementNumberWithAccidental(
        accidentals: [.flat], number: .nine)
    public static let nineSharp = ChordSymbolElementNumberWithAccidental(
        accidentals: [.sharp], number: .nine)

    // eleven
    public static let eleven = ChordSymbolElementNumberWithAccidental(
        accidentals: [], number: .eleven)
    public static let elevenSharp = ChordSymbolElementNumberWithAccidental(
        accidentals: [.sharp], number: .eleven)

    // thirteen
    public static let thirteen = ChordSymbolElementNumberWithAccidental(
        accidentals: [], number: .thirteen)
    public static let thirteenFlat = ChordSymbolElementNumberWithAccidental(
        accidentals: [.flat], number: .thirteen)
    public static let thirteenSharp = ChordSymbolElementNumberWithAccidental(
        accidentals: [.sharp], number: .thirteen)

    // Sepical
    public static let sixNine = ChordSymbolElementNumberWithAccidental(
        accidentals: [], number: .sixNine)

}

public struct ChordSymbolElementlBasic: Equatable, Hashable {

    var characters: [ChordSymbolElementlBasicCharacter]

    var numberWithAccidental: ChordSymbolElementNumberWithAccidental?

    public var sysStringStandard: String {
        self.characters.map { $0.symbolStringStandard }.joined()
            + (self.numberWithAccidental?.symbolString ?? "")
    }

    public var sysStringJazz: String {

        if characters == [.major] {
            return "MAJ" + (self.numberWithAccidental?.symbolString ?? "")
        }

        if characters == [.minor] {
            return "MIN" + (self.numberWithAccidental?.symbolString ?? "")
        }

        return self.sysStringStandard
    }

    public var sysStringRealBook: String {
        self.characters.map { $0.symbolStringGraph }.joined()
            + (self.numberWithAccidental?.symbolString ?? "")
    }

}

public enum ChordSymbolElementlBasicType: String, CaseIterable {

    case major, majorSix, majorSeven, majorNine, majorEleven, majorThirteen
    case minor, minorSix, minorSeven, minorNine, minorEleven, minorThirteen
    case augmented, augmentedSix
    case diminished, diminishedSix, diminishedSeven, diminishedNine, diminishedEleven,
        diminishedThirteen
    case halfDiminished, halfDiminishedNine, halfDiminishedEleven, halfDiminishedThirteen
    case dominent, dominentNine, dominentEleven, dominentThirteen
    case minorMajor, minorAug
    case sus2, sus4

    case majorSevenFlatDouble, minorSevenFlatDouble, sevenFlatDouble

    case sixNine

    var chordSymbolElementlBasic: ChordSymbolElementlBasic {
        switch self {

        // Major
        case .major:
            ChordSymbolElementlBasic(characters: [.major], numberWithAccidental: nil)
        case .majorSix:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .six)
        case .majorSeven:
            ChordSymbolElementlBasic(characters: [.major], numberWithAccidental: .seven)
        case .majorNine:
            ChordSymbolElementlBasic(characters: [.major], numberWithAccidental: .nine)
        case .majorEleven:
            ChordSymbolElementlBasic(characters: [.major], numberWithAccidental: .eleven)
        case .majorThirteen:
            ChordSymbolElementlBasic(characters: [.major], numberWithAccidental: .thirteen)

        // Seventh
        case .majorSevenFlatDouble:
            ChordSymbolElementlBasic(characters: [.major], numberWithAccidental: .sevenFlatDouble)
        case .minorSevenFlatDouble:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: .sevenFlatDouble)
        case .sevenFlatDouble:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .sevenFlatDouble)

        // Minor
        case .minor:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: nil)
        case .minorSix:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: .six)
        case .minorSeven:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: .seven)
        case .minorNine:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: .nine)
        case .minorEleven:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: .eleven)
        case .minorThirteen:
            ChordSymbolElementlBasic(characters: [.minor], numberWithAccidental: .thirteen)

        // Minor & Major & Aug
        case .minorMajor:
            ChordSymbolElementlBasic(characters: [.minor, .major], numberWithAccidental: nil)
        case .minorAug:
            ChordSymbolElementlBasic(characters: [.minor, .augmented], numberWithAccidental: nil)

        // Augmented
        case .augmented:
            ChordSymbolElementlBasic(characters: [.augmented], numberWithAccidental: nil)
        case .augmentedSix:
            ChordSymbolElementlBasic(characters: [.augmented], numberWithAccidental: .six)

        // Dimished
        case .diminished:
            ChordSymbolElementlBasic(characters: [.diminished], numberWithAccidental: nil)
        case .diminishedSix:
            ChordSymbolElementlBasic(characters: [.diminished], numberWithAccidental: .six)
        case .diminishedSeven:
            ChordSymbolElementlBasic(characters: [.diminished], numberWithAccidental: .seven)
        case .diminishedNine:
            ChordSymbolElementlBasic(characters: [.diminished], numberWithAccidental: .nine)
        case .diminishedEleven:
            ChordSymbolElementlBasic(characters: [.diminished], numberWithAccidental: .eleven)
        case .diminishedThirteen:
            ChordSymbolElementlBasic(characters: [.diminished], numberWithAccidental: .thirteen)

        // Half-Diminished
        case .halfDiminished:
            ChordSymbolElementlBasic(characters: [.halfDiminished], numberWithAccidental: nil)
        case .halfDiminishedNine:
            ChordSymbolElementlBasic(characters: [.halfDiminished], numberWithAccidental: .nine)
        case .halfDiminishedEleven:
            ChordSymbolElementlBasic(characters: [.halfDiminished], numberWithAccidental: .eleven)
        case .halfDiminishedThirteen:
            ChordSymbolElementlBasic(characters: [.halfDiminished], numberWithAccidental: .thirteen)

        // Dominent
        case .dominent:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .seven)
        case .dominentNine:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .nine)
        case .dominentEleven:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .eleven)
        case .dominentThirteen:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .thirteen)

        // Sus
        case .sus2:
            ChordSymbolElementlBasic(characters: [.sus], numberWithAccidental: .two)
        case .sus4:
            ChordSymbolElementlBasic(characters: [.sus], numberWithAccidental: .four)

        // Special
        case .sixNine:
            ChordSymbolElementlBasic(characters: [], numberWithAccidental: .sixNine)
        }

    }

}

// 产品
public struct ChordSymbol: Hashable {

    var main: ChordSymbolElementlBasic?
    var sus: ChordSymbolElementlBasic?

    var addition: [ChordSymbolElementNumberWithAccidental] {
        didSet {
            self.addition.sort(by: { $0.number.rawValue < $1.number.rawValue })
        }
    }

    public init(
        main: ChordSymbolElementlBasicType? = nil,
        sus: ChordSymbolElementlBasicType? = nil,
        addition: [ChordSymbolElementNumberWithAccidental] = []
    ) {
        self.main = main?.chordSymbolElementlBasic
        self.sus = sus?.chordSymbolElementlBasic
        self.addition = addition.sorted(by: { $0.number.rawValue < $1.number.rawValue })
    }

    var isSeventhInMain: Bool {
        main?.numberWithAccidental == .seven
    }

    var isSixNineChord: Bool {
        main?.numberWithAccidental == .six
    }

}

// ChordSymbolString
extension ChordSymbol {

    public enum SysStringMainSusPrintType {
        case stardard, jazzNormal, jazzRealBook
    }

    public enum SysStringTensionPrintType {
        case parentheses, add
    }

    public func sysString(
        mainSusPrintType: SysStringMainSusPrintType,
        tensionPrintType: SysStringTensionPrintType
    ) -> String {

        // Main & Sus Part
        var mainPart: String = ""
        var susPart: String = ""
        switch mainSusPrintType {
        case .stardard:
            mainPart = main?.sysStringStandard ?? ""
            susPart = sus?.sysStringStandard ?? ""
        case .jazzNormal:
            mainPart = main?.sysStringJazz ?? ""
            susPart = sus?.sysStringJazz ?? ""
        case .jazzRealBook:
            mainPart = main?.sysStringRealBook ?? ""
            susPart = sus?.sysStringRealBook ?? ""
        }

        // Add Part
        var addPart: String = ""
        if !self.addition.isEmpty {
            switch tensionPrintType {
            case .parentheses:
                addPart = "(" + self.addition.map { $0.symbolString }.joined(separator: " ") + ")"
            case .add:
                addPart = "add " + self.addition.map { $0.symbolString }.joined(separator: " ")

                if !mainPart.isEmpty || !susPart.isEmpty {
                    addPart = " " + addPart
                }
            }
        }

        // Combine
        return mainPart + susPart + addPart
    }
}

// 产品预设
// ChordSymbolPreset
public enum ChordSymbolType: String, CaseIterable {

    // 三和弦
    case traidMajor
    case traidAugmented
    case traidMajorFlatFive

    case traidMinor
    case traidMinorSharpFive
    case traidDiminished

    // 三和弦挂留
    case traidSus2
    case traidSus2FiveFlat
    case traidSus2FiveSharp

    case traidSus4
    case traidSus4FiveFlat
    case traidSus4FiveSharp

    // 七和弦
    case sevnethMajor
    case sevnethMinor
    case sevnethDominant
    case sevnethHalfDiminished
    case sevnethDiminished
    case sevnethMajorFiveFlat
    case sevnethMinorMajor
    case sevnethMajorSevenDoubleFlat
    case sevnethDominantFiveFlat
    case sevnethMajorFiveFlatSevenFlatDouble
    case sevnethMajorFiveSharp
    case sevnethDominantFiveSharp
    case sevnethMajorFiveSharpSevenFlatDouble
    case sevnethMinorSevenFlatDouble
    case sevnethMinorMajorFiveFlat
    case sevnethMinorMajorFiveSharp
    case sevnethMinorFiveSharp
    case sevnethMinorFiveSharpSevenFlatDouble

    // 七和弦挂留
    case seventhSus2Major
    case seventhSus2Dominant
    case seventhSus2SevenFlatDouble
    case seventhSus2MajorFiveFlat
    case seventhSus2DominantFiveFlat
    case seventhSus2FiveFlatSevenFlatDouble
    case seventhSus2MajorFiveSharp
    case seventhSus2DominantFiveSharp
    case seventhSus2FiveSharpSevenFlatDouble

    case seventhSus4Major
    case seventhSus4Dominant
    case seventhSus4SevenFlatDouble
    case seventhSus4MajorFiveFlat
    case seventhSus4DominantFiveFlat
    case seventhSus4FiveFlatSevenFlatDouble
    case seventhSus4MajorFiveSharp
    case seventhSus4DominantFiveSharp
    case seventhSus4FiveSharpSevenFlatDouble

    // 六和弦
    case sixthMajor
    case sixthAugmented
    case sixthMajorFiveFlat
    case sixthMinor
    case sixthMinorFiveSharp
    case sixthDiminished

    // 六和弦挂留
    case sixthSus2Major
    case sixthSus2MajorFiveSharp
    case sixthSus2MajorFiveFlat

    case sixthSus4Major
    case sixthSus4MajorFiveSharp
    case sixthSus4MajorFiveFlat

    public var chordSymbol: [ChordSymbol]? {
        switch self {
        // 三和弦
        case .traidMajor:
            return [
                ChordSymbol(),
                ChordSymbol(main: .major),
            ]
        case .traidAugmented:
            return [
                ChordSymbol(main: .augmented)
            ]
        case .traidMajorFlatFive:
            return [
                ChordSymbol(main: .major, addition: [.fiveFlat])
            ]
        case .traidMinor:
            return [
                ChordSymbol(main: .minor)
            ]
        case .traidMinorSharpFive:
            return [
                ChordSymbol(main: .minor, addition: [.fiveSharp]),  // m(#5)
                ChordSymbol(main: .minorAug),  // mAug
            ]
        case .traidDiminished:
            return [
                ChordSymbol(main: .diminished)
            ]

        // 三和弦挂留
        case .traidSus2:
            return [
                ChordSymbol(sus: .sus2)
            ]
        case .traidSus2FiveFlat:
            return [
                ChordSymbol(sus: .sus2, addition: [.fiveFlat])
            ]
        case .traidSus2FiveSharp:
            return [
                ChordSymbol(sus: .sus2, addition: [.fiveSharp])
            ]

        case .traidSus4:
            return [
                ChordSymbol(sus: .sus4)
            ]
        case .traidSus4FiveFlat:
            return [
                ChordSymbol(sus: .sus4, addition: [.fiveFlat])
            ]
        case .traidSus4FiveSharp:
            return [
                ChordSymbol(sus: .sus4, addition: [.fiveSharp])
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
            return [
                ChordSymbol(main: .halfDiminished),
                ChordSymbol(main: .minorSeven, addition: [.fiveFlat]),
            ]
        case .sevnethDiminished:
            return [
                ChordSymbol(main: .diminishedSeven)
            ]
        case .sevnethMajorFiveFlat:
            return [
                ChordSymbol(main: .majorSeven, addition: [.fiveFlat])
            ]
        case .sevnethMinorMajor:
            return [
                ChordSymbol(main: .minorMajor)
            ]
        case .sevnethMajorSevenDoubleFlat:
            return [
                ChordSymbol(main: .majorSevenFlatDouble),
                ChordSymbol(main: .major, addition: [.sevenFlatDouble]),
            ]
        case .sevnethDominantFiveFlat:
            return [
                ChordSymbol(main: .dominent, addition: [.fiveFlat])
            ]
        case .sevnethMajorFiveFlatSevenFlatDouble:
            return [
                ChordSymbol(main: .majorSevenFlatDouble, addition: [.fiveFlat]),
                ChordSymbol(main: .major, addition: [.fiveFlat, .sevenFlatDouble]),
            ]
        case .sevnethMajorFiveSharp:
            return [
                ChordSymbol(main: .majorSeven, addition: [.fiveSharp])
            ]
        case .sevnethDominantFiveSharp:
            return [
                ChordSymbol(main: .dominent, addition: [.fiveSharp])
            ]
        case .sevnethMajorFiveSharpSevenFlatDouble:
            return [
                ChordSymbol(main: .majorSevenFlatDouble, addition: [.fiveSharp]),
                ChordSymbol(main: .major, addition: [.fiveSharp, .sevenFlatDouble]),
            ]
        case .sevnethMinorSevenFlatDouble:
            return [
                ChordSymbol(main: .minorSevenFlatDouble),
                ChordSymbol(main: .minor, addition: [.sevenFlatDouble]),
            ]
        case .sevnethMinorMajorFiveFlat:
            return [
                ChordSymbol(main: .minorMajor, addition: [.fiveFlat])
            ]
        case .sevnethMinorMajorFiveSharp:
            return [
                ChordSymbol(main: .minorMajor, addition: [.fiveSharp])
            ]
        case .sevnethMinorFiveSharp:
            return [
                ChordSymbol(main: .minorSeven, addition: [.fiveSharp])
            ]
        case .sevnethMinorFiveSharpSevenFlatDouble:
            return [
                ChordSymbol(main: .minorSevenFlatDouble, addition: [.fiveSharp]),
                ChordSymbol(main: .minor, addition: [.fiveSharp, .sevenFlatDouble]),
            ]

        // 七和弦挂留
        case .seventhSus2Major:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus2)
            ]
        case .seventhSus2Dominant:
            return [
                ChordSymbol(main: .dominent, sus: .sus2)
            ]
        case .seventhSus2SevenFlatDouble:
            return [
                ChordSymbol(sus: .sus2, addition: [.sevenFlatDouble]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus2),
            ]
        case .seventhSus2MajorFiveFlat:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus2, addition: [.fiveFlat])
            ]
        case .seventhSus2DominantFiveFlat:
            return [
                ChordSymbol(main: .dominent, sus: .sus2, addition: [.fiveFlat])
            ]
        case .seventhSus2FiveFlatSevenFlatDouble:
            return [
                ChordSymbol(sus: .sus2, addition: [.fiveFlat, .sevenFlatDouble]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus2, addition: [.fiveFlat]),
            ]
        case .seventhSus2MajorFiveSharp:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus2, addition: [.fiveSharp])
            ]
        case .seventhSus2DominantFiveSharp:
            return [
                ChordSymbol(main: .dominent, sus: .sus2, addition: [.fiveSharp])
            ]
        case .seventhSus2FiveSharpSevenFlatDouble:
            return [
                ChordSymbol(sus: .sus2, addition: [.fiveSharp, .sevenFlatDouble]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus2, addition: [.fiveSharp]),
            ]

        case .seventhSus4Major:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus4)
            ]
        case .seventhSus4Dominant:
            return [
                ChordSymbol(main: .dominent, sus: .sus4)
            ]
        case .seventhSus4SevenFlatDouble:
            return [
                ChordSymbol(sus: .sus4, addition: [.sevenFlatDouble]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus4),
            ]
        case .seventhSus4MajorFiveFlat:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus4, addition: [.fiveFlat])
            ]
        case .seventhSus4DominantFiveFlat:
            return [
                ChordSymbol(main: .dominent, sus: .sus4, addition: [.fiveFlat])
            ]
        case .seventhSus4FiveFlatSevenFlatDouble:
            return [
                ChordSymbol(sus: .sus4, addition: [.fiveFlat, .sevenFlatDouble]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus4, addition: [.fiveFlat]),
            ]
        case .seventhSus4MajorFiveSharp:
            return [
                ChordSymbol(main: .majorSeven, sus: .sus4, addition: [.fiveSharp])
            ]
        case .seventhSus4DominantFiveSharp:
            return [
                ChordSymbol(main: .dominent, sus: .sus4, addition: [.fiveSharp])
            ]
        case .seventhSus4FiveSharpSevenFlatDouble:
            return [
                ChordSymbol(sus: .sus4, addition: [.fiveSharp, .sevenFlatDouble]),
                ChordSymbol(main: .sevenFlatDouble, sus: .sus4, addition: [.fiveSharp]),
            ]

        // 六和弦
        case .sixthMajor:
            return [
                ChordSymbol(main: .majorSix)
            ]
        case .sixthAugmented:
            return [
                ChordSymbol(main: .augmentedSix),
                ChordSymbol(main: .majorSix, addition: [.fiveSharp]),
            ]
        case .sixthMajorFiveFlat:
            return [
                ChordSymbol(main: .majorSix, addition: [.fiveFlat])
            ]
        case .sixthMinor:
            return [
                ChordSymbol(main: .minorSix)
            ]
        case .sixthMinorFiveSharp:
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
        case .sixthSus2MajorFiveSharp:
            return [
                ChordSymbol(main: .majorSix, sus: .sus2, addition: [.fiveSharp])
            ]
        case .sixthSus2MajorFiveFlat:
            return [ChordSymbol(main: .majorSix, sus: .sus2, addition: [.fiveFlat])]

        case .sixthSus4Major: return [ChordSymbol(main: .majorSix, sus: .sus4)]
        case .sixthSus4MajorFiveSharp:
            return [ChordSymbol(main: .majorSix, sus: .sus4, addition: [.fiveSharp])]
        case .sixthSus4MajorFiveFlat:
            return [ChordSymbol(main: .majorSix, sus: .sus4, addition: [.fiveFlat])]
        }
    }

    public var intervals: Set<Interval> {
        switch self {
        // 三和弦
        case .traidMajor: return [.M3, .P5]
        case .traidAugmented: return [.M3, .A5]
        case .traidMajorFlatFive: return [.M3, .d5]

        case .traidMinor: return [.m3, .P5]
        case .traidMinorSharpFive: return [.m3, .A5]
        case .traidDiminished: return [.m3, .d5]

        // 三和弦挂留
        case .traidSus2: return [.M2, .P5]
        case .traidSus2FiveFlat: return [.M2, .d5]
        case .traidSus2FiveSharp: return [.M2, .A5]

        case .traidSus4: return [.P4, .P5]
        case .traidSus4FiveFlat: return [.P4, .d5]
        case .traidSus4FiveSharp: return [.P4, .A5]

        // 七和弦
        case .sevnethMajor: return [.M3, .P5, .M7]
        case .sevnethMinor: return [.m3, .P5, .m7]
        case .sevnethDominant: return [.M3, .P5, .m7]
        case .sevnethHalfDiminished: return [.m3, .d5, .m7]
        case .sevnethDiminished: return [.m3, .d5, .d7]
        case .sevnethMajorFiveFlat: return [.M3, .d5, .M7]
        case .sevnethMinorMajor: return [.m3, .P5, .M7]
        case .sevnethMajorSevenDoubleFlat: return [.M3, .P5, .d7]
        case .sevnethDominantFiveFlat: return [.M3, .d5, .m7]
        case .sevnethMajorFiveFlatSevenFlatDouble: return [.M3, .d5, .d7]
        case .sevnethMajorFiveSharp: return [.M3, .A5, .M7]
        case .sevnethDominantFiveSharp: return [.M3, .A5, .m7]
        case .sevnethMajorFiveSharpSevenFlatDouble: return [.M3, .A5, .d7]
        case .sevnethMinorSevenFlatDouble: return [.m3, .P5, .d7]
        case .sevnethMinorMajorFiveFlat: return [.m3, .d5, .M7]
        case .sevnethMinorMajorFiveSharp: return [.m3, .A5, .M7]
        case .sevnethMinorFiveSharp: return [.m3, .A5, .m7]
        case .sevnethMinorFiveSharpSevenFlatDouble: return [.m3, .A5, .d7]

        // 七和弦挂留
        case .seventhSus2Major: return [.M2, .P5, .M7]
        case .seventhSus2Dominant: return [.M2, .P5, .m7]
        case .seventhSus2SevenFlatDouble: return [.M2, .P5, .d7]
        case .seventhSus2MajorFiveFlat: return [.M2, .d5, .M7]
        case .seventhSus2DominantFiveFlat: return [.M2, .d5, .m7]
        case .seventhSus2FiveFlatSevenFlatDouble: return [.M2, .d5, .d7]
        case .seventhSus2MajorFiveSharp: return [.M2, .A5, .M7]
        case .seventhSus2DominantFiveSharp: return [.M2, .A5, .m7]
        case .seventhSus2FiveSharpSevenFlatDouble: return [.M2, .A5, .d7]

        case .seventhSus4Major: return [.P4, .P5, .M7]
        case .seventhSus4Dominant: return [.P4, .P5, .m7]
        case .seventhSus4SevenFlatDouble: return [.P4, .P5, .d7]
        case .seventhSus4MajorFiveFlat: return [.P4, .d5, .M7]
        case .seventhSus4DominantFiveFlat: return [.P4, .d5, .m7]
        case .seventhSus4FiveFlatSevenFlatDouble: return [.P4, .d5, .d7]
        case .seventhSus4MajorFiveSharp: return [.P4, .A5, .M7]
        case .seventhSus4DominantFiveSharp: return [.P4, .A5, .m7]
        case .seventhSus4FiveSharpSevenFlatDouble: return [.P4, .A5, .d7]

        // 六和弦
        case .sixthMajor: return [.M3, .P5, .M6]
        case .sixthAugmented: return [.M3, .A5, .M6]
        case .sixthMajorFiveFlat: return [.M3, .d5, .M6]
        case .sixthMinor: return [.m3, .P5, .M6]
        case .sixthMinorFiveSharp: return [.m3, .A5, .M6]
        case .sixthDiminished: return [.m3, .d5, .M6]

        // 六和弦挂留
        case .sixthSus2Major: return [.M2, .P5, .M6]
        case .sixthSus2MajorFiveSharp: return [.M2, .A5, .M6]
        case .sixthSus2MajorFiveFlat: return [.M2, .d5, .M6]

        case .sixthSus4Major: return [.P4, .P5, .M6]
        case .sixthSus4MajorFiveSharp: return [.P4, .A5, .M6]
        case .sixthSus4MajorFiveFlat: return [.P4, .d5, .M6]

        }
    }

}
