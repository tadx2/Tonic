//
//  Intervals.swift
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

import Foundation

public typealias Intervals = Set<Interval>


extension Intervals {

    public mutating func deleteInterval(by degreeInt: ChordDegreeInt) {
        self = self.filter { $0.degreeInt != degreeInt }
    }

    public func hasInterval(of degreeInt: ChordDegreeInt) -> Bool {
        self.contains { $0.degreeInt == degreeInt }
    }

    public func getInterval(of degreeInt: ChordDegreeInt) -> [Interval] {
        self.filter { $0.degreeInt == degreeInt }
    }

    public mutating func changeInterval(of interval: Interval) {
        guard self.hasInterval(of: interval.degreeInt) else { return }
        self.deleteInterval(by: interval.degreeInt)
        self.insert(interval)
    }

}

// Convienet
extension Intervals {

    public static let x: Set<Interval> = [.P1, .M3, .P5]
    public static let xM: Set<Interval> = [.P1, .M3, .P5]
    public static let xm: Set<Interval> = [.P1, .m3, .P5]
    public static let xdim: Set<Interval> = [.P1, .m3, .d5]

    public static let xM7: Set<Interval> = [.P1, .M3, .P5, .M7]
    public static let xM7_M9: Set<Interval> = [.P1, .M3, .P5, .M7, .M9]
    public static let xM7_M13: Set<Interval> = [.P1, .M3, .P5, .M7, .M13]
    public static let xM7_M9_M13: Set<Interval> = [.P1, .M3, .P5, .M7, .M9, .M13]
    public static let xM7_M9_P11: Set<Interval> = [.P1, .M3, .P5, .M7, .M9, .P11]
    public static let xM7_M9_P11_M13: Set<Interval> = [.P1, .M3, .P5, .M7, .M9, .P11, .M13]

    public static let xm7: Set<Interval> = [.P1, .m3, .P5, .m7]
    public static let xm7_M9: Set<Interval> = [.P1, .m3, .P5, .m7, .M9]
    public static let xm7_M13: Set<Interval> = [.P1, .m3, .P5, .m7, .M13]
    public static let xm7_M9_M13: Set<Interval> = [.P1, .m3, .P5, .m7, .M13]
    public static let xm7_M9_P11: Set<Interval> = [.P1, .m3, .P5, .m7, .M9, .P11]
    public static let xm7_M9_P11_M13: Set<Interval> = [.P1, .m3, .P5, .m7, .M9, .P11, .M13]

    public static let x7: Set<Interval> = [.P1, .M3, .P5, .m7]
    public static let x7_M9: Set<Interval> = [.P1, .M3, .P5, .m7, .M9]
    public static let x7_M9_P11: Set<Interval> = [.P1, .M3, .P5, .m7, .M9, .P11]
    public static let x7_M9_M13: Set<Interval> = [.P1, .M3, .P5, .m7, .M9, .M13]
    public static let x7_M9_P11_M13: Set<Interval> = [.P1, .M3, .P5, .m7, .M9, .P11, .M13]

    public static let xdim7: Set<Interval> = [.P1, .m3, .d5, .d7]

    // Sus2
    public static let xSus2: Set<Interval> = [.P1, .M2, .P5]
    public static let xSus2_M9: Set<Interval> = [.P1, .M2, .P5, .M9]

    // Sus4
    public static let xSus4: Set<Interval> = [.P1, .P4, .P5]
    public static let xSus4_P11: Set<Interval> = [.P1, .P4, .P5, .P11]

    public static let x7sharp9flat13: Set<Interval> = [.P1, .M3, .P5, .m7, .m9, .m13]

}



// Chord Property 1 - 基础性质

