//
//  ChordSymbolRephased.swift
//  Tonic
//
//  Created by 小汤汤 on 3/18/26.
//

extension ChordSymbol {
    
    /// 将各个维度的改写结果打包，方便外部或者内部特定情形下统一获取和调试。
    /// （如果不支持某种改写，则对应字段为 `nil`）
    public typealias RephrasedSymbols = (
        seventh: ChordSymbol?,
        sixNine: ChordSymbol?,
        alt: [ChordSymbol]?,
        wrongTension: ChordSymbol?
    )
    
    /// 获取当前和弦所有维度的改写状态
    public var rephrasedSymbols: RephrasedSymbols {
        (
            seventh: self.rephrasedSeventh,
            sixNine: self.rephrasedSixNine,
            alt: self.rephrasedAlt,
            wrongTension: self.rephrasedWrongTension
        )
    }
    
    // 按照 顺序返回 rephrased 后的 chord symbol
    public var rephrasedSymbolsSequence: [ChordSymbol] {
        let items = self.rephrasedSymbols
        
        var result = [
            items.seventh,
            items.sixNine,
            items.wrongTension
        ].compactMap { $0 }
        
        if let altSymbols = items.alt {
            result.append(contentsOf: altSymbols)
        }
        
        return result
    }
    
}
