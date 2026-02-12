//
//  Mode.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

public struct Mode: CustomStringConvertible, Hashable {

    public let description: String

    public let intervals: [Interval]

}

extension Mode {
    
    public enum ModeQuality {
        
        case major
        case minor
        case dominant
        case diminished
        case altered
    }

    public var quality: ModeQuality {
        
        let hasMajor3 = intervals.contains(.M3)
        let hasMinor3 = intervals.contains(.m3)
        let hasMinor7 = intervals.contains(.m7)
        // let hasMajor7 = intervals.contains(.M7)
        let hasFlat5  = intervals.contains(.d5)

        if hasMajor3 && hasMinor7 {
            return .dominant
        }

        if hasMajor3 {
            return .major
        }

        if hasMinor3 && hasFlat5 {
            return .diminished
        }

        if hasMinor3 {
            return .minor
        }

        return .altered
    }
    
}
