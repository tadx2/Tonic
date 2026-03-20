//
//  ChordSymbolRelationBestPractice.swift
//  Tonic
//
//  Created by 小汤汤 on 3/20/26.
//

import Foundation

extension ChordSymbol {
    
    /// **Best Practice 最佳实践写法**
    /// 获取当前和弦是否有一种更标准或更简洁的写法。
    /// 例如：
    /// - 用户输入: `Mb5(7)` -> 最佳实践返回: `M7(b5)`
    /// - 用户输入: `M7(9)` -> 最佳实践返回: `M9`
    /// - 用户输入: `M9(11 13)` -> 最佳实践返回: `M13`
    ///
    /// - Returns: 如果存在更好的写法，则返回包含原根音的完整更好写法的 `ChordSymbol`；如果当前已经是最好写法或无法识别，则返回 `nil`。
    public var bestPractice: ChordSymbol? {
        
        // 先检查当前和弦符号（不带根音的 body）是否合法
        guard validSymbols.contains(self.body) else { return nil }
        
        // alt 和弦不在本次的比较中
        guard !self.body.quality.contains(.alt) else { return nil }
        
        // 找到该和弦符号最可能对应的理论音程组合
        guard let mostLikelyintervals = chordSymbolToIntervalsMap[self.body] else { return nil }
        
        // 获取该音程组合的基础符号写法序列（raw symbols），取第一个作为最标准的基底写法（例如 Mb5(7) 的理论音程基础写法是 M7(b5)）
        guard let rawSymbol = mostLikelyintervals.symbolRawSequence?.first else { return nil }
        
        // 基底写法不一定是最好的，还能简写7， 简写69， 或者简写为7Alt
        // 获取改写后的最好写法 betterSymbol
        var betterSymbolBody: ChordSymbol = rawSymbol
        
        if let rephrasedSeventh = rawSymbol.rephrasedSeventh {
            betterSymbolBody = rephrasedSeventh
        } else if let rephrasedSixNine = rawSymbol.rephrasedSixNine {
            betterSymbolBody = rephrasedSixNine
        } else if let rephrasedAlt = rawSymbol.rephrasedAlt {
            if let altSymbol = rephrasedAlt.first {
                betterSymbolBody = altSymbol
            }
        }
        
        // 但是，这里要注意哦，不要把 rephraseWrongTension也写判断进来
        // wrongTension就是错的，不是最好的写法
        // 如果用户输入的是一个wrongTension，首先会因为 mostLikelyintervals 的过程找到正确的音程，然后由正确的音程获取到最合适的写法，然后纠正用户
        
        // 如果发现最好的写法和当前写法的 body 完全一样，说明当前已经是最佳实践，返回 nil
        guard betterSymbolBody != self.body else { return nil }
        
        // 将产生的更好的写法与原和弦的根音及其变音记号组合，返回完整的和弦符号
        return ChordSymbol(
            rootNoteLetter: self.rootNoteLetter,
            rootNoteAcc: self.rootNoteAcc,
            quality: betterSymbolBody.quality,
            sus: betterSymbolBody.sus,
            additions: betterSymbolBody.additions
        )
        
    }
}
