//
//  Chord+ChordSymbol.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

// For Chord Symbol
extension Chord {

    /// 获取当前和弦的**基础符号外壳（Base Case）**。
    /// 提取出除根音以外、位于 7 度以内的基础音程（如 3、5、7），
    /// 并通过比对映射到对应的主和弦类型（如 `Major7`、`Minor7`）。
    public var symbolBaseCase: ChordSymbolCase? {

        // 过滤掉根音（1度，包含 P1等变体）及高位张力音（>7度），仅保留结构音程
        let intervalsWithoutTensionWithoutRootInterval: Set<Interval> =
            self.intervalsRaw
            .filter { $0.degreeInt != 1 && $0.degreeInt <= 7 }
            .subtracting([.P1])

        // 匹配并返回 ChordSymbolCase 预设库中的唯一有效组合
        return ChordSymbolCase.allCases.first(where: {
            $0.intervals == intervalsWithoutTensionWithoutRootInterval
        })
    }
    
    /// **Tension 张力音映射字典**
    /// 负责将高位张力音程（如 M9, A11 等）直接映射为和弦符号扩展组类型。
    private static let tensionIntervalMap: [Interval: ChordSymbolElementGroup] = [
        .m9: .flat9,
        .M9: .nine,
        .A9: .sharp9,
        .d11: .flat11,
        .P11: .eleven,
        .A11: .sharp11,
        .m13: .flat13,
        .M13: .thirteen,
        .A13: .sharp13
    ]

    /// **生成包含张力音的完整和弦符号序列（Symbol Groups）**
    /// 将获取到的基础和弦（如 `Cmaj7`），进一步将超出八度的张力音追加为 `additions`。
    /// 
    /// - Returns: 当前和弦全部合法的符号表示数组（基底变体 + 统一的张力后缀），若基底无法识别则返回 `nil`。
    public var symbolGroups: [ChordSymbol]? {
        
        // 1. 获取对应的基底组合（若当前和弦组成音不存在常见基底定义则无法转换）
        guard let chordSymbolCase = self.symbolBaseCase else { return nil }
        
        // 2. 获取预设中定义好的该和弦基底所有的表达方式（如 `Major7` 可以有多种文本记法）
        let baseSymbols: [ChordSymbol] = chordSymbolCase.chordSymbols

        // 3. 过滤并提取出当前和弦含有所有的张力音程（度数 > 7），以从小到大的顺序排列
        let intervalsTension = self.intervalsRaw.filter { $0.degreeInt > 7 }.sorted()

        // 4. 将提取出的张力音程通过字典快速转译成扩展元素组
        let intervalSymbols: [ChordSymbolElementGroup] = intervalsTension.compactMap {
            Self.tensionIntervalMap[$0]
        }

        // 5. 对所有的可用基底做遍历，各自独立地追加我们整合好的张力后缀
        return baseSymbols.map { baseSymbol in
            var modifiedSymbol = baseSymbol
            modifiedSymbol.additions.append(contentsOf: intervalSymbols)
            return modifiedSymbol
        }
    }
    
}


