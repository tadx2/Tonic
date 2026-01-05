import Foundation

/// 音符 (Note)
///
/// 乐理系统中的核心结构，包含音名、升降号和八度信息。
/// 能够计算其音高 (Pitch) 并支持乐理运算。
public struct Note: Identifiable, Sendable {
    /// 唯一标识符，用于 SwiftUI 等 UI 框架区分不同的音符实例。
    public let id = UUID()

    /// 音名 (Letter)，如 C, D, E, F, G, A, B。
    public var letter: Letter = .C

    /// 升降号 (Accidental)，0 为原音，正数为升 (♯)，负数为降 (♭)。
    public var accidental: Accidental = 0

    /// 八度 (Octave)，通常 C4 (中央C) 的 octave 为 4。
    public var octave: Octave = 4

    /// MIDI 音高 (Pitch)
    ///
    /// 计算公式：(octave + 1) * 12 + semitone + accidental
    /// 例如：C4 = (4 + 1) * 12 + 0 + 0 = 60
    public var pitch: PitchInt {
        (octave + 1) * 12 + letter.semitone + accidental
    }

    /// 公开初始化方法
    public init(letter: Letter = .C, accidental: Accidental = 0, octave: Octave = 4) {
        self.letter = letter
        self.accidental = accidental
        self.octave = octave
    }
}

// MARK: - Hashable & Equality
/// 实现自定义的相等性和哈希值计算。
///
/// 尽管 Note 拥有唯一的 `id` (Identifiable)，但在乐理逻辑中，
/// 只要 `letter`、`accidental` 和 `octave` 相同，就应视为同一个音符。
/// 这允许我们在 `Set` 或 `Dictionary` 中对音符进行去重和查找。
extension Note: Hashable {

    /// 判断两个音符在乐理上是否相等。
    /// 忽略 `id`，只比较音符本身的乐理属性。
    public static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.letter == rhs.letter &&
        lhs.accidental == rhs.accidental &&
        lhs.octave == rhs.octave
    }

    /// 生成音符的哈希值，基于其乐理属性。
    public func hash(into hasher: inout Hasher) {
        hasher.combine(letter)
        hasher.combine(accidental)
        hasher.combine(octave)
    }
}

// MARK: - Comparison
/// 实现 Comparable 协议，定义音符的排序规则。
///
/// 排序优先级：
/// 1. `octave`：八度越低越靠前。
/// 2. `letter`：八度相同时，按 C, D, E, F, G, A, B 顺序排序。
/// 3. `accidental`：音名相同时，按降号到升号的顺序排序。
extension Note: Comparable {

    public static func < (lhs: Note, rhs: Note) -> Bool {
        // 1. 比较 octave
        if lhs.octave != rhs.octave {
            return lhs.octave < rhs.octave
        }
        // 2. octave 相同 → 比较 letter
        if lhs.letter != rhs.letter {
            return lhs.letter.letterIndex < rhs.letter.letterIndex
        }
        // 3. octave 和 letter 相同 → 比较 accidental
        return lhs.accidental < rhs.accidental
    }
}

// MARK: - Indexing
extension Note {
    
    /// 自然音级索引 (Diatonic Index)
    ///
    /// 为音符的 Letter 生成一个考虑八度 (Octave) 的绝对索引，但不考虑升降号 (Accidental)。
    /// 该索引对应于音符在五线谱上的纵向位置或在钢琴白键上的顺序。
    ///
    /// 例子：
    /// C4 -> 28, Cb4 -> 28
    /// D4 -> 29, E4 -> 30
    var diatonicIndex: Int {
        octave * 7 + letter.letterIndex
    }
    
    /// 钢琴自然音级索引范围 (基于 88 键钢琴)
    ///
    /// 最左边 (A0)：0 * 7 + 5 (A) = 5 (若 A 为 5) -> 实际 Piano 最低是 A0，最高是 C8
    /// 这里根据 Letter 索引计算：
    /// A0: 0 * 7 + 5 = 5 (但代码中定义 A 为 5，Piano A0 实际上是起始偏移)
    /// 
    /// 按照 current implementation:
    /// 最左边 A0: 0 * 7 + 5 = 5 (注：原代码注释写 6，需确认 Letter.A.letterIndex)
    /// 最右边 C8: 8 * 7 + 0 = 56
    static let diatonicIndexRangeOfPianoKeyBoard: ClosedRange<Int> = 5...56
}

// MARK: - Array Extensions
extension Array where Element == Note {
    
