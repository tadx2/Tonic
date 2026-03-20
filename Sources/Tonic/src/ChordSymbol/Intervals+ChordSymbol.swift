//
//  Intervals+ChordSymbol.swift
//  Tonic
//
//  Created by 小汤汤 on 12/31/25.
//

// For ChordSymbol
extension Intervals {
    
    /// ** Chord Basic Case  基础和弦**
    /// 提取出除根音以外、位于 7度以内的基础音程，并通过音程关系映射到对应的种类 `ChordBasicCase`。 若音程无法识别则返回 `nil`。
    private var chordBasicCase: ChordBasicCase? {
        // 过滤掉根音（1度，包含 P1等变体）及高位张力音（>7度），仅保留结构音程
        let intervalsOmitTensionRoot: Set<Interval> = self.filter { $0.degreeInt != 1 && $0.degreeInt <= 7 }

        // 匹配并返回 ChordBasicCase 预设中的唯一有效组合
        return ChordBasicCase.allCases.first(where: {
            $0.intervals == intervalsOmitTensionRoot
        })
    }
    
    /// **Chord Interval Tension Map  张力音音程符号映射字典**
    /// 负责将高位张力音程`Interval`（如 M9, A11 等）直接映射为和弦符号扩展组类型 `ChordSymbolElementGroup`。
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

    /// **Chord Symbol Raw (Unrephrased) Sequence 和弦符号原始序列**
    /// 内部先获取到的基础和弦（ 八度音程关系以下构成的symbols `symbolShells` 作为可以改造的symbols ）。进一步将超出八度的张力音追加为 `additions`。
    /// 原本预设中包含多个symbolShell，表明 和弦有多个基础写法。例如 [P1, M3, P5, M7] 大七和弦， 可以有 Xmaj7 / Xmaj(7) 两个写法，所以返回 symbolShells 中包含两个 ChordSymbol
    ///
    /// - Returns:包含张力音的和弦符号(未加入改写)序列（基底 symbolShells + 张力后缀），若基底无法识别则返回 `nil`。

    private var symbolRawSequence: [ChordSymbol]? {
        
        // - 获取对应的基础和弦种类`BasicCase`（若当前组成音不存在定义的基础各类，则无法转换）
        guard let chordBasicCase = self.chordBasicCase else { return nil }
        
        // - 获取预设中定义好的基底
        let symbolShells: [ChordSymbol] = chordBasicCase.symbolShells

        // - 过滤并提取出当前和弦含有所有的张力音程（度数 > 7），以从小到大的顺序排列
        let intervalsTension = self.filter { $0.degreeInt > 7 }.sorted()

        // - 将提取出的张力音程通过字典快速转译成扩展元素组
        let intervalSymbols: [ChordSymbolElementGroup] = intervalsTension.compactMap {
            Self.tensionIntervalMap[$0]
        }

        // - 对所有的可用基底做遍历，各自独立地追加整合好的张力后缀 `additions`
        return symbolShells.map { symbolShell in
            var modifiedSymbol = symbolShell
            modifiedSymbol.additions.append(contentsOf: intervalSymbols)
            return modifiedSymbol
        }
    }
    
    /// ** Chord's All Symbols (Rephrased) Sequence 和弦的所有符号(加入包括改写后的) 序列化**
    private var symbolsRephrasedSequence: [ChordSymbol] {
        guard let symbolRawSequence else { return [] }
        return symbolRawSequence.flatMap { [$0] + $0.rephrasedSymbolsSequence }
    }
    
    /// ** Chord's All Symbols (Rephrased) Set 和弦的所有符号(加入包括改写后的) 集合化**
    public var allSymbolsSet: Set<ChordSymbol> {
        return Set<ChordSymbol>(self.symbolsRephrasedSequence)
    }
    
}


