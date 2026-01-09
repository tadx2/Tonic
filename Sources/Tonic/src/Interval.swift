//
//  Interval.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/9/2.
//

import Foundation

public struct Interval: Sendable, Hashable, Comparable {
    public let degreeInt: Int
    public let semitones: Int

    public init(degreeInt: Int, semitones: Int) {
        self.degreeInt = degreeInt
        self.semitones = semitones
    }

    public static func < (lhs: Interval, rhs: Interval) -> Bool {
        if lhs.degreeInt != rhs.degreeInt {
            return lhs.degreeInt < rhs.degreeInt
        }
        return lhs.semitones < rhs.semitones
    }
}

// MARK: - CustomStringConvertible
extension Interval: CustomStringConvertible {

    /// 大调音阶各度数对应的标准半音数（1度到13度）。
    /// 用于计算音程性质（大、小、纯、增、减）。
    /// 索引 0-6 对应 1-7 度，索引 7-9 对应 9, 11, 13 度。
    public static let NormalizedSemitone = [0, 2, 4, 5, 7, 9, 11, 14, 17, 21]

    /// 计算实际半音数与标准大调/纯音程半音数之间的差异。
    /// 结果归一化在 [-6, 6] 范围内，以处理八度翻转的情况（例如：增七度 A7 与 纯八度 P8 的关系）。
    private var qualityDifference: Int {
        // 将度数映射到 0-6 的基本音级索引
        let diatonicIndex = (self.degreeInt - 1) % 7
        // 获取该音级在大调中的标准半音数
        let expectedMajorSemitones = Interval.NormalizedSemitone[diatonicIndex]
        // 取当前音程半音数对 12 的余数，进行同音级比较
        let actualSemitoneClass = self.semitones % 12
        var diff = actualSemitoneClass - expectedMajorSemitones

        // 归一化差异，确保在音圈上寻找最短路径
        // 例如：实际 0 (C) 减去 标准 11 (B)，diff 为 -11，归一化后为 +1 (表示增一度或增八度方向)
        while diff > 6 { diff -= 12 }
        while diff < -6 { diff += 12 }

        return diff
    }

    /// 音程的完整文本描述（例如："P1", "m2", "M3", "A4", "d5"）。
    public var description: String {
        let diff = self.qualityDifference
        var element: String = ""

        // 获取归一化后的基本度数 (1-7)
        let normalizedDegree = (self.degreeInt - 1) % 7 + 1

        // 判断是纯音程系列（1, 4, 5）还是大小音程系列（2, 3, 6, 7）
        if [1, 4, 5].contains(normalizedDegree) {
            // 纯音程系列：P(纯), A(增), d(减)
            if diff == 0 {
                element = "P"
            } else if diff > 0 {
                element = String(repeating: "A", count: diff)
            } else if diff < 0 {
                element = String(repeating: "d", count: -diff)
            }
        } else {
            // 大小音程系列：M(大), m(小), A(增), d(减)
            if diff == 0 {
                element = "M"
            } else if diff == -1 {
                element = "m"
            } else if diff < -1 {
                element = String(repeating: "d", count: -diff - 1)
            } else if diff > 0 {
                element = String(repeating: "A", count: diff)
            }
        }

        return element + String(self.degreeInt)
    }

    /// 带升降号修饰的度数描述（例如："1", "♭2", "3", "♯4", "♭5"）。
    public var descriptionNumber: String {
        let diff = self.qualityDifference
        var element: String = ""

        // 根据与标准大调音阶的差异添加升降号
        if diff == 0 {
            element = ""
        } else if diff > 0 {
            element = String(repeating: "♯", count: diff)
        } else if diff < 0 {
            element = String(repeating: "♭", count: -diff)
        }

        return element + String(self.degreeInt)
    }
}

// MARK: - Common Intervals in Chord
extension Interval {

    // MARK: Unison
    public static let P1 = Interval(degreeInt: 1, semitones: 0)  // Perfect Unison

