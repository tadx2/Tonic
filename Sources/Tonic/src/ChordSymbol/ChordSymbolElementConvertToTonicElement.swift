//
//  ChordSymbolElementConvertToTonicElement.swift
//  Tonic
//
//  Created by 小汤汤 on 4/3/26.
//

import Foundation

/// Convert To Letter
public extension ChordSymbolElement {
    var isLetter: Bool {
        switch self {
        case .C, .D, .E, .F, .G, .A, .B:
            return true
        default:
            return false
        }
    }

    var toLetter: Letter? {
        guard isLetter else { return nil }

        return switch self {
        case .C:
            Letter.C
        case .D:
            Letter.D
        case .E:
            Letter.E
        case .F:
            Letter.F
        case .G:
            Letter.G
        case .A:
            Letter.A
        case .B:
            Letter.B
        default: nil
        }
    }
}
