//
//  IntervalPreset.swift
//  Tonic
//
//  Created by 小汤汤 on 3/3/26.
//

import Foundation

public struct IntervalPreset {

    public static let thirdPos: [Interval] = [.M3, .m3]
    public static let fifthPos: [Interval] = [.P5, .d5, .A5]
    public static let seventhPos: [Interval] = [.M7, .m7, .d7]

    public static let ninePos: [Interval?] = [nil, .M9, .m9, .A9]
    public static let elevenPos: [Interval?] = [nil, .P11, .A11]
    public static let thirteenPos: [Interval?] = [nil, .M13, .m13, .A13]

    private static func makeSusVariants(from withoutSus: [Set<Interval>]) -> (
        withoutSus: [Set<Interval>],
        sus: [Set<Interval>],
        sus2: [Set<Interval>],
        sus4: [Set<Interval>],
        all: [Set<Interval>]
    ) {
        var seen = Set<Set<Interval>>()
        let rawSus = withoutSus.map { $0.subtracting([.M3, .m3]) }
        let sus = rawSus.filter { seen.insert($0).inserted }

        let sus2 = sus.map {
            var result = $0
            result.insert(.M2)
            return result
        }
        let sus4 = sus.map {
            var result = $0
            result.insert(.P4)
            return result
        }
        let all = withoutSus + sus + sus2 + sus4
        return (withoutSus, sus, sus2, sus4, all)
    }

    // MARK: - 3和弦 (Triad)

    public static let traidIntervalsNoSus: [Set<Interval>] = {
        var result: [Set<Interval>] = []
        for fifthPo in fifthPos {
            for thirdPo in thirdPos {
                result.append([thirdPo, fifthPo])
            }
        }
        return result
    }()

    private static let traidVariants = makeSusVariants(from: traidIntervalsNoSus)

    public static let traidIntervalsSus: [Set<Interval>] = traidVariants.sus
    public static let traidIntervalsSus2: [Set<Interval>] = traidVariants.sus2
    public static let traidIntervalsSus4: [Set<Interval>] = traidVariants.sus4
    public static let traidIntervals: [Set<Interval>] = traidVariants.all

    // MARK: - 7和弦 (Seventh)

    public static let seventhIntervalsNoSus: [Set<Interval>] = {
        var result: [Set<Interval>] = []
        for seventhPo in seventhPos {
            for triadInterval in traidIntervalsNoSus {
                var intervals = triadInterval
                intervals.insert(seventhPo)
                result.append(intervals)
            }
        }
        return result
    }()

    private static let seventhVariants = makeSusVariants(from: seventhIntervalsNoSus)

    public static let seventhIntervalsSus: [Set<Interval>] = seventhVariants.sus
    public static let seventhIntervalsSus2: [Set<Interval>] = seventhVariants.sus2
    public static let seventhIntervalsSus4: [Set<Interval>] = seventhVariants.sus4
    public static let seventhIntervals: [Set<Interval>] = seventhVariants.all

    // MARK: - 6和弦 (Sixth)

    public static let sixthIntervalsNoSus: [Set<Interval>] = {
        var result: [Set<Interval>] = []
        for triadInterval in traidIntervalsNoSus {
            var intervals = triadInterval
            intervals.insert(.M6)
            result.append(intervals)
        }
        return result
    }()

    private static let sixthVariants = makeSusVariants(from: sixthIntervalsNoSus)

    public static let sixthIntervalsSus: [Set<Interval>] = sixthVariants.sus
    public static let sixthIntervalsSus2: [Set<Interval>] = sixthVariants.sus2
    public static let sixthIntervalsSus4: [Set<Interval>] = sixthVariants.sus4
    public static let sixthIntervals: [Set<Interval>] = sixthVariants.all

    // MARK: - 所有基础和弦（7音以及以下的音程组合）

    public static let allBasicIntervals: [Set<Interval>] = {
        traidIntervals + seventhIntervals + sixthIntervals
    }()

    // MARK: - 所有tension情况

    public static let allTensionIntervals: [Set<Interval>] = {
        var result: [Set<Interval>] = []
        for thirteenPo in thirteenPos {
            for elevenPo in elevenPos {
                for ninePo in ninePos {
                    var intervals: Set<Interval> = []
                    if let ninePo { intervals.insert(ninePo) }
                    if let elevenPo { intervals.insert(elevenPo) }
                    if let thirteenPo { intervals.insert(thirteenPo) }
                    result.append(intervals)
                }
            }
        }
        return result
    }()

    // MARK: - 所有interval情况

    public static let allIntervals: [Set<Interval>] = {
        var result: [Set<Interval>] = []
        for basicInterval in allBasicIntervals {
            for tensionInterval in allTensionIntervals {
                result.append(basicInterval.union(tensionInterval))
            }
        }
        return result
    }()

    // MARK: - Instance

    public let intervals: [Set<Interval>]

    public init(type: BasicChordType = .all, sus: SusType? = .all, isWithTension: Bool = true) {
        let basicIntervals: [Set<Interval>] = IntervalPreset.intervalsFor(type: type, sus: sus)
        if isWithTension {
            var result: [Set<Interval>] = []
            for basic in basicIntervals {
                for tension in IntervalPreset.allTensionIntervals {
                    result.append(basic.union(tension))
                }
            }
            self.intervals = result
        } else {
            self.intervals = basicIntervals
        }
    }

    // MARK: - 根据 type 和 sus 获取对应的音程组合

    private static func intervalsFor(
        type: BasicChordType = .traid,
        sus: SusType? = nil
    ) -> [Set<Interval>] {
        switch type {
        case .traid:
            switch sus {
            case .sus: return traidIntervalsSus
            case .sus2: return traidIntervalsSus2
            case .sus4: return traidIntervalsSus4
            case .all: return traidIntervals
            case .none: return traidIntervalsNoSus
            }
        case .seventh:
            switch sus {
            case .sus: return seventhIntervalsSus
            case .sus2: return seventhIntervalsSus2
            case .sus4: return seventhIntervalsSus4
            case .all: return seventhIntervals
            case .none: return seventhIntervalsNoSus
            }
        case .six:
            switch sus {
            case .sus: return sixthIntervalsSus
            case .sus2: return sixthIntervalsSus2
            case .sus4: return sixthIntervalsSus4
            case .all: return sixthIntervals
            case .none: return sixthIntervalsNoSus
            }
        case .all:
            switch sus {
            case .sus:
                return traidIntervalsSus + seventhIntervalsSus + sixthIntervalsSus
            case .sus2:
                return traidIntervalsSus2 + seventhIntervalsSus2 + sixthIntervalsSus2
            case .sus4:
                return traidIntervalsSus4 + seventhIntervalsSus4 + sixthIntervalsSus4
            case .all:
                return traidIntervals + seventhIntervals + sixthIntervals
            case .none:
                return traidIntervalsNoSus + seventhIntervalsNoSus + sixthIntervalsNoSus
            }
        }
    }

    // MARK: - Enums

    public enum BasicChordType: CaseIterable {
        case traid, seventh, six, all
    }

    public enum SusType: CaseIterable {
        case sus, sus2, sus4, all
    }

}