//extension Intervals {
//
//    /// **属和弦（Dominant）**
//    /// 核心标志是「大三度（.M3）+ 小七度（.m7）」，而在实际演奏和进阶和弦（如 7#5, 7b5）中，完全五度（.P5）常常被省略或变化（变为 .A5 或 .d5）。因此不应强制要求包含 .P5。
//    /// 另外还需要考虑挂留属和弦（7sus4, 7sus2）的情况。
//    var isDominant: Bool {
//        // 属和弦必须包含小七度
//        guard self.contains(.m7) else { return false }
//
//        // 常规的属和弦包含大三度
//        if self.contains(.M3) { return true }
//
//        // 挂二/挂四属和弦包含大二度或纯四度。为了避免误判小七和弦，需确保它不包含小三度
//        if !self.contains(.m3) && (self.contains(.P4) || self.contains(.M2)) {
//            return true
//        }
//
//        return false
//    }
//
//    /// **大和弦（Major）**
//    /// 包含大三度（.M3）或大七度（.M7），且不包含小七度（如果包含通常为属和弦），不包含小三度（小和弦）
//    var isMajor: Bool {
//        if self.contains(.m3) || self.contains(.m7) { return false }
//        return self.contains(.M3) || self.contains(.M7)
//    }
//
//    /// **小和弦（Minor）**
//    /// 包含小三度（.m3），且排除减类和半减七类和弦
//    var isMinor: Bool {
//        guard self.contains(.m3) else { return false }
//        return !self.isDiminished && !self.isHalfDiminished
//    }
//
//    /// **减和弦（Diminished）**
//    /// 包括了减三及它的所有的延伸和弦（如 dim, dim6, dim7 等）。
//    /// 核心是包含小三度（.m3）和减五度（.d5），且必须排除包含小七度（半减七 m7b5）或大七度（mM7b5）特性的和弦。
//    var isDiminished: Bool {
//        return self.contains(.m3) && self.contains(.d5) && !self.contains(.m7) && !self.contains(.M7)
//    }
//
//    /// **半减七和弦（Half-Diminished / m7b5）**
//    /// 同时包含小三度（.m3）、减五度（.d5）和小七度（.m7）
//    var isHalfDiminished: Bool {
//        return self.contains(.m3) && self.contains(.d5) && self.contains(.m7)
//    }
//
//    /// **增和弦（Augmented）**
//    /// 包含大三度（.M3）和增五度（.A5）
//    var isAugmented: Bool {
//        return self.contains(.M3) && self.contains(.A5)
//    }
//
//    /// **Alt 和弦（Altered）**
//    /// 包含以下任意一个变化音：♭5(.d5), ♯5(.A5), ♭9(.m9), ♯9(.A9), ♯11(.A11), ♭13(.m13)
//    var isAlt: Bool {
//        return self.contains(.d5)
//            || self.contains(.A5)
//            || self.contains(.m9)
//            || self.contains(.A9)
//            || self.contains(.A11)
//            || self.contains(.m13)
//    }
//
//    var altValue: Int? { // 判断这个和弦的alt复杂不复杂，常用的数值要小
//        guard isAlt else { return nil }
//        // 变化音的集合，计算含有的数量；含得越少越常用，数值越小
//        let altIntervals: [Interval] = [.d5, .A5, .m9, .A9, .A11, .m13]
//        let count = altIntervals.filter { self.contains($0) }.count
//        return count
//    }
//
//    /// ** 挂留和弦（Sus）**
//    /// 包含纯四度(.P4) 或 大二度(.M2) 或则都不含，且不包含大三度(.M3) 或则 小三度(.m3)
//    var isSus: Bool {
//        guard !self.contains(.M3) || !self.contains(.m3) else { return false }
//
//        return (
//            self.contains(.P4) // 含4度
//            || self.contains(.M2) // 含2度
//            || ( !self.contains(.P4) && !self.contains(.M2) ) // 都没有
//        )
//    }
//
//}
//
//// Chord Property 2 - 构成音复杂
//
//extension Intervals {
//
//    /// **三和弦（Triad）**
//    var isTriad: Bool {
//        triadIntervalsAll.contains(self)
//    }
//
//    /// **七和弦（Seventh）**
//    var isSeventh: Bool {
//        seventhIntervalsAll.contains(self)
//    }
//
//    /// **六和弦（Sixth）**
//    var isSixth: Bool {
//        sixthIntervalsAll.contains(self)
//    }
//
//    /// **延伸音和弦（Tensioned）**
//    var isTensioned: Bool {
//        self.hasInterval(of: 9) || self.hasInterval(of: 11) || self.hasInterval(of: 13)
//    }
//
//    var tensionedValue: Int? { // 判断这个和弦的tension复杂不复杂, 最简单数值要小
//
//        guard isTensioned else { return nil }
//
//        var score = 0
//
//        // ── 9度 ──
//        if self.contains(.m9)      { score += -1 }  // ♭9
//        else if self.contains(.M9) { score +=  0 }  // ♮9
//        else if self.contains(.A9) { score += +1 }  // ♯9
//
//        // ── 13度 ──
//        if self.contains(.m13)      { score += 9}  // ♭13
//        else if self.contains(.M13) { score += 10 }  // ♮13
//        else if self.contains(.A13) { score += 11 }  // ♯13
//
//        // ── 11度 ──
//        if self.contains(.A11)      { score += 19 }  // ♯11（Lydian，最常用）
//        else if self.contains(.P11) { score += 20 }  // ♮11
//        else if self.contains(.d11) { score += 21 }  // ♭11（极罕见）
//
//        return score
//
//    }
//
//}
