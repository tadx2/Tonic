//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

// 组成和弦名的基本单位
public enum ChordSymbolElementLetter: Sendable {
    case A, B, C, D, E, F, G, X
}

public struct ChordSymbol: Hashable {

    public var main: ChordSymbolPartMain?
    public var sus: ChordSymbolPartSus?
    public var addition: ChordSymbolPartAddition {
        didSet {
            self.addition = ChordSymbolPartAddition.normalizeAdditon(self.addition)
        }
    }

    public init(
        main: ChordSymbolPartMainCase? = nil,
        sus: ChordSymbolPartSus? = nil,
        addition: ChordSymbolPartAddition = []
    ) {
        self.main = main?.chordSymbolMainPart
        self.sus = sus
        self.addition = ChordSymbolPartAddition.normalizeAdditon(addition)
    }

    public init(
        main: ChordSymbolPartMain?,
        sus: ChordSymbolPartSus? = nil,
        addition: ChordSymbolPartAddition = []
    ) {
        self.main = main
        self.sus = sus
        self.addition = ChordSymbolPartAddition.normalizeAdditon(addition)
    }

    // 所有和弦的searchSet
    public static func ChordSymbolSearchDict() -> [ChordSymbol: Chord] {

        let allChord = ChordPreset(rootNote: .C4).allChords
        var result: [ChordSymbol: Chord] = [:]

        for chord in allChord {
            guard let chordSymbols = chord.symbols else { continue }
            for chordSymbol in chordSymbols {
                result[chordSymbol] = chord
            }
        }

        return result
    }

}

extension ChordSymbol {

    /// 和弦名的书写方式，在没有考虑到tension的时候，已经由 ChordSymbolBaseCase 指定好了 多个表达方式
    /// 但是，考虑到Tension的时候，又可以采取以下写法

    // 所有多重表示组成一个list进行返回为Chord用
    internal var rephraseSymbols: [ChordSymbol] {
        [rephraseSeventh, rephraseSixNine, rephraseAlt].compactMap { $0 }
    }

    /// 写法: **Tension合并**
    /// 当 numberWithAcc == .seven 的时候，可以采取MergeTension, 即让7与多个Tension合并

    var canRephraseSeventh: Bool {
        (main?.numberWithAcc == .seven) &&
        ( addition.contains(.nine) ||
          addition.contains(.eleven) ||
          addition.contains(.thirteen) )
    }

    var rephraseSeventh: ChordSymbol? {
        
        guard canRephraseSeventh else { return nil}
        
        var result = self
        
        // 情况1, 含有一个大9度/纯11/大13度的音程，简写
        if result.addition.contains(.nine) && result.addition.contains(.eleven)
            && result.addition.contains(.thirteen)
        {
            result.main?.numberWithAcc = .thirteen
            result.addition.removeAll(where: { $0 == .nine || $0 == .eleven || $0 == .thirteen }
            )
            return result
            
            // 情况2, 含有一个大9度/纯11度的音程，简写
        } else if result.addition.contains(.nine) && result.addition.contains(.eleven) {
            result.main?.numberWithAcc = .eleven
            result.addition.removeAll(where: { $0 == .nine || $0 == .eleven })
            return result
            
            // 情况3, 含有一个 大9度的音程，简写过来
        } else if result.addition.contains(.nine) {
            result.main?.numberWithAcc = .nine
            result.addition.removeAll(where: { $0 == .nine })
            return result
        }
        
        return nil
    }

    /// 写法:  **69和弦简写**
    /// 如果原本的和弦有一个 数字6（表示有一个6音），改造前又有一个additon为9，表示有一个 tension 9
    /// 最终可以输出为69

    var canRephraseSixNine: Bool {
        self.main?.numberWithAcc == .six && self.addition.contains(.nine)
    }

    /// 原本的情况是：
    /// mainPart = ChordSymbolPartMain(keywords: [xxx], numberWithAcc: .six )
    ///
    /// 其实就是某个带6的和弦，
    /// 改造后的和弦情况是：ChordSymbolPartMain(keywords: [xxx], numberWithAcc: .six, addition: [.nine, xxx])
    /// return nil 表示不存在 可以改造的情况
    var rephraseSixNine: ChordSymbol? {
        
        guard self.canRephraseSixNine else { return nil }
        
        var result = self
        
        // 把 原本数字6拿掉, 换成9
        result.main?.numberWithAcc = .nine
        
        // 把数字6放到keywords里面，因为是append所以，一定是加到最后面
        result.main?.keywords.append(.six)
        
        // 再把addition的9拿掉
        result.addition.removeAll(where: { $0 == .nine })

        return result
    }
    
