//
//  NoteInterval.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/9/2.
//

import Foundation

/// Represents the interval between two notes.
///
/// An interval is defined by its diatonic degree (e.g., 2nd, 3rd, 5th) and its size in semitones.
/// This structure allows for distinguishing between enharmonically equivalent intervals like Augmented 4th (A4) and Diminished 5th (d5).
public struct NoteInterval: Hashable, Sendable {

    /// The diatonic degree of the interval.
    public let degree: Int

    /// The number of semitones from the root (Perfect Unison).
    ///
    /// Examples:
    /// - Minor 2nd (m2): 1 semitone
    /// - Major 7th (M7): 11 semitones
    /// - Perfect Octave (P8): 12 semitones
    public let semitones: Int
    
    /// The index of this interval's degree in a standard "Chord DNA" raw array.
    /// 对应的degree 在 chordRawDna中的index的位置
    ///
    /// chordRawDna: [Int?] 的一般序列化为 [0, 2, 4, 5, 7, 9, 11, 14, 17, 21] 这是一个 X10 个元素的Int？数组
    ///
    /// 例如：
    /// degree = 1, degreeIndexInChordRawDna = nil  表示 1音在 chordRawDna 中没有位置
    /// degree = 2, degreeIndexInChordRawDna = 1    表示 2音在 chordRawDna 中的 index = 1
    /// degree = 3, degreeIndexInChordRawDna = 2    表示 3音在 chordRawDna 中的 index = 2
    /// degree = 4, degreeIndexInChordRawDna = 3    表示 4音在 chordRawDna 中的 index = 3
    /// degree = 5, degreeIndexInChordRawDna = 4    表示 5音在 chordRawDna 中的 index = 4
    /// degree = 6, degreeIndexInChordRawDna = 5
    /// degree = 7, degreeIndexInChordRawDna = 6
    /// degree = 8, degreeIndexInChordRawDna = nil   表示 8音在 chordRawDna 中没有位置
    /// degree = 9, degreeIndexInChordRawDna = 7     表示 9音在 chordRawDna 中的 index = 7
    /// degree = 11, degreeIndexInChordRawDna = 8    表示 11音在 chordRawDna 中的 index = 8
    /// degree = 13, degreeIndexInChordRawDna = 9    表示 13音在 chordRawDna 中的 index = 9
    ///
    let degreeIndexInChordRawDna: Int?
    
    /// Initializes a new NoteInterval.
    ///
    /// - Parameters:
    ///   - degree: The diatonic degree (e.g., 1, 3, 5).
    ///   - semitones: The distance in semitones from the root.
    ///   - degreeIndexInChordRawDna: Optional index for chord DNA mapping.
    public init(degree: Int, semitones: Int, degreeIndexInChordRawDna: Int? = nil) {
        self.degree = degree
        self.semitones = semitones
        self.degreeIndexInChordRawDna = degreeIndexInChordRawDna
    }
}

// MARK: - Common Intervals
extension NoteInterval {

    //        5音index:4    9音index:7
    //              ｜        ｜
    // [0, 2, 4, 5, 7, 9, 11, 14, 17, 21] <- 检查用的rawDNA
    //        |           ｜           ｜
    //     3音 index:2  7音 index:6   13音 index:9
    
    // MARK: Unison
    /// Perfect Unison (P1)
    public static let P1 = NoteInterval(degree: 1, semitones: 0, degreeIndexInChordRawDna: 0) // 纯一度

    // MARK: Seconds
    /// Diminished Second (d2) - Enharmonically P1
    public static let d2 = NoteInterval(degree: 2, semitones: 0, degreeIndexInChordRawDna: 1) // 减二度
    /// Minor Second (m2)
    public static let m2 = NoteInterval(degree: 2, semitones: 1, degreeIndexInChordRawDna: 1) // 小二度
    /// Major Second (M2)
    public static let M2 = NoteInterval(degree: 2, semitones: 2, degreeIndexInChordRawDna: 1) // 大二度 <- M2
    /// Augmented Second (A2)
    public static let A2 = NoteInterval(degree: 2, semitones: 3, degreeIndexInChordRawDna: 1) // 增二度

    // MARK: Thirds
    /// Diminished Third (d3)
    public static let d3 = NoteInterval(degree: 3, semitones: 2, degreeIndexInChordRawDna: 2) // 减三度
    /// Minor Third (m3)
    public static let m3 = NoteInterval(degree: 3, semitones: 3, degreeIndexInChordRawDna: 2) // 小三度
    /// Major Third (M3)
    public static let M3 = NoteInterval(degree: 3, semitones: 4, degreeIndexInChordRawDna: 2) // 大三度 <- M3
    /// Augmented Third (A3)
    public static let A3 = NoteInterval(degree: 3, semitones: 5, degreeIndexInChordRawDna: 2) // 增三度

    // MARK: Fourths
    /// Diminished Fourth (d4)
    public static let d4 = NoteInterval(degree: 4, semitones: 4, degreeIndexInChordRawDna: 3) // 减四度
    /// Perfect Fourth (P4)
    public static let P4 = NoteInterval(degree: 4, semitones: 5, degreeIndexInChordRawDna: 3) // 纯四度 <- P4
    /// Augmented Fourth (A4) - Tritone
    public static let A4 = NoteInterval(degree: 4, semitones: 6, degreeIndexInChordRawDna: 3) // 增四度 (三全音)

