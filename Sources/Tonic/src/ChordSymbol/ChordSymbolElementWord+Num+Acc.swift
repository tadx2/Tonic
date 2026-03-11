//
//  ChordSymbolElementNumberWithAcc.swift
//  Tonic
//
//  Created by 小汤汤 on 3/5/26.


public enum ChordSymbolElementWord: Sendable {
    
    case major, minor, augmented, diminished, sus, alt
    
    public var symbolStringStandardMm: String {
           switch self {
           case .major:
               return "M"
           case .minor:
               return "m"
           case .augmented:
               return "Aug"
           case .diminished:
               return "dim"
           case .sus:
               return "sus"
           case .alt:
               return "Alt"
           }
       }

       public var symbolStringMajMinLowcase: String {
           switch self {
           case .major:
               return "maj"
           case .minor:
               return "min"
           default: return symbolStringStandardMm
           }
       }

       public var symbolStringMajMinUpcase: String {
           switch self {
           case .major:
               return "MAJ"
           case .minor:
               return "MIN"
           default: return symbolStringStandardMm
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
           default: return symbolStringStandardMm
           }
       }

       public enum DisplayMode: CaseIterable, CustomStringConvertible {
           case standard, majMinLowcase, graph, majMinUpcase

           public var description: String {
               switch self {
               case .standard:
                   "standard"
               case .majMinLowcase:
                   "maj&min"
               case .graph:
                   "graph"
               case .majMinUpcase:
                   "MAJ&MIN"
               }
           }
           
       }

       public func displayString(mode: DisplayMode) -> String {
           switch mode {
           case .standard:
               self.symbolStringStandardMm
           case .majMinLowcase:
               self.symbolStringMajMinLowcase
           case .majMinUpcase:
               self.symbolStringMajMinUpcase
           case .graph:
               self.symbolStringGraph
           }
       }
}

public enum ChordSymbolElementNum: Sendable {
    case two, four
    case five
    case six
    case seven
    case nine, eleven, thirteen
    
    public var displayString: String {
        switch self {
        case .two:
            "2"
        case .four:
            "4"
        case .five:
            "5"
        case .six:
            "6"
        case .seven:
            "7"
        case .nine:
            "9"
        case .eleven:
            "11"
        case .thirteen:
            "13"
        }
    }
    
}

public enum ChordSymbolElementAcc: Sendable {
    case flat, sharp
    
    public var displayString: String {
        switch self{
        case .flat: "♭"
        case .sharp: "♯"
        }
    }
}


