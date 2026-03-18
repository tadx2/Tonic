//
//  ChordSymbolRephraseSixNine.swift
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

extension ChordSymbol {

    /// 判断当前和弦是否具备改写为 **69 合并写法**（例如 `C6(add9)` -> `C69`）的前置条件。
    ///
    /// 判定规则（必须同时满足）：
    /// 1. `quality` 必须是包含 6 音的和弦之一。
    ///    （支持：`.six`, `.major6`, `.minor6`, `.augmented6`, `.diminished6`）
    /// 2. `additions` 中包含自然张力音 `.nine` (即 `9`)。
    ///
    /// - 示例：
    ///   - `quality = .six`, `additions = [.nine]` -> `true`
    ///   - `quality = .major6`, `additions = [.nine]` -> `true`
    ///   - `quality = .six`, `additions = [.flat9]` -> `false`（不包含自然音 9）
    public var canRephraseSixNine: Bool {
        [
            ChordSymbolElementGroup.six,
            .major6,
            .minor6,
            .augmented6,
            .diminished6,
        ].contains(self.quality) && additions.contains(.nine)
    }

    /// **69 和弦改写**
    /// 如果原和弦是一个 6 和弦且带有 `add9`（自然张力音 9），最终输出为对应的 69 和弦（如 `69`, `maj69`, `min69` 等）。
    ///
    /// - 规则：
    ///   1. 将主和弦质量（quality）追加张力音 9。
    ///   2. 从 `additions` 中彻底移除该自然张力音 9。
    ///
    /// - 示例：
    ///   - `6 + [9]` -> 升阶为 `69`
    ///   - `maj6 + [9, #11]` -> 升阶为 `maj69 + [#11]`
    public var rephrasedSixNine: ChordSymbol? {
        guard canRephraseSixNine else { return nil }
        
        var result = self

        // 1. 将主和弦质量追加 .nine
        // （例如 [.major, .six] 加上 [.nine] 变成 [.major, .six, .nine]，这正是 .major69 的定义）
        result.quality.append(contentsOf: ChordSymbolElementGroup.nine)

        // 2. 将在扩展列表中的多余自然张力音（9）移除
        result.additions.removeAll { group in
            group == .nine
        }
        
        return result
    }
}