    // MARK: Fifths
    /// Diminished Fifth (d5) - Tritone
    public static let d5 = NoteInterval(degree: 5, semitones: 6, degreeIndexInChordRawDna: 4) // 减五度 (三全音)
    /// Perfect Fifth (P5)
    public static let P5 = NoteInterval(degree: 5, semitones: 7, degreeIndexInChordRawDna: 4) // 纯五度 <- P5
    /// Augmented Fifth (A5)
    public static let A5 = NoteInterval(degree: 5, semitones: 8, degreeIndexInChordRawDna: 4) // 增五度

    // MARK: Sixths
    /// Diminished Sixth (d6)
    public static let d6 = NoteInterval(degree: 6, semitones: 7 , degreeIndexInChordRawDna: 5) // 减六度
    /// Minor Sixth (m6)
    public static let m6 = NoteInterval(degree: 6, semitones: 8 , degreeIndexInChordRawDna: 5) // 小六度
    /// Major Sixth (M6)
    public static let M6 = NoteInterval(degree: 6, semitones: 9 , degreeIndexInChordRawDna: 5) // 大六度 <- M6
    /// Augmented Sixth (A6)
    public static let A6 = NoteInterval(degree: 6, semitones: 10, degreeIndexInChordRawDna: 5) // 增六度

    // MARK: Sevenths
    /// Diminished Seventh (d7)
    public static let d7 = NoteInterval(degree: 7, semitones: 9 , degreeIndexInChordRawDna: 6) // 减七度
    /// Minor Seventh (m7)
    public static let m7 = NoteInterval(degree: 7, semitones: 10, degreeIndexInChordRawDna: 6) // 小七度
    /// Major Seventh (M7)
    public static let M7 = NoteInterval(degree: 7, semitones: 11, degreeIndexInChordRawDna: 6) // 大七度 <- M7
    /// Augmented Seventh (A7)
    public static let A7 = NoteInterval(degree: 7, semitones: 12, degreeIndexInChordRawDna: 6) // 增七度
    
    // MARK: Octaves
    /// Perfect Octave (P8)
    public static let P8 = NoteInterval(degree: 8, semitones: 12, degreeIndexInChordRawDna: nil) // 纯八度 <- P8
    
    // MARK: Ninths
    /// Diminished Ninth (d9)
    public static let d9 = NoteInterval(degree: 9, semitones: 12, degreeIndexInChordRawDna: 7) // 减九度
    /// Minor Ninth (m9)
    public static let m9 = NoteInterval(degree: 9, semitones: 13, degreeIndexInChordRawDna: 7) // 小九度
    /// Major Ninth (M9)
    public static let M9 = NoteInterval(degree: 9, semitones: 14, degreeIndexInChordRawDna: 7) // 大九度 <- M9
    /// Augmented Ninth (A9)
    public static let A9 = NoteInterval(degree: 9, semitones: 15, degreeIndexInChordRawDna: 7) // 增九度

    // MARK: Elevenths
    /// Diminished Eleventh (d11)
    public static let d11 = NoteInterval(degree: 11, semitones: 16, degreeIndexInChordRawDna: 8) // 减十一度
    /// Perfect Eleventh (P11)
    public static let P11 = NoteInterval(degree: 11, semitones: 17, degreeIndexInChordRawDna: 8) // 纯十一度 <- P11
    /// Augmented Eleventh (A11)
    public static let A11 = NoteInterval(degree: 11, semitones: 18, degreeIndexInChordRawDna: 8) // 增十一度
    
    // MARK: Thirteenths
    /// Diminished Thirteenth (d13)
    public static let d13 = NoteInterval(degree: 13, semitones: 19, degreeIndexInChordRawDna: 9) // 减十三度
    /// Minor Thirteenth (m13)
    public static let m13 = NoteInterval(degree: 13, semitones: 20, degreeIndexInChordRawDna: 9) // 小十三度
    /// Major Thirteenth (M13)
    public static let M13 = NoteInterval(degree: 13, semitones: 21, degreeIndexInChordRawDna: 9) // 大十三度 <- M13
    /// Augmented Thirteenth (A13)
    public static let A13 = NoteInterval(degree: 13, semitones: 22, degreeIndexInChordRawDna: 9) // 增十三度
    
    // MARK: Fifteenths
    /// Perfect Fifteenth (P15)
    public static let P15 = NoteInterval(degree: 15, semitones: 24) // 纯十五度 <- P15
}

// MARK: - CustomStringConvertible
extension NoteInterval: CustomStringConvertible {
    
    /// 大调音阶各度数对应的标准半音数（1度到13度）。
    /// 用于计算音程性质（大、小、纯、增、减）。
    /// 索引 0-6 对应 1-7 度，索引 7-9 对应 9, 11, 13 度。
    public static let NormalizedSemitone = [0, 2, 4, 5, 7, 9, 11, 14, 17, 21]
    
    /// 计算实际半音数与标准大调/纯音程半音数之间的差异。
    /// 结果归一化在 [-6, 6] 范围内，以处理八度翻转的情况（例如：增七度 A7 与 纯八度 P8 的关系）。
    private var qualityDifference: Int {
        // 将度数映射到 0-6 的基本音级索引
        let diatonicIndex = (self.degree - 1) % 7
        // 获取该音级在大调中的标准半音数
        let expectedMajorSemitones = NoteInterval.NormalizedSemitone[diatonicIndex]
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
        let normalizedDegree = (self.degree - 1) % 7 + 1
        
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
        
        return element + String(self.degree)
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
    
        return element + String(self.degree)
    }
    
}
