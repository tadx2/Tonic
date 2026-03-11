//
//  IntervalPreset.swift
//  Tonic
//
//  Created by 小汤汤 on 3/3/26.
//

import Foundation
import Tonic

public struct IntervalPreset {

    public static let thirdPos: [Interval] = [.M3, .m3]
    public static let fifthPos: [Interval] = [.P5, .d5, .A5]
    public static let seventhPos: [Interval] = [.M7, .m7, .d7]

    public static let ninePos: [Interval?] = [nil, .M9, .m9, .A9]
    public static let elevenPos: [Interval?] = [nil, .P11, .A11]
    public static let thirteenPos: [Interval?] = [nil, .M13, .m13, .A13]

    // MARK: - 通用生成方法

    /// 生成音程组合（没有sus）
    /// - Parameters:
    ///   - extraIntervals: 额外固定音程（如 .M6 用于6和弦，.M7/.m7/.d7 用于7和弦）
    ///   - extraPositions: 额外的音程位置数组（如 seventhPos）
    private static func generateIntervalsWithoutSus(
        extraIntervals: Set<Interval> = [],
        extraPositions: [[Interval]] = []
    ) -> [Set<Interval>] {
        var allIntervals: [Set<Interval>] = []

        // 递归生成 extraPositions 的所有组合
        func build(_ current: Set<Interval>, _ posIndex: Int) {
            if posIndex == extraPositions.count {
                // 已经遍历完所有 extraPositions，现在遍历 fifth × third
                for fifthPo in fifthPos {
                    for thirdPo in thirdPos {
                        var chordIntervals = current
                        chordIntervals.insert(thirdPo)
                        chordIntervals.insert(fifthPo)
                        allIntervals.append(chordIntervals)
                    }
                }
                return
            }
            for interval in extraPositions[posIndex] {
                var next = current
                next.insert(interval)
                build(next, posIndex + 1)
            }
        }

        build(extraIntervals, 0)
        return allIntervals
    }

    /// 生成音程组合（sus2 or sus4）
    /// - Parameters:
    ///   - susInterval: sus音程（.M2 = sus2, .P4 = sus4）
    ///   - extraIntervals: 额外固定音程
    ///   - extraPositions: 额外的音程位置数组
    private static func generateIntervalsWithSus(
        susInterval: Interval,
        extraIntervals: Set<Interval> = [],
        extraPositions: [[Interval]] = []
    ) -> [Set<Interval>] {
        var allIntervals: [Set<Interval>] = []

        func build(_ current: Set<Interval>, _ posIndex: Int) {
            if posIndex == extraPositions.count {
                for fifthPo in fifthPos {
                    var chordIntervals = current
                    chordIntervals.insert(susInterval)
                    chordIntervals.insert(fifthPo)
                    allIntervals.append(chordIntervals)
                }
                return
            }
            for interval in extraPositions[posIndex] {
                var next = current
                next.insert(interval)
                build(next, posIndex + 1)
            }
        }

        build(extraIntervals, 0)
        return allIntervals
    }

    /// 生成所有sus变体（无sus + sus2 + sus4）
    private static func generateAllSusVariants(
        extraIntervals: Set<Interval> = [],
        extraPositions: [[Interval]] = []
    ) -> (
        withoutSus: [Set<Interval>], sus2: [Set<Interval>], sus4: [Set<Interval>],
        all: [Set<Interval>]
    ) {
        let withoutSus = generateIntervalsWithoutSus(
            extraIntervals: extraIntervals, extraPositions: extraPositions)
        let sus2 = generateIntervalsWithSus(
            susInterval: .M2, extraIntervals: extraIntervals, extraPositions: extraPositions)
        let sus4 = generateIntervalsWithSus(
            susInterval: .P4, extraIntervals: extraIntervals, extraPositions: extraPositions)
        return (withoutSus, sus2, sus4, withoutSus + sus2 + sus4)
    }

    // MARK: - 3和弦 (Triad)

    private static let triadVariants = generateAllSusVariants()

    public static let allTraidIntervalsWithoutSus: [Set<Interval>] = triadVariants.withoutSus
    public static let allTraidIntervalsSus2: [Set<Interval>] = triadVariants.sus2
    public static let allTraidIntervalsSus4: [Set<Interval>] = triadVariants.sus4
    public static let allTraidIntervals: [Set<Interval>] = triadVariants.all

