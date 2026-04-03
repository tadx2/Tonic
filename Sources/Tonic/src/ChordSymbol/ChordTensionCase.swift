//
//  ChordTensionCase.swift
//  Tonic
//
//  Created by 小汤汤 on 4/3/26.
//

import Foundation

public enum ChordTensionCase: CaseIterable, CustomStringConvertible, Sendable {
    public static let allCases: [ChordTensionCase] = [.ninth(of: .nine), .ninth(of: .flatNine), .ninth(of: .sharpNine),
                                                      .eleventh(of: .eleven), .eleventh(of: .sharpEleven),
                                                      .thirteenth(of: .thirteen), .thirteenth(of: .flatThirteen), .thirteenth(of: .sharpThirteen)]

    case ninth(of: Ninth), eleventh(of: Eleventh), thirteenth(of: Thirteenth)
}

public extension ChordTensionCase {
    enum Ninth: CaseIterable, Sendable {
        case nine, sharpNine, flatNine

        var interval: Interval {
            switch self {
            case .nine: .M9
            case .sharpNine: .A9
            case .flatNine: .m9
            }
        }
    }

    enum Eleventh: CaseIterable, Sendable {
        case eleven, sharpEleven

        var interval: Interval {
            switch self {
            case .eleven: .P11
            case .sharpEleven: .A11
            }
        }
    }

    enum Thirteenth: CaseIterable, Sendable {
        case thirteen, sharpThirteen, flatThirteen

        var interval: Interval {
            switch self {
            case .thirteen: .M13
            case .sharpThirteen: .A13
            case .flatThirteen: .m13
            }
        }
    }

    var interval: Interval {
        switch self {
        case let .ninth(of):
            of.interval
        case let .eleventh(of):
            of.interval
        case let .thirteenth(of):
            of.interval
        }
    }
}

public extension ChordTensionCase {
    var description: String {
        switch self {
        case let .ninth(of):
            of.interval.descriptionNumber
        case let .eleventh(of):
            of.interval.descriptionNumber
        case let .thirteenth(of):
            of.interval.descriptionNumber
        }
    }
}
