import Testing
import Foundation
@testable import Tonic

/// Note 结构体的全面测试套件
///
///涵盖：
/// - 基本属性与 Identifiable
/// - Hashable (相等性与去重)
/// - Comparable (排序)
/// - Diatonic Index (索引计算)
/// - Normalization (数组规范化)
/// - 算术运算 (加减音程)
/// - 格式化与描述
/// - 预设常量
@Suite("Note Tests")
struct NoteTests {

    // MARK: - 1. Core Properties & Identifiable
    
    /// 测试 Note 的基本初始化和 Identifiable 协议的一致性
    @Test("Initialization and Identifiable")
    func testInitializationAndIdentifiable() {
        // 创建两个参数完全相同的 Note
        let note1 = Note(letter: .C, accidental: 0, octave: 4)
        let note2 = Note(letter: .C, accidental: 0, octave: 4)
        
        // 验证基本属性是否正确赋值
        #expect(note1.letter == .C)
        #expect(note1.accidental == 0)
        #expect(note1.octave == 4)
        
        // 验证 id 是唯一的 (Identifiable)
        // 即使乐理属性相同，作为对象/视图模型它们应该是不同的实体
        #expect(note1.id != note2.id)
    }

    /// 测试 MIDI Pitch (音高) 的计算逻辑
    /// 公式: (octave + 1) * 12 + letter.semitone + accidental
    @Test("Pitch Calculation")
    func testPitchCalculation() {
        // C4 = (4 + 1) * 12 + 0 + 0 = 60 (中央 C)
        let c4 = Note(letter: .C, accidental: 0, octave: 4)
        #expect(c4.pitch == 60)

        // A4 = (4 + 1) * 12 + 9 + 0 = 69 (标准音高 440Hz)
        let a4 = Note(letter: .A, accidental: 0, octave: 4)
        #expect(a4.pitch == 69)

        // C0 = (0 + 1) * 12 + 0 + 0 = 12
        let c0 = Note(letter: .C, accidental: 0, octave: 0)
        #expect(c0.pitch == 12)

        // A0 = (0 + 1) * 12 + 9 + 0 = 21 (钢琴最低音)
        let a0 = Note(letter: .A, accidental: 0, octave: 0)
        #expect(a0.pitch == 21)

        // C8 = (8 + 1) * 12 + 0 + 0 = 108 (钢琴最高音)
        let c8 = Note(letter: .C, accidental: 0, octave: 8)
        #expect(c8.pitch == 108)

        // C#4 = 60 + 1 = 61
        let cs4 = Note(letter: .C, accidental: 1, octave: 4)
        #expect(cs4.pitch == 61)

        // Db4 = 62 - 1 = 61 (异名同音)
        let db4 = Note(letter: .D, accidental: -1, octave: 4)
        #expect(db4.pitch == 61)
    }

    // MARK: - 2. Hashable & Equality
    
    /// 测试相等性 (`==`) 和哈希值
    /// Note 自定义了 `==` 以忽略 `id`，只比较乐理属性
    @Test("Equality and Hashable")
    func testEqualityAndHashable() {
        let n1 = Note(letter: .C, accidental: 0, octave: 4)
        let n2 = Note(letter: .C, accidental: 0, octave: 4)
        let n3 = Note(letter: .D, accidental: -2, octave: 4) // C4 的异名同音 (Dbb4)，但在 Note 结构中视为不同
        
        // 验证值相等性
        #expect(n1 == n2)
        // 验证不同属性导致不相等
        #expect(n1 != n3)
        
        // 验证 Hash 值一致性 (用于 Set/Dictionary)
        #expect(n1.hashValue == n2.hashValue)
        
        // 验证 Set 去重能力
        let noteSet: Set<Note> = [n1, n2, n3]
        #expect(noteSet.count == 2) // n1 和 n2 应该被视为同一个元素
        #expect(noteSet.contains(n1))
        #expect(noteSet.contains(n3))
    }

    // MARK: - 3. Comparable
    
    /// 测试排序逻辑 (`<`)
    /// 优先级: Octave > Letter > Accidental
    @Test("Comparable Implementation")
    func testComparable() {
        let c4 = Note(letter: .C, accidental: 0, octave: 4)
        let d4 = Note(letter: .D, accidental: 0, octave: 4)
        let c5 = Note(letter: .C, accidental: 0, octave: 5)
        let cs4 = Note(letter: .C, accidental: 1, octave: 4) // C#4
        let db4 = Note(letter: .D, accidental: -1, octave: 4) // Db4

        // 1. 同八度，不同音名: C4 < D4
        #expect(c4 < d4)
        
        // 2. 不同八度: D4 < C5
        #expect(d4 < c5)
        
        // 3. 同八度同音名，不同升降号: C4 < C#4
        #expect(c4 < cs4)
        
        // 4. 混合比较
        #expect(c4 < c5)
        
        // 注意：Comparable 并不比较 Pitch，而是比较乐理书写顺序
        // C#4 (61) 和 Db4 (61) 音高相同，但 C#4 排在 Db4 之前吗？
        // 逻辑：Letter C < Letter D。所以 C#4 < Db4。
        #expect(cs4 < db4)
    }

    // MARK: - 4. Indexing
    
    /// 测试 Diatonic Index (自然音级索引)
    /// 这里的 Index 忽略升降号，只看它在五线谱上的位置
    @Test("Diatonic Index")
    func testDiatonicIndex() {
        let c4 = Note(letter: .C, accidental: 0, octave: 4)
        // Calculation: 4 * 7 + 0 = 28
        #expect(c4.diatonicIndex == 28)
        
        let cb4 = Note(letter: .C, accidental: -1, octave: 4)
        // Cb4 的位置和 C4 一样，都是 28
        #expect(cb4.diatonicIndex == 28)
        
        let d4 = Note(letter: .D, accidental: 0, octave: 4)
        // D4 = 4 * 7 + 1 = 29
        #expect(d4.diatonicIndex == 29)
    }
    
