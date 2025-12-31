 //
 //  Scale.swift
 //  FantaChord
 //
 //  Created by 小汤汤 on 2025/6/4.
 //

 import Foundation

 public typealias ScaleIndex = Int // ScaleIndex 为几音. 比如 C大调的第三个音, ScaleIndex == 3

/// 音阶结构
/// 支持各种音阶类型（大调、小调、布鲁斯、调式等）
public struct Scale {

    // MARK: - Properties

    /// 音阶的根音
    public let rootNote: Note

    /// 音阶类型
    public let type: ScaleType

    /// 每个音阶与根音的半音数关系
    public var semitoneFromRootNote: [Int] {
        return type.semitones
    }

    /// 每个音阶音对应的字母偏移量
    public var letterOffsets: [Int] {
        return type.letterOffsets
    }

    /// 音阶是否需要从 rootNote 的八度开始
    /// 如果为 false，则从键盘最左边（octave = -1）开始
    public let isFromKeyOctave: Bool

    /// 音阶中音的数量
    public var degreeCount: Int {
        return semitoneFromRootNote.count
    }

    // MARK: - Initializers

    /// 初始化音阶
    /// - Parameters:
    ///   - rootNote: 根音，默认为 C4
    ///   - type: 音阶类型，默认为自然大调
    ///   - isFromKeyOctave: 是否从根音的八度开始，默认为 true
    public init(rootNote: Note = Note(), type: ScaleType = .naturalMajor, isFromKeyOctave: Bool = true) {
        self.rootNote = rootNote
        self.type = type
        self.isFromKeyOctave = isFromKeyOctave
    }

    // MARK: - Scale Note Access

    /// 获取音阶上的某个音
    /// - Parameters:
    ///   - scaleIndex: 音阶索引（从 1 开始）。例如：C 大调的第 3 个音，scaleIndex = 3
    ///   - diffPlus: 额外的半音偏移。例如：找大调音阶的第 1♭个音，传入 (index: 1, diffPlus: -1)
    /// - Returns: 对应的音符，如果索引无效则返回 nil
    public func note(on scaleIndex: ScaleIndex, diffPlus: Int = 0) -> Note? {
        // 音阶必须至少有一个音
        guard !semitoneFromRootNote.isEmpty else { return nil }

        /// 判断是否要从 rootNote 开始
        /// 如果不是从 rootNote 开始, 就要从键盘最左边开始, 键盘最左边的 octave 是 -1
        var rootNote = self.rootNote
        if isFromKeyOctave == false {
            rootNote.octave = -1
        }

        /// **Step 1** 使用 letterOffsets 计算目标字母
        /// letterOffsets 定义了每个音阶音相对于根音的字母偏移量
        let letters: [Letter] = [.C, .D, .E, .F, .G, .A, .B]
        let degreeCount = semitoneFromRootNote.count
        let offsets = letterOffsets

        /// 获取当前音阶音的字母偏移（支持跨八度循环）
        let letterOffset = offsets[(scaleIndex - 1) % degreeCount]

        /// 计算跨越了几个音阶循环（八度）
        let scaleCycles = (scaleIndex - 1) / degreeCount

        /// 计算目标字母的索引和八度偏移
        let startIndex = rootNote.letter.letterIndex
        let totalLetterOffset = letterOffset + scaleCycles * 7 // 每个音阶循环相当于 7 个字母（一个八度）
        let targetIndex = (startIndex + totalLetterOffset) % 7
        let octaveDelta = (startIndex + totalLetterOffset) / 7
        let targetLetter = letters[targetIndex]

        /// target note 在键盘上的标准 pitch
        /// 根据 Letter 转 target note
        /// target note 代表了标准位置, 就应该在白键上, note 不能有 accidental
        let targetStandardPitch = Note(letter: targetLetter, octave: rootNote.octave + octaveDelta).pitch

        /// **Step 2** rootNote 与 target pitch 的距离
        /// 根据音阶类型的半音关系，向下数几个 pitch
        let pitchRelative = semitoneFromRootNote[(scaleIndex - 1) % degreeCount]
        let pitchOctaveDelta = scaleCycles
        /// target note 实际在键盘上的 pitch
        /// 第几个音, 实际就是向下数了 pitchRelative + pitchOctaveDelta * 12 个 pitch
        let targetRealPitch = pitchRelative + pitchOctaveDelta * 12 + rootNote.pitch

        /// **Step 3** diff
        /// 实际和标准位置差了多少个 pitch, 这个 pitch 最后就是 accidental
        /// diffPlus 可以理解为, 如果我要找大调音阶的第 1♭个音, 就是找 (index=1, diffPlus=-1)
        /// 如果我要找大调音阶的第 6♯个音, 就是找 (index=6, diffPlus=1)
        let diff = targetRealPitch - targetStandardPitch + diffPlus

        /// 返回的 note, 确保音名 (letter) 正确
        return Note(letter: targetLetter, accidental: diff, octave: rootNote.octave + octaveDelta)
    }

    /// 获取音阶的所有音（一个八度内）
    /// - Returns: 音阶中的所有音符数组
    public func allNotes() -> [Note] {
        return (1...degreeCount).compactMap { note(on: $0) }
    }

    /// 获取音阶名称
    /// - Returns: 音阶的完整名称，例如 "C Major" 或 "D Natural Minor"
    public var name: String {
        let rootName = rootNote.name
        let typeName = type.rawValue
        return "\(rootName) \(typeName)"
    }

    /// 获取音阶中文名称
    /// - Returns: 音阶的中文名称，例如 "C 自然大调" 或 "D 自然小调"
    public var chineseName: String {
        let rootName = rootNote.name
        let typeName = type.chineseName
        return "\(rootName) \(typeName)"
    }
}