    // MARK: - 7和弦 (Seventh)

    private static let seventhVariants = generateAllSusVariants(extraPositions: [seventhPos])

    public static let allSeventhIntervalsWithoutSus: [Set<Interval>] = seventhVariants.withoutSus
    public static let allSeventhIntervalsSus2: [Set<Interval>] = seventhVariants.sus2
    public static let allSeventhIntervalsSus4: [Set<Interval>] = seventhVariants.sus4
    public static let allSeventhIntervals: [Set<Interval>] = seventhVariants.all

    // MARK: - 6和弦 (Sixth)

    private static let sixthVariants = generateAllSusVariants(extraIntervals: [.M6])

    public static let allSixthIntervalsWithoutSus: [Set<Interval>] = sixthVariants.withoutSus
    public static let allSixthIntervalsSus2: [Set<Interval>] = sixthVariants.sus2
    public static let allSixthIntervalsSus4: [Set<Interval>] = sixthVariants.sus4
    public static let allSixthIntervals: [Set<Interval>] = sixthVariants.all

    // MARK: - 所有基础和弦（7音以及以下的音程组合）

    public static let allBasicIntervals: [Set<Interval>] = {
        allTraidIntervals + allSeventhIntervals + allSixthIntervals
    }()

    // MARK: - 所有tension情况

    public static let allTensionIntervals: [Set<Interval>] = {
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

    // MARK: - 所有interval情况

    public static let allIntervals: [Set<Interval>] = {
        var allIntervals: [Set<Interval>] = []
        for basicInterval in IntervalPreset.allBasicIntervals {
            for tensionInterval in IntervalPreset.allTensionIntervals {
                let fullInterval = basicInterval.union(tensionInterval)
                allIntervals.append(fullInterval)
            }
        }
        return allIntervals
    }()

    // MARK: - Instance

    public let intervals: [Set<Interval>]

    public init(type: BasicChordType = .traid, sus: SusType? = nil, isWithTension: Bool = false) {

        let basicIntervals: [Set<Interval>] = IntervalPreset.intervalsFor(type: type, sus: sus)

        if isWithTension {
            var result: [Set<Interval>] = []
            for basic in basicIntervals {
                for tension in IntervalPreset.allTensionIntervals {
                    let fullInterval = basic.union(tension)
                    result.append(fullInterval)
                }
            }
            self.intervals = result
        } else {
            self.intervals = basicIntervals
        }
    }

    // MARK: - 根据 type 和 sus 获取对应的音程组合

    private static func intervalsFor(type: BasicChordType = .traid,
                                     sus: SusType? = nil) -> [Set<Interval>] {
        switch type {
        case .traid:
            switch sus {
            case .sus2: return allTraidIntervalsSus2
            case .sus4: return allTraidIntervalsSus4
            case .all: return allTraidIntervals
            case .none: return allTraidIntervalsWithoutSus
            }
        case .seventh:
            switch sus {
            case .sus2: return allSeventhIntervalsSus2
            case .sus4: return allSeventhIntervalsSus4
            case .all: return allSeventhIntervals
            case .none: return allSeventhIntervalsWithoutSus
            }
        case .six:
            switch sus {
            case .sus2: return allSixthIntervalsSus2
            case .sus4: return allSixthIntervalsSus4
            case .all: return allSixthIntervals
            case .none: return allSixthIntervalsWithoutSus
            }
        case .all:
            switch sus {
            case .sus2:
                return allTraidIntervalsSus2 + allSeventhIntervalsSus2 + allSixthIntervalsSus2
            case .sus4:
                return allTraidIntervalsSus4 + allSeventhIntervalsSus4 + allSixthIntervalsSus4
            case .all: return allTraidIntervals + allSeventhIntervals + allSixthIntervals
            case .none:
                return allTraidIntervalsWithoutSus + allSeventhIntervalsWithoutSus
                    + allSixthIntervalsWithoutSus
            }
        }
    }

    // MARK: - Enums

    public enum BasicChordType {
        case traid, seventh, six, all
    }

    public enum SusType {
        case sus2, sus4, all
    }

}