    /// 返回去重并排序后的新数组
    ///
    /// 结合了 `Set` 的去重能力 (Hashable) 和 `sorted()` 的排序能力 (Comparable)。
    ///
    /// 用法示例：
    /// ```swift
    /// let notes = [Note(.C), Note(.D), Note(.C)]
    /// let result = notes.uniqueSorted()
    /// // result: [Note(.C), Note(.D)]
    /// ```
    func uniqueSorted() -> [Note] {
        return Array(Set(self)).sorted()
    }
    
    /// 原地去重并排序
    ///
    /// 直接修改当前数组，使其仅包含唯一的音符并按音高排序。
    mutating func uniqueSort() {
        self = self.uniqueSorted()
    }
}

// MARK: - Arithmetic (Intervals)
/// 提供音符与音程 (NoteInterval) 之间的加减运算。
/// 这些运算会同时更新音符的 Letter、Octave 和 Accidental。
public extension Note {

    /// 音符加上一个音程。
    /// - Parameters:
    ///   - lhs: 起始音符
    ///   - rhs: 要加上的音程
    /// - Returns: 计算后的目标音符，保持正确的音名和升降号。
    static func + (lhs: Note, rhs: Interval) -> Note {
        let degreeIndex = rhs.degreeInt - 1
        let newLetterIndexSum = lhs.letter.letterIndex + degreeIndex
        let newLetterIndex = newLetterIndexSum % 7
        let octaveChange = newLetterIndexSum / 7
        let newOctave = lhs.octave + octaveChange

        let newLetter = Letter.allCases[newLetterIndex]

        let targetPitch = lhs.pitch + rhs.semitones
        let naturalTargetNote = Note(letter: newLetter, accidental: 0, octave: newOctave)
        let newaccidental: Accidental = targetPitch - naturalTargetNote.pitch

        return Note(letter: newLetter, accidental: newaccidental, octave: newOctave)
    }

    /// 音符减去一个音程。
//    static func - (lhs: Note, rhs: NoteInterval) -> Note {
//        let degreeIndex = rhs.degree - 1
//        let newLetterIndexDiff = lhs.letter.letterIndex - degreeIndex
//        let newLetterIndex = (newLetterIndexDiff % 7 + 7) % 7
//        let octaveChange = Int(floor(Double(newLetterIndexDiff) / 7.0))
//        let newOctave = lhs.octave + octaveChange
//
//        let newLetter = Letter.allCases[newLetterIndex]
//
//        let targetPitch = lhs.pitch - rhs.semitones
//        let naturalTargetNote = Note(letter: newLetter, accidental: 0, octave: newOctave)
//        let newaccidental: Accidental = targetPitch - naturalTargetNote.pitch
//
//        return Note(letter: newLetter, accidental: newaccidental, octave: newOctave)
//    }
}

// MARK: - Formatting & Description
extension Note {
    /// 升降号符号 (e.g., "♯", "♭♭", "")
    public var accidentalSymbol: String {
        return accidental == 0 ? "" : String(repeating: accidental > 0 ? "♯" : "♭", count: abs(accidental))
    }

    /// 简短音符名称，不包含八度 (e.g., "C", "D♯")
    public var name: String {
        return "\(letter)\(accidentalSymbol)"
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

// MARK: - Presets
extension Note {
    /// 半音音阶默认序列 (从C开始)
    static let NoteCircleDefault: [Note] = [
        Note(letter: .C, accidental: 0),
        Note(letter: .D, accidental: -1),
        Note(letter: .D, accidental: 0),
        Note(letter: .E, accidental: -1),
        Note(letter: .E, accidental: 0),
        Note(letter: .F, accidental: 0),
        Note(letter: .G, accidental: -1),
        Note(letter: .G, accidental: 0),
        Note(letter: .A, accidental: -1),
        Note(letter: .A, accidental: 0),
        Note(letter: .B, accidental: -1),
        Note(letter: .B, accidental: 0)
    ]
    
    /// 五度圈下行音符序列 (C, F, Bb, Eb, Ab, Db, Gb, B, E, A, D, G)
    public static let NoteFifthCircleDefault: [Note] = [
        Note(letter: .C, accidental: 0),
        Note(letter: .F, accidental: 0),
        Note(letter: .B, accidental: -1),
        Note(letter: .E, accidental: -1),
        Note(letter: .A, accidental: -1),
        Note(letter: .D, accidental: -1),
        Note(letter: .G, accidental: -1),
        Note(letter: .B, accidental: 0),
        Note(letter: .E, accidental: 0),
        Note(letter: .A, accidental: 0),
        Note(letter: .D, accidental: 0),
        Note(letter: .G, accidental: 0)
    ]
}