    /// 写法： **Atl简写**
    /// 如果考虑到和弦简写的时候
    var canRephraseAlt: Bool {
        
        /// Alt和弦（Altered Chord，变化和弦）是爵士乐中一类重要的属七和弦变体，其核心特征是通过降五音（♭5）和降九音（♭9）等变化音，制造出强烈的紧张感和解决倾向
        
        // Alt和弦在简写之前一定是一个属七和弦
        guard self.main == ChordSymbolPartMain(numberWithAcc: .seven) else {return false}
        
        // 在addition中包含任意 变化音 5/9/11/13，都认定为是一个Alt
        if self.addition.contains(.fiveFlat) { return true }
        if self.addition.contains(.fiveSharp) { return true }
        
        if self.addition.contains(.nineFlat) { return true }
        if self.addition.contains(.nineSharp) { return true }
        
        if self.addition.contains(.elevenSharp) { return true }
        
        if self.addition.contains(.thirteenFlat) { return true }
        if self.addition.contains(.thirteenSharp) { return true }
        
        return false
    }
    
    var rephraseAlt: ChordSymbol? {
        guard canRephraseAlt else { return nil }
        var result = self
        
        // 把keywords 替换成
        result.main = ChordSymbolPartMain(keywords: [.seven, .alt])
        
        result.addition.removeAll {
            $0 == .fiveFlat ||
            $0 == .fiveSharp ||
            $0 == .nineFlat ||
            $0 == .nineSharp ||
            $0 == .elevenSharp ||
            $0 == .thirteenFlat ||
            $0 == .thirteenSharp
        }
        
        return result
        
    }

}

extension ChordSymbol {

    // 把ChordSymbol扁平化为一个ChordSymbolInputElement数据结构
    public var flatInputSymbolElement: [ChordSymbolInputElement] {

        // Main
        let flatMainKeyWord: [ChordSymbolInputElement] =
            self.main?.keywords.map { keyword in
                return .keyword(keyword)
            } ?? []

        // Main Number with acc
        var flatMainNumberWithAcc: [ChordSymbolInputElement] = []

        let flatMainAcc: [ChordSymbolInputElement] =
            self.main?.numberWithAcc?.accidentals.map { acc in
                return .accidental(acc)
            } ?? []

        flatMainNumberWithAcc = flatMainAcc

        if let flatMainNumber = self.main?.numberWithAcc?.number {
            flatMainNumberWithAcc.append(.number(flatMainNumber))
        }

        // Sus
        var flatSus: [ChordSymbolInputElement] = []

        if let susKeyword = self.sus?.keyword {
            flatSus.append(.keyword(susKeyword))
        }

        let flatSusAcc: [ChordSymbolInputElement] =
            self.sus?.numberWithAcc?.accidentals.map { acc in
                return .accidental(acc)
            } ?? []
        flatSus += flatSusAcc

        if let susNumber = self.sus?.numberWithAcc?.number {
            flatSus.append(.number(susNumber))
        }

        // Addition
        var flatAddition: [ChordSymbolInputElement] = []

        for addition in self.addition {
            let flatAddAcc = addition.accidentals.map { acc in
                return ChordSymbolInputElement.accidental(acc)
            }
            flatAddition += flatAddAcc

            if let addNumber = addition.number {
                flatAddition.append(.number(addNumber))
            }
        }

        return flatMainKeyWord + flatMainNumberWithAcc + flatSus + flatAddition
    }

    public typealias ChordSymbolRelation = (chord: Chord, symbol: ChordSymbol)

    public static func ChordSymbolElementSequenceDict() -> [ChordSymbolInputElementSequence:
        [ChordSymbolRelation]]
    {
        let symbolDict = ChordSymbolSearchDict()
        var result: [ChordSymbolInputElementSequence: [ChordSymbolRelation]] = [:]

        for (chordSymbol, chord) in symbolDict {
            let flatElements = chordSymbol.flatInputSymbolElement
            result[flatElements, default: []].append((chord: chord, symbol: chordSymbol))
        }
        return result
    }

}