    // MARK: Seconds
    public static let d2 = Interval(degreeInt: 2, semitones: 0)
    public static let m2 = Interval(degreeInt: 2, semitones: 1)
    public static let M2 = Interval(degreeInt: 2, semitones: 2)
    public static let A2 = Interval(degreeInt: 2, semitones: 3)

    // MARK: Thirds
    public static let d3 = Interval(degreeInt: 3, semitones: 2)
    public static let m3 = Interval(degreeInt: 3, semitones: 3)
    public static let M3 = Interval(degreeInt: 3, semitones: 4)
    public static let A3 = Interval(degreeInt: 3, semitones: 5)

    // MARK: Fourths
    public static let d4 = Interval(degreeInt: 4, semitones: 4)  //
    public static let P4 = Interval(degreeInt: 4, semitones: 5)  //
    public static let A4 = Interval(degreeInt: 4, semitones: 6)  // Tritone

    // MARK: Fifths
    public static let d5 = Interval(degreeInt: 5, semitones: 6)  // Tritone
    public static let P5 = Interval(degreeInt: 5, semitones: 7)
    public static let A5 = Interval(degreeInt: 5, semitones: 8)

    // MARK: Sixths
    public static let d6 = Interval(degreeInt: 6, semitones: 7)
    public static let m6 = Interval(degreeInt: 6, semitones: 8)
    public static let M6 = Interval(degreeInt: 6, semitones: 9)
    public static let A6 = Interval(degreeInt: 6, semitones: 10)

    // MARK: Sevenths
    public static let d7 = Interval(degreeInt: 7, semitones: 9)
    public static let m7 = Interval(degreeInt: 7, semitones: 10)
    public static let M7 = Interval(degreeInt: 7, semitones: 11)
    public static let A7 = Interval(degreeInt: 7, semitones: 12)

    // MARK: Octaves     -> Degree = 1
    public static let P8 = Interval(degreeInt: 8, semitones: 12)

    // MARK: Ninths      -> Degree = 2
    public static let d9 = Interval(degreeInt: 9, semitones: 12)
    public static let m9 = Interval(degreeInt: 9, semitones: 13)
    public static let M9 = Interval(degreeInt: 9, semitones: 14)
    public static let A9 = Interval(degreeInt: 9, semitones: 15)

    // MARK: Tenths      -> Degree = 3
    public static let d10 = Interval(degreeInt: 10, semitones: 14)
    public static let m10 = Interval(degreeInt: 10, semitones: 15)
    public static let M10 = Interval(degreeInt: 10, semitones: 16)
    public static let A10 = Interval(degreeInt: 10, semitones: 17)

    // MARK: Elevenths   -> Degree = 4
    public static let d11 = Interval(degreeInt: 11, semitones: 16)
    public static let P11 = Interval(degreeInt: 11, semitones: 17)
    public static let A11 = Interval(degreeInt: 11, semitones: 18)

    // MARK: Twelfth     -> Degree = 5
    public static let d12 = Interval(degreeInt: 12, semitones: 18)
    public static let P12 = Interval(degreeInt: 12, semitones: 19)
    public static let A12 = Interval(degreeInt: 12, semitones: 20)

    // MARK: Thirteenths -> Degree = 6
    public static let d13 = Interval(degreeInt: 13, semitones: 19)
    public static let m13 = Interval(degreeInt: 13, semitones: 20)
    public static let M13 = Interval(degreeInt: 13, semitones: 21)
    public static let A13 = Interval(degreeInt: 13, semitones: 22)

    // MARK: Fourteenth  -> Degree = 7
    public static let d14 = Interval(degreeInt: 14, semitones: 21)
    public static let m14 = Interval(degreeInt: 14, semitones: 22)
    public static let M14 = Interval(degreeInt: 14, semitones: 23)
    public static let A14 = Interval(degreeInt: 14, semitones: 24)

    // MARK: Fifteenths  -> Degree = 1
    public static let P15 = Interval(degreeInt: 15, semitones: 24)
}
