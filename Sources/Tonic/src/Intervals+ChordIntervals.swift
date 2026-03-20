//
//  Intervals+ChordIntervals.swift
//  Tonic
//
//  Created by 小汤汤 on 3/19/26.
//

import Foundation

// Chord Intervals
// Intervals作为Chord的RawIntervals时

// MARK: - Note - Interval & Intervals & Set<Intervals> 概念 & 区分
/// Interval:  **音程**，表示音的距离。
/// Intervals:  **音程组**，是 Set<Interval>，可以用来表示N个音程组成的一个集合，通常表示一个和弦的音程关系。
/// Set<Intervals>： **音程组集合**，可以用来表示N个**音程组**，通常表示N个和弦音程关系。

// MARK: - Note - 如何构造 和弦音程组合
/// **采用多层Map算法结构**
/// map 负责“配”，flatMap 负责“摊平”。map 是“生成一组结果”，flatMap 是“生成很多组结果并把它们拍平成一组”。
///
/// 例如：triadIntervalsSet 计算过程：
///
/// [Interval.P5, .A5, .d5].map 里层Map：给一个 third，配出一整组 [third, fifth]
/// return：
/// [
///  [.M3, .P5], [.M3, .A5], [.M3, .d5]
/// ]
///
/// [Interval.M3, .m3].map 外层Map：配出所有 third
/// return:
/// [
///   [[.M3, .P5], [.M3, .A5], [.M3, .d5]]
///   [[m3, P5], [m3, A5], [m3, d5]]
/// ]
///
/// 类型是：[[[Interval]]]
///
/// 如果采用 flatMap 把 把每次返回的数组“拍平一层”
/// return：
/// [
///   [M3, P5], [M3, A5], [M3, d5],
///   [m3, P5], [m3, A5], [m3, d5]
/// ]


// MARK: - All Chord

// Basic Chord Intervals
let basicIntervalsAll: Set<Intervals> = triadIntervalsAll
                                        .union(seventhIntervalsAll)
                                        .union(sixthIntervalsAll)

// Tensioned Chord Intervals
let tensionedIntervalsAll: Set<Intervals> = {
    
    var result: Set<Intervals> = []
    
    for basic in basicIntervalsAll {
        let tensonedIntervalsSet = basic.addTensions()
        for tensioned in tensonedIntervalsSet {
            result.insert(tensioned)
        }
    }
    
    return result
}()

// MARK: - Triad
let triadIntervalsAll: Set<Intervals> = triadIntervals
                                        .union(triadIntervalsSus)
                                        .union(triadIntervalsSus2)
                                        .union(triadIntervalsSus4)

// 所有正常的 triad 由1/3/5音构成, P1 可以省略
let triadIntervals: Set<Intervals> = Set(
    [Interval.M3, .m3].flatMap { third in
        [Interval.P5, .A5, .d5].map { fifth in
            [third, fifth]
        }
    }
)

// Sus
let triadIntervalsSus: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].map { fifth in
        [fifth]
    }
)

// Sus2
let triadIntervalsSus2: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].map { fifth in
        [.M2, fifth]
    }
)

// Sus4
let triadIntervalsSus4: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].map { fifth in
        [.P4, fifth]
    }
)

// MARK: - Seventh

let seventhIntervalsAll: Set<Intervals> = seventhIntervals
                                          .union(seventhIntervalsSus)
                                          .union(seventhIntervalsSus2)
                                          .union(seventhIntervalsSus4)

// 所有正常的 seventh 由1/3/5/7音构成
let seventhIntervals: Set<Intervals> = Set(
    [Interval.M3, .m3].flatMap { third in
        [Interval.P5, .A5, .d5].flatMap { fifth in
            [Interval.M7, .m7, .d7].map { seventh in
                [third, fifth, seventh]
            }
        }
    }
)

// Sus
let seventhIntervalsSus: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].flatMap { fifth in
        [Interval.M7, .m7, .d7].map { seventh in
            [fifth, seventh]
        }
    }
)

// Sus2
let seventhIntervalsSus2: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].flatMap { fifth in
        [Interval.M7, .m7, .d7].map { seventh in
            [.M2, fifth, seventh]
        }
    }
)

// Sus4
let seventhIntervalsSus4: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].flatMap { fifth in
        [Interval.M7, .m7, .d7].map { seventh in
            [.P4, fifth, seventh]
        }
    }
)

// MARK: - Sixth

let sixthIntervalsAll: Set<Intervals> = sixthIntervals
                                        .union(sixthIntervalsSus)
                                        .union(sixthIntervalsSus2)
                                        .union(sixthIntervalsSus4)

// 所有正常的 six 由1/3/5/6音构成
let sixthIntervals: Set<Intervals> = Set(
    [Interval.M3, .m3].flatMap { third in
        [Interval.P5, .A5, .d5].map { fifth in
            [third, fifth, .M6]
        }
    }
)

// Sus
let sixthIntervalsSus: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].map { fifth in
        [fifth, .M6]
    }
)

// Sus2
let sixthIntervalsSus2: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].map { fifth in
        [.M2, fifth, .M6]
    }
)

// Sus4
let sixthIntervalsSus4: Set<Intervals> = Set(
    [Interval.P5, .A5, .d5].map { fifth in
        [.P4, fifth, .M6]
    }
)

// MARK: - Tension

extension Intervals {
    
    /// **Generate Tension possible Set **
    /// input: ninths/elevenths/thirteenths 代表可能性范围
    /// 根据用户传入的 tension 可能性范围 生成 所有tension 组合可能性
    /// 一个tension 组合 可以由一个9音 或者 11音 或者13音构成。 传入nil，表示可以省略
    static func tensionsSet(ninths: Set<Interval?> = [nil, .m9, .M9, .A9],
                            elevenths:  Set<Interval?> = [nil, .d11, .P11, .A11],
                            thirteenths:  Set<Interval?> = [nil, .m13, .M13, .A13]
    ) -> Set<Intervals> {
        var results: Set<Intervals> = []
        for ninth in ninths {
            for eleventh in elevenths {
                for thirteenth in thirteenths {
                    let intervals = [ninth, eleventh, thirteenth].compactMap { $0 }
                    results.insert(Set(intervals))
                }
            }
        }
        return results
    }
    
    /// **Add Tensions To A Specific Intervals 为某个Intervals添加多个Tension 并组成一组新的 Intervals **
    // 给当前的一组音程（Intervals）添加所有的 tensions 可能性，并返回包含所有可能组合的集合
    func addTensions(ninths: Set<Interval?> = [nil, .m9, .M9, .A9],
                     elevenths:  Set<Interval?> = [nil, .d11, .P11, .A11],
                     thirteenths:  Set<Interval?> = [nil, .m13, .M13, .A13]
    ) -> Set<Intervals> {
        let tensionSet = Self.tensionsSet(ninths: ninths, elevenths: elevenths, thirteenths: thirteenths)
        var results: Set<Intervals> = []
        for tensionIntervals in tensionSet {
            results.insert(self.union(tensionIntervals))
        }
        return results
    }
    
}

// MARK: - Sort
/// 当多个Intervals在一起组成一个 Set<Intervals> 的时候，考虑要对 Set<Intervals>进行排序
extension Set<Intervals> {
    // 音程数量 count Intervals.count 越少越简单, 可以排在前面
    public func sortedByCount() -> [Intervals] {
        return self.sorted { $0.count < $1.count }
    }
}





