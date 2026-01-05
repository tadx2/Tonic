//
//  ChordTraidType.swift
//  Tonic
//
//  Created by 小汤汤 on 1/2/26.
//



public enum ChordTraidType: String, CaseIterable, Codable, Sendable {
    case major, majorAugFifth, majorFlatFifth
    case minor, minorAugFifth, minorFlatFifth
    
    public var intervals: [Interval] {
        switch self {
        case .major:            return [.M3, .P5]
        case .majorAugFifth:    return [.M3, .A5]
        case .majorFlatFifth:   return [.M3, .d5]
        case .minor:            return [.m3, .P5]
        case .minorAugFifth:    return [.m3, .A5]
        case .minorFlatFifth:   return [.m3, .d5]
        }
    }
    
    public var cnName: String {
        switch self {
        case .major:            return "大三"
        case .majorAugFifth:    return "增三"
        case .majorFlatFifth:   return "大三减五"
        case .minor:            return "小三"
        case .minorAugFifth:    return "小三增五"
        case .minorFlatFifth:   return "减三"
        }
    }
    
    public var enName: String {
        switch self {
        case .major:            return "major triad"
        case .majorAugFifth:    return "augmented triad"
        case .majorFlatFifth:   return "major triad flat five"
        case .minor:            return "minor triad"
        case .minorAugFifth:    return "minor augmented triad"
        case .minorFlatFifth:   return "diminished triad"
        }
    }
}