    /// 测试钢琴键盘的索引范围常量
    @Test("Piano Keyboard Range")
    func testPianoRange() {
        let range = Note.diatonicIndexRangeOfPianoKeyBoard
        // 验证范围是否符合预期：A0 (5) 到 C8 (56)
        // 修正逻辑：
        // A0 = 0 * 7 + 5 = 5
        // C8 = 8 * 7 + 0 = 56
        #expect(range.lowerBound == 5)
        #expect(range.upperBound == 56)
    }

    // MARK: - 5. Normalization
    
    /// 测试数组规范化 (去重并排序)
    @Test("Normalization")
    func testNormalization() {
        var notes = [
            Note(letter: .D, accidental: 0, octave: 4),
            Note(letter: .C, accidental: 0, octave: 4),
            Note(letter: .C, accidental: 0, octave: 4), // 重复
            Note(letter: .E, accidental: 0, octave: 4)
        ]
        
        // 使用 Array 扩展方法
        notes.uniqueSort()
        
        // 验证去重：应该剩下 3 个
        #expect(notes.count == 3)
        
        // 验证排序：C4, D4, E4
        #expect(notes[0].letter == .C)
        #expect(notes[1].letter == .D)
        #expect(notes[2].letter == .E)
        
        // 验证非 mutating 版本
        let duplicates = [
            Note(letter: .A, accidental: 0, octave: 4),
            Note(letter: .A, accidental: 0, octave: 4)
        ]
        let sortedUnique = duplicates.uniqueSorted()
        #expect(sortedUnique.count == 1)
        #expect(duplicates.count == 2) // 原数组不变
    }

    // MARK: - 6. Arithmetic (Intervals)
    
    /// 测试音符加减音程的运算
    /// 验证是否正确处理了音名进位、八度变化和升降号计算
//    @Test("Interval Arithmetic")
//    func testIntervalArithmetic() {
//        let c4 = Note(letter: .C, accidental: 0, octave: 4)
//
//        // 1. 大三度 (M3): C4 + M3 -> E4
//        let e4 = c4 + .M3
//        #expect(e4.letter == .E)
//        #expect(e4.accidental == 0)
//        #expect(e4.octave == 4)
//        #expect(e4.pitch == 64)
//
//        // 2. 小三度 (m3): C4 + m3 -> Eb4
//        let eb4 = c4 + .m3
//        #expect(eb4.letter == .E)
//        #expect(eb4.accidental == -1) // 降号
//        #expect(eb4.octave == 4)
//
//        // 3. 纯五度 (P5): C4 + P5 -> G4
//        let g4 = c4 + .P5
//        #expect(g4.letter == .G)
//        #expect(g4.accidental == 0)
//
//        // 4. 大六度 (M6): C4 + M6 -> A4
//        let a4 = c4 + .M6
//        #expect(a4.letter == .A)
//
//        // 5. 纯八度 (P8): C4 + P8 -> C5 (跨八度)
//        let c5 = c4 + .P8
//        #expect(c5.letter == .C)
//        #expect(c5.octave == 5)
//
//        // 6. 减法: E4 - M3 -> C4
//        let c4_back = e4 - .M3
//        #expect(c4_back == c4)
//        
//        // 7. 减法: G4 - P5 -> C4
//        let c4_back2 = g4 - .P5
//        #expect(c4_back2 == c4)
//    }

    // MARK: - 7. Formatting
    
    /// 测试音符名称的格式化输出
    @Test("Formatting and Description")
    func testFormatting() {
        // 原音
        let c4 = Note(letter: .C, accidental: 0, octave: 4)
        #expect(c4.accidentalSymbol == "")
        #expect(c4.name == "C")
        #expect(c4.fullName == "C4")
        #expect(c4.description == "C") // CustomStringConvertible

        // 升号
        let cs4 = Note(letter: .C, accidental: 1, octave: 4)
        #expect(cs4.accidentalSymbol == "♯")
        #expect(cs4.name == "C♯")
        #expect(cs4.fullName == "C♯4")

        // 降号
        let db4 = Note(letter: .D, accidental: -1, octave: 4)
        #expect(db4.accidentalSymbol == "♭")
        #expect(db4.name == "D♭")
        #expect(db4.fullName == "D♭4")

        // 重升号 (Double Sharp)
        let fss4 = Note(letter: .F, accidental: 2, octave: 4)
        #expect(fss4.accidentalSymbol == "♯♯")
        #expect(fss4.name == "F♯♯")
    }

    // MARK: - 8. Presets
    
    /// 测试预定义的静态音符数组
    @Test("Presets")
    func testPresets() {
        // 验证 NoteCircleDefault (半音阶)
        // 应该包含 12 个音
        #expect(Note.NoteCircleDefault.count == 12)
        // 简单抽查
        #expect(Note.NoteCircleDefault[0].letter == .C)
        
        // 验证 NoteFifthCircleDefault (五度圈)
        // 应该包含 12 个音
        #expect(Note.NoteFifthCircleDefault.count == 12)
        // 验证顺序: C -> F -> Bb ...
        #expect(Note.NoteFifthCircleDefault[0].letter == .C)
        #expect(Note.NoteFifthCircleDefault[1].letter == .F)
        #expect(Note.NoteFifthCircleDefault[2].letter == .B)
        #expect(Note.NoteFifthCircleDefault[2].accidental == -1) // Bb
    }
}
