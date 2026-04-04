//
//  ChordSymbol+Letter.swift
//  Tonic
//
//  Created by 小汤汤 on 4/3/26.
//

import Foundation

public extension Letter {
        var chordSymbolElement: ChordSymbolElement {
                switch self {
                case .C: .C
                case .D: .D
                case .E: .E
                case .F: .F
                case .G: .G
                case .A: .A
                case .B: .B
                }
        }
}
