//
//  Tempo.swift
//  Tonic
//
//  Created by 小汤汤 on 1/29/26.
//

import Foundation

public struct Tempo: Sendable {

    // 一共多少小节
    public var sections: Int?

    // 每小节有多少拍
    public var numerator: Int

    // 多少音符 为一拍
    public var denominator: Int

    // Beats Per Minute, 每分钟的拍数,是衡量节奏快慢的单位
    public var bpm: Double

    public init(sections: Int? = nil, numerator: Int, denominator: Int, bpm: Double) {
        self.sections = sections
        self.numerator = numerator
        self.denominator = denominator
        self.bpm = bpm
    }

}

extension Tempo {

    // /// 整个曲子一共多少拍 = 小节 *  每个小节多少拍
    // public var totalBeats: Int? {
    //     guard let sections = self.sections else { return nil }
    //     return sections * numerator
    // }

    // // 整个曲子 要持续多长时间
    // public var sechondsAllBeats: Double? {
    //     guard let totalBeats = self.totalBeats else { return nil }
    //     return Double(totalBeats) * secondsPerBeat
    // }

    // 一拍等于几秒.
    public var secondsPerBeat: Double {
        60.0 / bpm
    }
}

extension Tempo {
    public static let fourFour = Tempo(sections: nil, numerator: 4, denominator: 4, bpm: 60)
}

// Others
extension Tempo {

    /// 传入几分音符，计算几分音符的时长.
    ///  例如：4分音符， 传入 1/4， 8分音符，传入1/8 。 全音符，传入 1.
    //    public func secondsPerXNote(by noteValue: Double) -> Double {
    //        return secondsPerBeat / noteValue
    //    }

}
