//
//  Interval.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/9/2.
//

import Foundation

/// Represents the interval between two notes.
public struct Interval: Hashable, Sendable {

    public let degreeInt: Int
    public let semitones: Int
    
    public init(degree: Int, semitones: Int) {
        self.degreeInt = degree
        self.semitones = semitones
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
    var descriptionNumber: String {
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

    //        5音index:4    9音index:7
    //              ｜        ｜
    // [0, 2, 4, 5, 7, 9, 11, 14, 17, 21] <- 检查用的rawDNA
    //        |           ｜           ｜
    //     3音 index:2  7音 index:6   13音 index:9
    
    // MARK: Unison
    /// Perfect Unison (P1)
    public static let P1 = Interval(degree: 1, semitones: 0) // 纯一度

    // MARK: Seconds
    /// Diminished Second (d2) - Enharmonically P1
    public static let d2 = Interval(degree: 2, semitones: 0) // 减二度
    /// Minor Second (m2)
    public static let m2 = Interval(degree: 2, semitones: 1) // 小二度
    /// Major Second (M2)
    public static let M2 = Interval(degree: 2, semitones: 2) // 大二度 <- M2
    /// Augmented Second (A2)
    public static let A2 = Interval(degree: 2, semitones: 3) // 增二度

    // MARK: Thirds
    /// Diminished Third (d3)
    public static let d3 = Interval(degree: 3, semitones: 2) // 减三度
    /// Minor Third (m3)
    public static let m3 = Interval(degree: 3, semitones: 3) // 小三度
    /// Major Third (M3)
    public static let M3 = Interval(degree: 3, semitones: 4) // 大三度 <- M3
    /// Augmented Third (A3)
    public static let A3 = Interval(degree: 3, semitones: 5) // 增三度

    // MARK: Fourths
    /// Diminished Fourth (d4)
    public static let d4 = Interval(degree: 4, semitones: 4) // 减四度
    /// Perfect Fourth (P4)
    public static let P4 = Interval(degree: 4, semitones: 5) // 纯四度 <- P4
    /// Augmented Fourth (A4) - Tritone
    public static let A4 = Interval(degree: 4, semitones: 6) // 增四度 (三全音)

    // MARK: Fifths
    /// Diminished Fifth (d5) - Tritone
    public static let d5 = Interval(degree: 5, semitones: 6) // 减五度 (三全音)
    /// Perfect Fifth (P5)
    public static let P5 = Interval(degree: 5, semitones: 7) // 纯五度 <- P5
    /// Augmented Fifth (A5)
    public static let A5 = Interval(degree: 5, semitones: 8) // 增五度

    // MARK: Sixths
    /// Diminished Sixth (d6)
    public static let d6 = Interval(degree: 6, semitones: 7 ) // 减六度
    /// Minor Sixth (m6)
    public static let m6 = Interval(degree: 6, semitones: 8 ) // 小六度
    /// Major Sixth (M6)
    public static let M6 = Interval(degree: 6, semitones: 9 ) // 大六度 <- M6
    /// Augmented Sixth (A6)
    public static let A6 = Interval(degree: 6, semitones: 10) // 增六度

    // MARK: Sevenths
    /// Diminished Seventh (d7)
    public static let d7 = Interval(degree: 7, semitones: 9 ) // 减七度
    /// Minor Seventh (m7)
    public static let m7 = Interval(degree: 7, semitones: 10) // 小七度
    /// Major Seventh (M7)
    public static let M7 = Interval(degree: 7, semitones: 11) // 大七度 <- M7
    /// Augmented Seventh (A7)
    public static let A7 = Interval(degree: 7, semitones: 12) // 增七度
    
    // MARK: Octaves
    /// Perfect Octave (P8)
    public static let P8 = Interval(degree: 8, semitones: 12) // 纯八度 <- P8
    
    // MARK: Ninths
    /// Diminished Ninth (d9)
    public static let d9 = Interval(degree: 9, semitones: 12) // 减九度
    /// Minor Ninth (m9)
    public static let m9 = Interval(degree: 9, semitones: 13) // 小九度
    /// Major Ninth (M9)
    public static let M9 = Interval(degree: 9, semitones: 14) // 大九度 <- M9
    /// Augmented Ninth (A9)
    public static let A9 = Interval(degree: 9, semitones: 15) // 增九度

    // MARK: Elevenths
    /// Diminished Eleventh (d11)
    public static let d11 = Interval(degree: 11, semitones: 16) // 减十一度
    /// Perfect Eleventh (P11)
    public static let P11 = Interval(degree: 11, semitones: 17) // 纯十一度 <- P11
    /// Augmented Eleventh (A11)
    public static let A11 = Interval(degree: 11, semitones: 18) // 增十一度
    
    // MARK: Thirteenths
    /// Diminished Thirteenth (d13)
    public static let d13 = Interval(degree: 13, semitones: 19) // 减十三度
    /// Minor Thirteenth (m13)
    public static let m13 = Interval(degree: 13, semitones: 20) // 小十三度
    /// Major Thirteenth (M13)
    public static let M13 = Interval(degree: 13, semitones: 21) // 大十三度 <- M13
    /// Augmented Thirteenth (A13)
    public static let A13 = Interval(degree: 13, semitones: 22) // 增十三度
    
    // MARK: Fifteenths
    /// Perfect Fifteenth (P15)
    public static let P15 = Interval(degree: 15, semitones: 24) // 纯十五度 <- P15
}
