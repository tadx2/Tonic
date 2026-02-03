//
//  ChordDiatonic.swift
//  Tonic
//
//  Created by 小汤汤 on 1/30/26.
//

import Foundation

public enum ChordDiatonicType: CaseIterable {

    case majorTriad
    case minorTriad
    case majorSeventh
    case minorSeventh

    public var chordType: [ChordTypeBasic] {
        switch self {
        case .majorTriad:
            return [
                .majorTriad, .minorTriad, .minorTriad, .majorTriad, .majorTriad, .minorTriad,
                .diminishedTriad,
            ]
        case .minorTriad:
            return [
                .minorTriad, .diminishedTriad, .majorTriad, .minorTriad, .minorTriad, .majorTriad,
                .majorTriad,
            ]
        case .majorSeventh:
            return [.major7, .minor7, .minor7, .major7, .dominant7, .minor7, .halfDiminished7]
        case .minorSeventh:
            return [.minor7, .halfDiminished7, .major7, .minor7, .minor7, .major7, .dominant7]
        }
    }

    public var modeType: Mode.ModeType {
        switch self {
        case .majorTriad, .majorSeventh:
            return Mode.ModeType.natural(.major)
        case .minorTriad, .minorSeventh:
            return Mode.ModeType.natural(.minor)
        }
    }

    public func chordSeries(from note: Note) -> [Chord] {
        
        let intervals = modeType.intervals
        let notes = intervals.map { note + $0 }

        let chordTypes = self.chordType

        // 音程关系与和弦种类不一致，返回空
        guard notes.count == chordTypes.count else { return [] }

        return zip(notes, chordTypes).map { (note, type) in
            Chord(root: note, intervals: type.info.intervals)
        }
    }

}

// Description
extension ChordDiatonicType: CustomStringConvertible {

    public var description: String {
        switch self {
        case .majorTriad: return "Major Scale Diatonic Triads"
        case .minorTriad: return "Minor Scale Diatonic Triads"
        case .majorSeventh: return "Major Scale Diatonic Sevenths"
        case .minorSeventh: return "Minor Scale Diatonic Sevenths"
        }
    }

}
