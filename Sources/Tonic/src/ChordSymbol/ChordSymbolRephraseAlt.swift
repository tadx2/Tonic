//
//  ChordSymbolRephraseAlt.swift
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

extension ChordSymbol {

    /// Alt 和弦变化扩展音集合
    ///
    /// 包含常见的导致强烈紧张感和解决倾向的**变化音（♭5, ♯5, ♭9, ♯9, ♭11, ♯11, ♭13, ♯13）**
    private static let alteredAdditionsList: Set<ChordSymbolElementGroup> = [
        .flat5, .sharp5, .flat9, .sharp9, .flat11, .sharp11, .flat13, .sharp13
    ]

    /// 判断当前和弦是否具备改写为 **Alt 简写**（例如 `C7(b9, #11)` -> `C7alt` 或 `Calt`）的前置条件。
    ///
    /// 判定规则（必须同时满足）：
    /// 1. `quality` 必须是原生的属七和弦（即 `.seven`）。
    /// 2. `additions` 中至少包含任意一个变化音
    public var canRephraseAlt: Bool {
        (self.quality == ChordSymbolElementGroup.seven) && 
        additions.contains { group in Self.alteredAdditionsList.contains(group) }
    }

    /// **Alt 简写改写**
    /// 将一类带有变化扩展音的属七和弦直接简写为 Alt 和弦。
    ///
    /// - 规则：
    ///   1. 将主和弦质量（quality）改为 `7alt` 以及纯粹的 `alt` 两种形式。
    ///   2. 从 `additions` 中移除**所有**已被 Alt 涵盖的、制造紧张感的变化张力音。
    ///
    /// - Returns:
    ///   返回一个数组，包含两种典型的 Alt 改写形式：
    ///   - `7alt`: 质量为 `[.seven, .alt]` 且去除了对应变化扩展音的结果。
    ///   - `alt`:  质量仅为 `[.alt]` 且去除了对应变化扩展音的结果。
    public var rephrasedAlt: [ChordSymbol]? {
        guard canRephraseAlt else { return nil }

        // 处理 1: 改写为 7alt (七变化和弦)
        var sevenAlt = self
        sevenAlt.quality = ChordSymbolElementGroup.sevenAlt
        sevenAlt.additions.removeAll { group in
            Self.alteredAdditionsList.contains(group)
        }

        // 处理 2: 直接改写为 alt (纯变化和弦)
        var onlyAlt = self
        onlyAlt.quality = ChordSymbolElementGroup.alt
        onlyAlt.additions.removeAll { group in
            Self.alteredAdditionsList.contains(group)
        }

        return [sevenAlt, onlyAlt]
    }
}
