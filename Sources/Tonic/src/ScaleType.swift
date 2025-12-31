//
//  ScaleType.swift
//  FantaChord
//
//  Created by Claude Code
//

import Foundation

/// 音阶类型枚举
/// 定义了各种常见的音阶类型及其半音组成
public enum ScaleType: String, CaseIterable, Codable {
    // MARK: - Major Scales

    /// 自然大调 (Ionian)
    /// 全全半全全全半
    case naturalMajor = "Major"

    // MARK: - Minor Scales

    /// 自然小调 (Aeolian)
    /// 全半全全半全全
    case naturalMinor = "Natural Minor"

    /// 和声小调
    /// 在自然小调基础上升高第7级
    case harmonicMinor = "Harmonic Minor"

    /// 旋律小调（上行）
    /// 在自然小调基础上升高第6、7级
    case melodicMinor = "Melodic Minor"

    // MARK: - Pentatonic Scales

    /// 大调五声音阶
    /// 去掉大调的第4、7级
    case pentatonicMajor = "Pentatonic Major"

    /// 小调五声音阶
    /// 去掉小调的第2、6级
    case pentatonicMinor = "Pentatonic Minor"

    // MARK: - Blues Scales

    /// 布鲁斯音阶
    /// 小调五声音阶 + 降5度
    case blues = "Blues"

    /// 大调布鲁斯音阶
    case majorBlues = "Major Blues"

    // MARK: - Modal Scales

    /// 多利亚调式 (Dorian)
    /// 从大调第2级开始
    case dorian = "Dorian"

    /// 弗里几亚调式 (Phrygian)
    /// 从大调第3级开始
    case phrygian = "Phrygian"

    /// 利底亚调式 (Lydian)
    /// 从大调第4级开始
    case lydian = "Lydian"

    /// 混合利底亚调式 (Mixolydian)
    /// 从大调第5级开始
    case mixolydian = "Mixolydian"

    /// 洛克里亚调式 (Locrian)
    /// 从大调第7级开始
    case locrian = "Locrian"

    // MARK: - Other Scales

    /// 全音阶
    /// 每个音之间都是全音关系
    case wholeTone = "Whole Tone"

    /// 半音阶
    /// 包含所有12个半音
    case chromatic = "Chromatic"

    /// 减音阶 (Half-Whole Diminished)
    /// 半全半全半全半全
    case diminished = "Diminished"

    /// 全减音阶 (Whole-Half Diminished)
    /// 全半全半全半全半
    case wholeDiminished = "Whole Diminished"

    // MARK: - Semitone Pattern

    /// 返回该音阶类型的半音间隔模式
    /// 数组中的每个元素表示与根音的半音数差距
    public var semitones: [Int] {
        switch self {
        // Major
        case .naturalMajor:
            return [0, 2, 4, 5, 7, 9, 11]

        // Minor
        case .naturalMinor:
            return [0, 2, 3, 5, 7, 8, 10]
        case .harmonicMinor:
            return [0, 2, 3, 5, 7, 8, 11]
        case .melodicMinor:
            return [0, 2, 3, 5, 7, 9, 11]

        // Pentatonic
        case .pentatonicMajor:
            return [0, 2, 4, 7, 9]
        case .pentatonicMinor:
            return [0, 3, 5, 7, 10]

        // Blues
        case .blues:
            return [0, 3, 5, 6, 7, 10]
        case .majorBlues:
            return [0, 2, 3, 4, 7, 9]

        // Modes
        case .dorian:
            return [0, 2, 3, 5, 7, 9, 10]
        case .phrygian:
            return [0, 1, 3, 5, 7, 8, 10]
        case .lydian:
            return [0, 2, 4, 6, 7, 9, 11]
        case .mixolydian:
            return [0, 2, 4, 5, 7, 9, 10]
        case .locrian:
            return [0, 1, 3, 5, 6, 8, 10]

        // Other
        case .wholeTone:
            return [0, 2, 4, 6, 8, 10]
        case .chromatic:
            return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        case .diminished:
            return [0, 1, 3, 4, 6, 7, 9, 10]
        case .wholeDiminished:
            return [0, 2, 3, 5, 6, 8, 9, 11]
        }
    }

    /// 音阶中音的数量
    public var degreeCount: Int {
        return semitones.count
    }

    /// 每个音阶音对应的字母偏移量（相对于根音）
    /// 例如：五声音阶 [0, 1, 2, 4, 5] 表示 C D E G A，跳过了 F(3) 和 B(6)
    public var letterOffsets: [Int] {
        switch self {
        // 七声音阶 - 使用连续的字母
        case .naturalMajor, .naturalMinor, .harmonicMinor, .melodicMinor,
             .dorian, .phrygian, .lydian, .mixolydian, .locrian:
            return [0, 1, 2, 3, 4, 5, 6]

        // 五声音阶 - 跳过某些字母
        case .pentatonicMajor:
            // C D E G A - 跳过 F 和 B
            return [0, 1, 2, 4, 5]

        case .pentatonicMinor:
            // A C D E G - 相当于从 A 开始的 [0, 2, 3, 4, 6]
            return [0, 2, 3, 4, 6]

        // 布鲁斯音阶 - 6 个音
        case .blues:
            // C Eb F F# G Bb - [0, 2, 3, 3, 4, 6]
            // 注意：F 和 F# 使用相同的字母位置
            return [0, 2, 3, 3, 4, 6]

        case .majorBlues:
            // C D Eb E G A - [0, 1, 2, 2, 4, 5]
            return [0, 1, 2, 2, 4, 5]

        // 全音阶 - 6 个音
        // C D E F# G# Bb
        case .wholeTone:
            return [0, 1, 2, 3, 4, 6]

        // 半音阶 - 12 个音，每个字母都要用到，有些会重复
        case .chromatic:
            return [0, 0, 1, 1, 2, 3, 3, 4, 4, 5, 5, 6]

        // 减音阶 - 8 个音
        // C C# Eb E F# G A Bb
        case .diminished:
            return [0, 0, 2, 2, 3, 4, 5, 6]

        // 全减音阶 - 8 个音
        // C D Eb E# F# G# A B
        case .wholeDiminished:
            return [0, 1, 2, 2, 3, 4, 5, 6]
        }
    }

    /// 音阶的中文名称
    public var chineseName: String {
        switch self {
        case .naturalMajor: return "自然大调"
        case .naturalMinor: return "自然小调"
        case .harmonicMinor: return "和声小调"
        case .melodicMinor: return "旋律小调"
        case .pentatonicMajor: return "大调五声音阶"
        case .pentatonicMinor: return "小调五声音阶"
        case .blues: return "布鲁斯音阶"
        case .majorBlues: return "大调布鲁斯"
        case .dorian: return "多利亚调式"
        case .phrygian: return "弗里几亚调式"
        case .lydian: return "利底亚调式"
        case .mixolydian: return "混合利底亚调式"
        case .locrian: return "洛克里亚调式"
        case .wholeTone: return "全音阶"
        case .chromatic: return "半音阶"
        case .diminished: return "减音阶"
        case .wholeDiminished: return "全减音阶"
        }
    }
}
