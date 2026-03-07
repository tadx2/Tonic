//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 3/3/26.
//

import Foundation
import Tonic

public struct ChordPreset {

    public static let thirdPos: [Interval] = [.M3, .m3, .M2, .P4]
    public static let fifthPos: [Interval] = [.P5, .d5, .A5]
    public static let seventhPos: [Interval?] = [nil, .M7, .m7, .M6, .d7]

    public static let basicIntervals: [Set<Interval>] = {
        var allIntervals: [Set<Interval>] = []
        for seventhPo in seventhPos {
            for fifthPo in fifthPos {
                for thirdPo in thirdPos {
                    var chordIntervals: Set<Interval> = []
                    chordIntervals.insert(thirdPo)
                    chordIntervals.insert(fifthPo)
                    if let seventhPo = seventhPo { chordIntervals.insert(seventhPo) }

                    allIntervals.append(chordIntervals)
                }
            }
        }
        return allIntervals
    }()

    public static let ninePos: [Interval?] = [nil, .M9, .m9, .A9]
    public static let elevenPos: [Interval?] = [nil, .P11, .A11]
    public static let thirteenPos: [Interval?] = [nil, .M13, .m13, .A13]

    public static let tensionIntervals: [Set<Interval>] = {
        var allIntervals: [Set<Interval>] = []
        for thirteenPo in thirteenPos {
            for elevenPo in elevenPos {
                for ninePo in ninePos {

                    var chordIntervals: Set<Interval> = []
                    if let ninePo = ninePo { chordIntervals.insert(ninePo) }
                    if let elevenPo = elevenPo { chordIntervals.insert(elevenPo) }
                    if let thirteenPo = thirteenPo { chordIntervals.insert(thirteenPo) }

                    allIntervals.append(chordIntervals)
                }
            }
        }
        return allIntervals
    }()

    public static let allIntervals: [Set<Interval>] = {

        var allIntervals: [Set<Interval>] = []
        for basicInterval in ChordPreset.basicIntervals {
            for tensionInterval in ChordPreset.tensionIntervals {

                let fullInterval = basicInterval.union(tensionInterval)
                allIntervals.append(fullInterval)
            }
        }
        return allIntervals
    }()

    public let basicChords: [Chord]
    public let allChords: [Chord]

    public init(rootNote: Note = .C3) {

        self.basicChords = ChordPreset.basicIntervals.map({ intervals in
            Chord(root: rootNote, intervals: intervals)
        })

        self.allChords = ChordPreset.allIntervals.map({ intervals in
            Chord(root: rootNote, intervals: intervals)
        })
    }

}
