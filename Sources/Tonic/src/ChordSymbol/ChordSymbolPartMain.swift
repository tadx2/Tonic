//
//  ChordSymbolPartMain.swift
//  Tonic
//
//  Created by 小汤汤 on 3/5/26.
//


public struct ChordSymbolPartMain: Sendable, Equatable, Hashable {

    public var keywords: [ChordSymbolKeyword]

    public var numberWithAcc: ChordSymbolNumberWithAcc?

    public init(
        keywords: [ChordSymbolKeyword] = [],
        numberWithAcc: ChordSymbolNumberWithAcc? = nil
    ) {
        self.keywords = keywords
        self.numberWithAcc = numberWithAcc
    }
    
}

// DispalyString
extension ChordSymbolPartMain {
    public func displayString(mode: ChordSymbolKeyword.DisplayMode) -> String {
        let keywordsString = self.keywords.map{ keyword in
            keyword.displayString(mode: mode)
        }.joined()
        
        let numberWithAccString = numberWithAcc?.displayString ?? ""
        
        return keywordsString + numberWithAccString
    }
}

public enum ChordSymbolPartMainCase: String, CaseIterable {

    case major, majorSix, majorSeven, majorNine, majorEleven, majorThirteen
    case minor, minorSix, minorSeven, minorNine, minorEleven, minorThirteen
    case aug, augmentedSix
    case diminished, diminishedSix, diminishedSeven, diminishedNine, diminishedEleven,
        diminishedThirteen
    case halfDiminished, halfDiminishedNine, halfDiminishedEleven, halfDiminishedThirteen
    case dominent, dominentNine, dominentEleven, dominentThirteen
    case minorMajor
    case sus2, sus4

    case major_DoubleFlat7, minor_DoubleFlat7, sevenFlatDouble

    case sixNine
    
    case minorAugmented
    
    case sevenAlt

    var chordSymbolMainPart: ChordSymbolPartMain {
        switch self {

        // Major
        case .major:
            ChordSymbolPartMain(keywords: [.major], numberWithAcc: nil)
        case .majorSeven:
            ChordSymbolPartMain(keywords: [.major], numberWithAcc: .seven)
        case .majorNine:
            ChordSymbolPartMain(keywords: [.major], numberWithAcc: .nine)
        case .majorEleven:
            ChordSymbolPartMain(keywords: [.major], numberWithAcc: .eleven)
        case .majorThirteen:
            ChordSymbolPartMain(keywords: [.major], numberWithAcc: .thirteen)

        // Seventh
        case .major_DoubleFlat7:
            ChordSymbolPartMain(keywords: [.major], numberWithAcc: .doubleFlat7)
        case .minor_DoubleFlat7:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: .doubleFlat7)
        case .sevenFlatDouble:
            ChordSymbolPartMain(keywords: [], numberWithAcc: .doubleFlat7)

        // Minor
        case .minor:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: nil)
        case .minorSeven:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: .seven)
        case .minorNine:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: .nine)
        case .minorEleven:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: .eleven)
        case .minorThirteen:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: .thirteen)

        // Six
        case .majorSix:
            ChordSymbolPartMain(keywords: [], numberWithAcc: .six)
        case .minorSix:
            ChordSymbolPartMain(keywords: [.minor], numberWithAcc: .six)

        // Minor & Major & Aug
        case .minorMajor:
            ChordSymbolPartMain(keywords: [.minor, .major], numberWithAcc: nil)

        // Augmented
        case .aug:
            ChordSymbolPartMain(keywords: [.augmented], numberWithAcc: nil)
        case .augmentedSix:
            ChordSymbolPartMain(keywords: [.augmented], numberWithAcc: .six)

        // Dimished
        case .diminished:
            ChordSymbolPartMain(keywords: [.diminished], numberWithAcc: nil)
        case .diminishedSix:
            ChordSymbolPartMain(keywords: [.diminished], numberWithAcc: .six)
        case .diminishedSeven:
            ChordSymbolPartMain(keywords: [.diminished], numberWithAcc: .seven)
        case .diminishedNine:
            ChordSymbolPartMain(keywords: [.diminished], numberWithAcc: .nine)
        case .diminishedEleven:
            ChordSymbolPartMain(keywords: [.diminished], numberWithAcc: .eleven)
        case .diminishedThirteen:
            ChordSymbolPartMain(keywords: [.diminished], numberWithAcc: .thirteen)

        // Half-Diminished
        case .halfDiminished:
            ChordSymbolPartMain(keywords: [.halfDiminished], numberWithAcc: nil)
        case .halfDiminishedNine:
            ChordSymbolPartMain(keywords: [.halfDiminished], numberWithAcc: .nine)
        case .halfDiminishedEleven:
            ChordSymbolPartMain(keywords: [.halfDiminished], numberWithAcc: .eleven)
        case .halfDiminishedThirteen:
            ChordSymbolPartMain(keywords: [.halfDiminished], numberWithAcc: .thirteen)

        // Dominent
        case .dominent:
            ChordSymbolPartMain(keywords: [], numberWithAcc: .seven)
        case .dominentNine:
            ChordSymbolPartMain(keywords: [], numberWithAcc: .nine)
        case .dominentEleven:
            ChordSymbolPartMain(keywords: [], numberWithAcc: .eleven)
        case .dominentThirteen:
            ChordSymbolPartMain(keywords: [], numberWithAcc: .thirteen)

        // Sus
        case .sus2:
            ChordSymbolPartMain(keywords: [.sus], numberWithAcc: .two)
        case .sus4:
            ChordSymbolPartMain(keywords: [.sus], numberWithAcc: .four)

        // Special
        case .sixNine:
            ChordSymbolPartMain(keywords: [.six], numberWithAcc: .nine)
            
        // Unsorted
        case .minorAugmented:
            ChordSymbolPartMain(keywords: [.minor, .augmented])
            
        case .sevenAlt:
            ChordSymbolPartMain(keywords: [.seven, .alt])
            
            
        }
        
    }
}
