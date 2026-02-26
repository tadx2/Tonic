//
//  Tempo.swift
//  Tonic
//
//  Created by 小汤汤 on 1/29/26.
//

import Foundation

public struct TimeSignature: Sendable {
    
    public var numerator: Int
    public var denominator: Int
    
    public init(_ n: Int, _ d: Int) {
        numerator = n
        denominator = d
    }
}

// preset
extension TimeSignature {
    static let towFour = TimeSignature(2, 4)
    static let threeFour = TimeSignature(3, 4)
    static let fourFour = TimeSignature(4, 4)
    
    static let sixEight = TimeSignature(6, 8)
    static let nineEight = TimeSignature(9, 8)
    static let twelveEight = TimeSignature(12, 8)
}


