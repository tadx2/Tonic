//
//  ChordSymbol+Accidental.swift
//  Tonic
//
//  Created by 小汤汤 on 4/3/26.
//

import Foundation

public extension Accidental {
        var chordSymbolElements: [ChordSymbolElement] {
                switch self {
                case 0:
                        []
                case -1:
                        [.flat]
                case 1:
                        [.sharp]
                case let value where value < 0:
                        Array(repeating: .flat, count: -value)
                default:
                        Array(repeating: .sharp, count: self)
                }
        }
}
