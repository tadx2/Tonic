//
//  ChordSymbolRelationValid.swift
//  Tonic
//
//  Created by 小汤汤 on 3/19/26.
//

// MARK: Valid

// 外部对和弦符号进行判断 合法
// - Valid 是否合法，是否存在在预设中

public extension ChordSymbol {
    // Body & Main

    /// 判断 bodySymbol 在不在 validSymbolsBody 中, 用来做最准确的判断
    var isBodyValid: Bool {
        validSymbolsBody.contains(body)
    }

    /// 判断 bodySymbol的main 在不在 validSymbolsMain 中, 用来做main部分的判断
    var isMainValid: Bool {
        return validSymbolsMain.contains(main)
    }

    // Letter

    var isBsRnNoteSame: Bool {
        guard rootNoteLetter != nil else { return true } // rootNoteLetter 不为 nil， 否则 bs letter 怎么样都是 valid
        return ([rootNoteLetter] + rootNoteAcc) == ([bassNoteLetter] + bassNoteAcc)
    }

    // var isRootNoteValid: Bool { return true } // TODO

    // ACC

    private static let validAccNote: Set<ChordSymbolElementGroup> = [.b, .bb, .s, .ss, []]

    private static let validAccAddition: Set<ChordSymbolElementGroup> = [.b, .s, []]

    var isRnAccValid: Bool {
        Self.validAccNote.contains(rootNoteAcc)
    }

    var isBsAccValid: Bool {
        Self.validAccNote.contains(bassNoteAcc)
    }

    // Addition

    /// Item  Valid 从数字角度判断
    func isAdditionItemNumberValid(index: Int) -> Bool {
        guard additions.indices.contains(index) else { return false }

        // 每个 addition item 必须包含恰好一个数字元素
        return additions[index].filter { $0.isNumber }.count == 1
    }

    /// Item  Valid 从Acc角度判断
    func isAdditionItemAccValid(index: Int) -> Bool {
        guard additions.indices.contains(index) else { return false }
        guard additions[index] != [.flat, .flat, .seven] else { return true } // 特殊情况，bb7可以出现在 addition 中

        // 提取 acc 部分（非 number 的元素）
        let acc = additions[index].filter { $0.isAccidental }
        return Self.validAccAddition.contains(acc)
    }

    /// 整个Additon 的 顺序写法
    /// 验证 additions 中的 tension 是否按数字严格递增排列
    /// 例如 (♭9)(♯11)(13) 合法，(♯11)(♭9) 不合法
    var isAdditionOrderValid: Bool {
        // 1. 提取每个 addition group 中的数字元素（如 .nine、.eleven、.thirteen），忽略无数字的 group
        let numbers = additions.compactMap { group in
            group.first(where: { $0.isNumber })
        }
        // 2. 0 或 1 个 tension 不存在排序问题，直接合法
        guard numbers.count > 1 else { return true }
        // 3. 逐对比较相邻元素的 numberOrder，前一个 >= 后一个则不是严格递增，返回 false
        for i in 1 ..< numbers.count {
            guard numbers[i - 1].numberOrder < numbers[i].numberOrder else { return false }
        }
        return true
    }
}
