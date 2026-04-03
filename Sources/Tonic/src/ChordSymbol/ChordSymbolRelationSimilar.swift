//
//  ChordSymbolRelationSimilar.swift
//  Tonic
//
//  Created by 小汤汤 on 3/19/26.
//

public extension ChordSymbol {
    /// 获取当前和弦的推荐相似和弦列表。
    /// 综合了“按基础属性匹配”和“通过添加引伸音扩展”的结果，并执行合并去重，同时保留展示的优先级顺序。
    /// 主要用于 UI（如键盘上方提示条）给用户提供输入和弦扩展或替代选项的建议。
    var similarSymbol: [ChordSymbol] {
        var seen: Set<ChordSymbol> = []
        return (similarSymbolsWhenQualityElementEqual + similarSymbolsWhenAddTension).filter { seen.insert($0).inserted }
    }
}

// MARK: - 基于 Quality 元素的相似和弦匹配

extension ChordSymbol {
    /// 提取出基于和弦基本性质（Quality）首尾元素进行匹配得到的所有推荐和弦。
    /// 会合并首尾元素的匹配结果并自动去重，确保返回的每个元素唯一，且先后顺序遵循匹配层级。
    private var similarSymbolsWhenQualityElementEqual: [ChordSymbol] {
        var seen: Set<ChordSymbol> = []
        return (similarSymbolsWhenQualityElementEqualFirst + similarSymbolsWhenQualityElementEqualLast).filter { seen.insert($0).inserted }
    }

    /// 获取原和弦 Quality 数组中第一个元素（主要性质）所对应的相近色彩或拓展和弦。
    private var similarSymbolsWhenQualityElementEqualFirst: [ChordSymbol] {
        let thisSymbol = body

        guard let firstElement = thisSymbol.quality.first else { return [] }

        return Self.similarSymbolsWhenQualityElementEqualTo(element: firstElement)
    }

    /// 获取原和弦 Quality 数组中最后一个元素（次要或叠加性质）所对应的相近或拓展和弦。
    private var similarSymbolsWhenQualityElementEqualLast: [ChordSymbol] {
        let thisSymbol = body

        guard let firstElement = thisSymbol.quality.last else { return [] }

        return Self.similarSymbolsWhenQualityElementEqualTo(element: firstElement)
    }

    /// （核心字典方法）根据单一的和弦性质元素（`ChordSymbolElement`），映射出一系列色彩相近或者能顺滑替代的和弦推荐。
    /// 例如对于大调 (major)，最常见的平替推荐为：大七 (major7)、大九 (major9)、以及大十三 (major13) 和弦。
    /// - Parameter element: 需要进行匹配的单个和弦构建成分。
    /// - Returns: 色彩相近的 `ChordSymbol` 列表。
    private static func similarSymbolsWhenQualityElementEqualTo(element: ChordSymbolElement) -> [ChordSymbol] {
        switch element {
        case .major:
            [
                ChordSymbol(quality: .major7),
                ChordSymbol(quality: .major9),
                ChordSymbol(quality: .major13),
            ]
        case .minor:
            [
                ChordSymbol(quality: .minor7),
                ChordSymbol(quality: .minor9),
                ChordSymbol(quality: .minor13),
            ]
        case .six:
            [
                ChordSymbol(quality: .six9),
                ChordSymbol(quality: .six, additions: [.nine]),
                ChordSymbol(quality: .major7),
            ]
        case .seven:
            [
                ChordSymbol(quality: .nine),
                ChordSymbol(quality: .thirteen),
                ChordSymbol(quality: .eleven),
            ]
        case .nine:
            [
                ChordSymbol(quality: .thirteen),
                ChordSymbol(quality: .eleven),
            ]
        case .eleven:
            [
                ChordSymbol(quality: .nine),
                ChordSymbol(quality: .thirteen),
            ]
        case .thirteen:
            [
                ChordSymbol(quality: .nine),
                ChordSymbol(quality: .eleven),
            ]
        case .halfDiminished:
            [
                ChordSymbol(quality: .minor7),
                ChordSymbol(quality: .minor, additions: [.flat5]),
                ChordSymbol(quality: .diminished),
                ChordSymbol(quality: .seven),
            ]
        case .diminished:
            [
                ChordSymbol(quality: .diminished7),
                ChordSymbol(quality: .halfDiminished),
            ]
        case .augmented:
            [
                ChordSymbol(quality: .augmented7),
                ChordSymbol(quality: .major, additions: [.sharp5]),
                ChordSymbol(quality: .majorSharp5),
            ]
        case .alt:
            [
                ChordSymbol(quality: .sevenAlt),
            ]
        default:
            [
                ChordSymbol(quality: .major),
                ChordSymbol(quality: .minor),
                ChordSymbol(quality: .seven),
                ChordSymbol(quality: .halfDiminished),
                ChordSymbol(quality: .diminished),
                ChordSymbol(quality: .augmented),
            ]
        }
    }
}

// MARK: - 基于添加常见引伸音的扩展和弦推荐

extension ChordSymbol {
    /// 获取在当前和弦结构的基础上叠加上常用引伸音（如 9 音及 13 音）所能构成的有效和弦结构组合。
    private var similarSymbolsWhenAddTension: [ChordSymbol] {
        [similarSymbolsWhenAdd9, similarSymbolsWhenAdd13].compactMap { $0 }
    }

    /// 尝试在当前和弦结构的基础之上增添一个 9 音配属元素。
    /// 只有在新的和弦被判定为符合音乐法则合法（即能在 validSymbols 系统库中找到）时，才会将其作为合法的推荐供上层显示。
    private var similarSymbolsWhenAdd9: ChordSymbol? {
        var thisSymbol = body
        thisSymbol.additions.append(.nine)
        guard validSymbols.contains(thisSymbol) else { return nil }
        return thisSymbol
    }

    /// 尝试在当前和弦结构的基础之上增添一个 13 音配属元素。
    /// 判断构建出的结果集是否是合理的库录入和弦，若不成功即返回 nil。
    private var similarSymbolsWhenAdd13: ChordSymbol? {
        var thisSymbol = body
        thisSymbol.additions.append(.thirteen)
        guard validSymbols.contains(thisSymbol) else { return nil }
        return thisSymbol
    }
}
