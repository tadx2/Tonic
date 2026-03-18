//
//  ChordSymbolRephaseSeventh
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

extension ChordSymbol {

    /// 判断当前和弦是否具备改写为 **Seventh 合并写法**（例如 `C7(add9)` -> `C9`）的前置条件。
    ///
    /// 判定规则（必须同时满足）：
    /// 1. `quality` 必须是可升阶的七和弦之一。
    ///    （支持：`.seven`, `.major7`, `.minor7`, `.minorMajor7`, `.augmented7`, `.diminished7`）
    /// 2. `additions` 中至少包含一个可被合并的高位自然张力音。
    ///    （支持：`.nine`, `.eleven`, `.thirteen`）
    ///
    /// - 示例：
    ///   - `quality = .seven`, `additions = [.nine]` -> `true`
    ///   - `quality = .major7`, `additions = [.nine]` -> `true`
    ///   - `quality = .seven`, `additions = [.flat9]` -> `false`（仅处理自然张力音）
    public var canRephraseSeventh: Bool {
        [
            ChordSymbolElementGroup.seven,
            .major7,
            .minor7,
            .minorMajor7,
            .augmented7,
            .diminished7,
        ].contains(self.quality) && (preferredSeventhExtension != nil)
    }

    /// 获取当前和弦中可用于合并的**最高位自然张力音**。
    /// 优先选取数值最大的张力音，若和弦不包含相关张力音，则返回 `nil`。
    private var preferredSeventhExtension: ChordSymbolElementGroup? {
        if additions.contains(.thirteen) { return .thirteen }
        if additions.contains(.eleven) { return .eleven }
        if additions.contains(.nine) { return .nine }
        return nil
    }

    /// 获取需要被合并删除的**自然张力音集合**。
    /// 
    /// - Parameter target: 当前最高位的自然张力音
    /// - Returns: 该目标张力音及其涵盖的所有低位自然张力音。
    ///   例如：如果最高是 13，那么原和弦中的 9、11、13 都应该被提取并删除。
    private static func mergedTensionRemovals(for target: ChordSymbolElementGroup) -> Set<
        ChordSymbolElementGroup
    > {
        switch target {
        case .thirteen:
            [.nine, .eleven, .thirteen]
        case .eleven:
            [.nine, .eleven]
        case .nine:
            [.nine]
        default:
            []
        }
    }

    /// **Tension 合并**
    /// 将 `7` 类和弦与其 `additions` 中的高位张力音合并，例如将 `7(add9/add11/add13)` 合并为主符号如 `9/11/13` 的写法。
    ///
    /// - 规则：
    ///   1. 优先级为 `13 > 11 > 9`（存在多层扩展时，主和弦直接升阶至最高的主符号）。
    ///   2. 被合并的自然扩展音（9/11/13）会从 `additions` 中移除。
    ///   3. 其他所有变化扩展音（如 `b9`, `#11` 等）**安全保留**。
    ///
    /// - 示例：
    ///   - `7 + [9]` -> 升阶为 `9`
    ///   - `7 + [9, 11]` -> 升阶为 `11`
    ///   - `7 + [9, 11, 13, b9]` -> 升阶为 `13 + [b9]`
    public var rephrasedSeventh: ChordSymbol? {
        guard canRephraseSeventh else { return nil }
        guard let preferredSeventhExtension else { return nil }
        
        var result = self

        // 1. 将主和弦质量（quality）从 7 更改为最高位扩展。
        // （先移除 7，再把张力音追加进去。如：将 .major 再加入 .nine，变成 major9）
        result.quality.removeAll { $0 == .seven }
        result.quality.append(contentsOf: preferredSeventhExtension)

        // 2. 将在扩展列表中的多余高位自然张力音（9/11/13）移除。
        let readyToDeleteAdditionsList = Self.mergedTensionRemovals(for: preferredSeventhExtension)

        result.additions.removeAll { group in
            readyToDeleteAdditionsList.contains(group)
        }
        
        return result
    }
}
