import Foundation

/// 音符 (Note)
///
/// 乐理系统中的核心结构，包含音名、升降号和八度信息。
/// 能够计算其音高 (Pitch) 并支持乐理运算。
public struct Note: Sendable {

    public var noteClass: NoteClass

    public var letter: Letter {
        get { noteClass.letter }
        set { noteClass = NoteClass(letter: newValue, accidental: noteClass.accidental) }
    }

    public var accidental: Accidental {
        get { noteClass.accidental }
        set { noteClass = NoteClass(letter: noteClass.letter, accidental: newValue) }
    }

    public var octave: Octave = 4

    public init(letter: Letter = .C, accidental: Accidental = 0, octave: Octave = 4) {
        self.noteClass = NoteClass(letter: letter, accidental: accidental)
        self.octave = octave
    }

    public init(noteClass: NoteClass = NoteClass(letter: .C, accidental: 0), octave: Octave = 4) {
        self.noteClass = noteClass
        self.octave = octave
    }

}

// MARK: - Class: Pitch & Letter

extension Note {

    public var pitch: PitchInt {
        self.pitchClass
    }

    public var pitchClass: PitchClassInt {
        (octave + 1) * 12 + noteClass.pitchClass
    }

    public var letterClass: LetterClassInt {
        (octave + 1) * 7 + noteClass.letterClass
    }

}

// MARK: - Hashable & Equality
/// 只要 `letter`、`accidental` 和 `octave` 相同，就应视为同一个音符。
/// 这允许我们在 `Set` 或 `Dictionary` 中对音符进行去重和查找。
extension Note: Hashable {

    /// 判断两个音符在乐理上是否相等
    public static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.noteClass == rhs.noteClass && lhs.octave == rhs.octave
    }

    /// 生成音符的哈希值，基于其乐理属性。
    public func hash(into hasher: inout Hasher) {
        hasher.combine(noteClass)
        hasher.combine(octave)
    }
}

// MARK: - Note & Intervals caltulate
extension Note {

    /// 按指定音程和方向移动音符
    ///
    /// - Parameters:
    ///   - interval: 音程
    ///   - direction: 移动方向 (.up 上行, .down 下行)
    /// - Returns: 移动后的新音符
    ///
    /// ## 示例
    /// ```swift
    /// let c4 = Note(letter: .C, octave: 4)
    /// let g4 = c4.shifted(by: .P5, direction: .up)   // G4
    /// let f3 = c4.shifted(by: .P5, direction: .down) // F3
    /// ```
    public func shifted(by interval: Interval) -> Note {
        let (targetNoteClass, targetOctaveDiff) = self.noteClass.shifted(by: interval)
        return Note(noteClass: targetNoteClass, octave: self.octave + targetOctaveDiff)
    }

    /// 音符加上一个音程（上行）
    ///
    /// 等价于 `shifted(by: interval, direction: .up)`
    ///
    /// ## 示例
    /// ```swift
    /// let c4 = Note(letter: .C, octave: 4)
    /// let g4 = c4 + .P5   // G4
    /// let c5 = c4 + .P8   // C5
    /// ```
    public static func + (lhs: Note, rhs: Interval) -> Note {
        lhs.shifted(by: rhs)
    }

    /// 音符减去一个音程（下行）
    ///
    /// 等价于 `shifted(by: interval, direction: .down)`
    ///
    /// ## 示例
    /// ```swift
    /// let c4 = Note(letter: .C, octave: 4)
    /// let f3 = c4 - .P5   // F3
    /// let c3 = c4 - .P8   // C3
    /// ```
    public static func - (lhs: Note, rhs: Interval) -> Note {
        lhs.shifted(by: -rhs)
    }

}

// MARK: - Note & Note caltulate

extension Note {

    /// 计算两个音符之间的距离
    ///
    /// 返回上行和下行两个方向的音程。
    ///
    /// ## 示例
    /// ```swift
    /// let c4 = Note(letter: .C, octave: 4)
    /// let g4 = Note(letter: .G, octave: 4)
    /// let distances = Note.interval(_ lhs: c4, _ rhs: g4)
    /// ```
    public static func interval(from: Note, to: Note) -> Interval? {

        let letterClassDiff = to.letterClass - from.letterClass
        let pitchClassDiff = to.pitchClass - from.pitchClass

        switch (letterClassDiff, pitchClassDiff) {

        case let (l, p) where l > 0 && p > 0:
            // 情况1. 乐理上最正常的情况，左边是 小的音， 右边是大的音
            // 表示 左边到 右边 是上行多少音程
            return Interval(
                degreeInt: letterClassDiff + 1, semitones: pitchClassDiff, direction: .up)
        case let (l, p) where l < 0 && p < 0:
            
            // 情况2. 也处理左边大，右边小的情况。音程是同样的
            // 表示 左边 到 右边 是下行多少音程
            return Interval(
                degreeInt: -(letterClassDiff - 1), semitones: -pitchClassDiff, direction: .down)
        case let (l, p) where l == 0 && p == 0:
            return .P1
        default:
            print(
                " Note - interval distance - error - gaurantee the rhs/lhs Note is Bigger than the other(form the music theory perspective)"
            )
            return nil
        }

    }

    public static func - (lhs: Note, rhs: Note) -> Interval? {
        Note.interval(from: lhs, to: rhs)
    }

}

// MARK: - Formatting & Description
extension Note {

    /// 简短音符名称，不包含八度 (e.g., "C", "D♯")
    public var name: String {
        return "\(letter)\(accidental.descriptionStrict)"
    }

    /// 完整音符名称，包含八度 (e.g., "C4", "D♯5")
    public var fullName: String {
        return "\(name)\(octave)"
    }
}

extension Note: CustomStringConvertible {
    /// 默认的字符串描述，返回不带八度的音符名称。
    public var description: String {
        name
    }
}
