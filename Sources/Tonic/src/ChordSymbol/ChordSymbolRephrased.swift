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
    public var rephrased: RephrasedSymbols {
        (
            seventh: self.rephrasedSeventh,
            sixNine: self.rephrasedSixNine,
            alt: self.rephrasedAlt,
            wrongTension: self.rephrasedWrongTension
        )
    }
    
}

/// 和弦名的书写方式。在没有考虑到 tension 的时候，已经由 `ChordSymbolBaseCase` 指定好了多个表达方式；
/// 当考虑到 Tension 时，如果符合简写合并规则，则可以采取此处的合并简写。
///
/// - 返回值：一个平铺好的数组，包含当前和弦所有合法的张力改写结果。
//public var rephrasedSymbols: [ChordSymbol] {
//    let items = self.rephrased
//    
//    // 汇集所有的单体改写结果
//    var result = [
//        items.seventh,
//        items.sixNine,
//        items.wrongTension
//    ].compactMap { $0 }
//    
//    // 追加可能的数组改写结果（如 Alt 改写可能会生成 7alt 和纯 alt 两种）
//    if let altSymbols = items.alt {
//        result.append(contentsOf: altSymbols)
//    }
//    
//    return result
//}
