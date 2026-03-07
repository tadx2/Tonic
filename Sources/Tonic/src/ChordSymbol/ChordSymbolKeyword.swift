//
//  ChordSymbolKeyword.swift
//  Tonic
//
//  Created by 小汤汤 on 3/5/26.
//

public enum ChordSymbolKeyword: CaseIterable, Sendable, Hashable {

    case major, minor, augmented, diminished, halfDiminished, sus, alt
    case six, seven

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
        case .halfDiminished:
            return "m7♭5"
        case .sus:
            return "sus"
        case .alt:
            return "Alt"
        case .seven:
            return "7"
        case .six:
            return "6"
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
        case .halfDiminished:
            return "ø"
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
