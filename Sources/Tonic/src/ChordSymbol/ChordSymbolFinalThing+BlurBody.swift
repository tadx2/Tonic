//
//  ChordSymbolFinalThing+BlurBody.swift
//  Tonic
//
//  Created by 小汤汤 on 4/3/26.
//

// MARK: - BlurBody（模糊匹配）

// ## 背景
// `ChordSymbol` 的 `body`（= quality + sus + additions）是精确匹配的：
// additions 的顺序不同就会被视为不同的和弦符号。
// 例如 `M7(♭9)(♯11)` 和 `M7(♯11)(♭9)` 虽然音乐含义相同，但 body 不相等。
//
// ## 解决方案：BlurBody
// `ChordSymbolBlurBody` 将 additions 从有序数组 `[ChordSymbolElementGroup]`
// 转为无序集合 `Set<ChordSymbolElementGroup>`，从而忽略 addition 的排列顺序，
// 只关心"有哪些 addition"，实现模糊匹配。
//
// ## 核心流程（finalIntervals）
// 1. `bluredBody`  — 将当前符号转为模糊表示（忽略 addition 顺序）
// 2. `isBluredBodyValid` — 在 `validSymbolsBluredBody` 集合中查找，判断是否存在这种和弦
// 3. `deBluredBody` — 将 additions 按数字大小重新排序，还原为标准顺序的精确 body
// 4. 用标准化后的 body 去 `chordSymbolToIntervalsMap` 查找对应的音程组
//
// ## 使用场景
// - `ChordSymbolLint.blured`：在 main 合法的前提下，用模糊匹配判断整个 body 是否有效
// - `LeadSheetEditorView`：通过 `finalIntervals == nil` 高亮无效和弦
// - 通过 生成 最终 Chord

/// 所有合法和弦符号的模糊 body 集合（由 `validSymbolsBody` 映射生成）
public let validSymbolsBluredBody: Set<ChordSymbol.ChordSymbolBlurBody> = Set(validSymbolsBody.map { $0.bluredBody })

public extension ChordSymbol {
    /// 模糊 Body：忽略 additions 顺序的和弦 body 表示
    /// - `quality` 和 `sus` 保持不变
    /// - `additions` 转为 `Set`，使 `(♭9)(♯11)` 与 `(♯11)(♭9)` 相等
    struct ChordSymbolBlurBody: Hashable, Sendable {
        let quality: ChordSymbolElementGroup
        let sus: ChordSymbolElementGroup
        let additonsSet: Set<ChordSymbolElementGroup>
    }

    /// 将当前符号转为模糊 body（additions 无序化）
    var bluredBody: ChordSymbolBlurBody {
        ChordSymbolBlurBody(quality: quality, sus: sus, additonsSet: Set(additions))
    }

    /// 将模糊 body 还原为标准化的精确 body（additions 按数字升序排列）
    /// 用于在 `chordSymbolToIntervalsMap` 中精确查找
    var deBluredBody: ChordSymbol {
        var result = body
        result.additions = additions.sorted {
            let lhs = $0.first(where: { $0.isNumber })?.numberOrder ?? 0
            let rhs = $1.first(where: { $0.isNumber })?.numberOrder ?? 0
            return lhs < rhs
        }
        return result
    }

    /// 模糊匹配是否合法：当前和弦的模糊 body 是否存在于预设的合法集合中
    var isBluredBodyValid: Bool {
        validSymbolsBluredBody.contains(bluredBody)
    }
}

// MARK: - Final Thing 由这个 ChordSymbol 最终决定的音乐元素

public extension ChordSymbol {
    /// 最终音程组
    /// 先通过模糊匹配验证合法性，再用标准化 body 精确查找音程
    /// - Returns: 对应的 `Intervals`；若模糊匹配不通过则返回 `nil`
    var finalIntervals: Intervals? {
        guard isBluredBodyValid else { return nil }
        return chordSymbolToIntervalsMap[deBluredBody]
    }

    var finalRootNoteClass: NoteClass? {
        guard let rootNoteLetter = rootNoteLetter?.toLetter else { return nil }
        guard let rootNoteAccCount = rootNoteAcc.toAccidental else { return nil }
        return NoteClass(letter: rootNoteLetter, accidental: rootNoteAccCount)
    }

    var finalBassNoteClass: NoteClass? {
        guard let bassNoteLetter = bassNoteLetter?.toLetter else { return nil }
        guard let bassNoteAccCount = bassNoteAcc.toAccidental else { return nil }
        return NoteClass(letter: bassNoteLetter, accidental: bassNoteAccCount)
    }

    func finalChord(ocRoot: Octave, ocBass: Octave) -> Chord? {
        // Interval
        guard let intervals = finalIntervals else { return nil }

        // Root Note
        guard let rootNoteLetterClass = finalRootNoteClass else { return nil }
        let rootNote = Note(noteClass: rootNoteLetterClass, octave: ocRoot)
        let bassNoteLetterClass = finalBassNoteClass

        // Base Note
        var bassNote: Note? = nil
        if let bassNoteLetterClass {
            bassNote = Note(noteClass: bassNoteLetterClass, octave: ocBass)
        }

        return Chord(root: rootNote, intervals: intervals, bass: bassNote)
    }
}
