//
//  ChordSymbolElement.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public enum ChordSymbolElement: Hashable, Sendable {
    case word(ChordSymbolElementWord)
    case acc(ChordSymbolElementAcc)
    case number(ChordSymbolElementNum)
}

public typealias ChordSymbolElements = [ChordSymbolElement]

public enum ChordSymbolElementsCase: Sendable {

    case major, augmented, diminished, alt
    case majorSeven, majorFiveFlat, majorFiveSharp
    case diminishedSeven

    case sus, sus2, sus4

    case minor, minorSeven, minorAugmented, minorFiveSharp, minorFiveFlat
    
    case minorMajor, minorMajorSeven, minorMajorFiveFlat, minorMajorFiveSharp

    case five, fiveFlat, fiveSharp
    
    case seven, sevenFlatDouble

    case majorSevenFlatDouble
    case minorSevenFlatDouble
   
    // Six chord
    case six
    case majorSix
    case minorSix
    case augmentedSix
    case diminishedSix

    var elements: ChordSymbolElements {

        switch self {
        case .major:
            return [.word(.major)]
        case .majorFiveFlat:
            return [.word(.major), .acc(.flat), .number(.five)]
        case .majorFiveSharp:
            return [.word(.major), .acc(.sharp), .number(.five)]
            
        case .minor:
            return [.word(.minor)]
        case .minorFiveFlat:
            return [.word(.minor), .acc(.flat), .number(.five)]
        case .minorFiveSharp:
            return [.word(.minor), .acc(.sharp), .number(.five)]
        case .minorSeven:
            return [.word(.minor), .number(.seven)]
        case .minorAugmented:
            return [.word(.minor), .word(.augmented)]
            
        // Minor Major
        case .minorMajor:
            return [.word(.minor), .word(.major)]
        case .minorMajorSeven:
            return [.word(.minor), .word(.major), .number(.seven)]
        case .minorMajorFiveFlat:
            return [.word(.minor), .word(.major), .acc(.flat), .number(.five)]
        case .minorMajorFiveSharp:
            return [.word(.minor), .word(.major), .acc(.sharp), .number(.five)]
            
        case .augmented:
            return [.word(.augmented)]
        case .diminished:
            return [.word(.diminished)]
        case .diminishedSeven:
            return [.word(.diminished), .number(.seven)]
        case .majorSeven:
            return [.word(.major), .number(.seven)]

        // SUS
        case .sus:
            return [.word(.sus)]
        case .sus2:
            return [.word(.sus), .number(.two)]
        case .sus4:
            return [.word(.sus), .number(.four)]

        case .alt:
            return [.word(.alt)]

        // Five
        case .five:
            return [.number(.five)]
        case .fiveFlat:
            return [.acc(.flat), .number(.five)]
        case .fiveSharp:
            return [.acc(.sharp), .number(.five)]
            
        // Seven
        case .seven:
            return [.number(.seven)]
        case .sevenFlatDouble:
            return [.acc(.flat), .acc(.flat), .number(.seven)]
             
        case .majorSevenFlatDouble:
            return [.word(.major), .acc(.flat), .acc(.flat), .number(.seven)]
        case .minorSevenFlatDouble:
            return [.word(.minor), .acc(.flat), .acc(.flat), .number(.seven)]
        

        // Six chord types
        case .six:
            return [.number(.six)]
        case .majorSix:
            return [.word(.major), .number(.six)]
        case .minorSix:
            return [.word(.minor), .number(.six)]
        case .augmentedSix:
            return [.word(.augmented), .number(.six)]
        case .diminishedSix:
            return [.word(.diminished), .number(.six)]
        }
    }
}
