//
//  ChordSymbolRephraseWrongTension.swift
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

extension ChordSymbol {

    /// **WrongTension 映射表**
    ///
    /// 考虑到有些书写习惯会使用 2 来替代 9，用 4 来替代 11。
    /// （如果后续要新增映射，比如 `flat11` -> `flat4`，只需在此字典里加一行，无需改动下方逻辑）。
    private static let wrongTensionMap: [ChordSymbolElementGroup: ChordSymbolElementGroup] = [
        .nine: [.two],
        .flat9: [.flat, .two],
        .sharp9: [.sharp, .two],
        .eleven: [.four],
        .sharp11: [.sharp, .four]
    ]

    /// 判断当前和弦是否只包含单个可被降级替换的“异常”张力音（如 9 写作 2）。
    ///
    /// 判定规则（必须同时满足）：
    /// 1. `additions` 有且仅有 1 个扩展组。
    /// 2. 这个扩展组是在 `wrongTensionMap` 中支持替换的张力音（如 9, b9, #11 等）。
    public var canRephraseWrongTension: Bool {
        additions.count == 1 && Self.wrongTensionMap.keys.contains(additions[0])
    }

    /// **WrongTension 改写**
    /// 将类似 `add9` 的扩展改写为 `add2`，将 `add11` 改写为 `add4` 这种更为初学者的写法。
    ///
    /// - 返回值：
    ///   如果符合条件，就返回一个替换好 `additions` 的新的 `ChordSymbol`，否则返回 `nil`。
    public var rephrasedWrongTension: ChordSymbol? {
        guard canRephraseWrongTension,
              let replacement = Self.wrongTensionMap[additions[0]]
        else { return nil }

        var result = self
        
        // 直接将 `additions` 替换为我们映射降级后的数组
        result.additions = [replacement]
        
        return result
    }
}
