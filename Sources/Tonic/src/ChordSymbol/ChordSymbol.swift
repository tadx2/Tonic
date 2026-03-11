//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

public struct ChordSymbol: Hashable{
    
    

    public var main: ChordSymbolElements
    public var sus: ChordSymbolElements
    public var additions: [ChordSymbolElements]

    public init( _ main: ChordSymbolElementsCase? = nil,
                 sus: ChordSymbolElementsCase? = nil,
                 additions: [ChordSymbolElementsCase] = []
    ) {
        self.main = main?.elements ?? []
        self.sus = sus?.elements ?? []
        self.additions = additions.map{
            $0.elements
        }
    }

//    // 所有和弦的searchSet
//    public static func ChordSymbolSearchDict() -> [ChordSymbol: Chord] {
//
//        let allChord = ChordPreset(rootNote: .C4).allChords
//        var result: [ChordSymbol: Chord] = [:]
//
//        for chord in allChord {
//            guard let chordSymbols = chord.symbols else { continue }
//            for chordSymbol in chordSymbols {
//                result[chordSymbol] = chord
//            }
//        }
//
//        return result
//    }

}

extension ChordSymbol {

    /// 和弦名的书写方式，在没有考虑到tension的时候，已经由 ChordSymbolBaseCase 指定好了 多个表达方式
    /// 但是，考虑到Tension的时候，又可以采取以下写法

    // 所有多重表示组成一个list进行返回为Chord用
    internal var rephraseSymbols: [ChordSymbol] {
        [rephraseSeventh, rephraseSixNine, rephraseAlt, rephraseWrongTension].compactMap { $0 }
    }

    /// 写法: **Tension合并**
    /// 当 numberWithAcc == .seven 的时候，可以采取MergeTension, 即让7与多个Tension合并

    var canRephraseSeventh: Bool {
        
        // 条件1. main中有7 且 不是一个变化的7
        ( self.main.contains(.number(.seven)) && !self.main.contains(.acc(.flat)) ) &&
        // 条件2. tension中有纯tension
        ( additions.contains([ChordSymbolElement.number(.nine)]) ||
        additions.contains([ChordSymbolElement.number(.eleven)]) ||
        additions.contains([ChordSymbolElement.number(.thirteen)]) )
    }

    var rephraseSeventh: ChordSymbol? {
        
        guard canRephraseSeventh else { return nil}
        
        var result = self
        
        // 情况1, 同时含有 大9度/纯11/大13度的音程，简写
        if result.additions.contains([ChordSymbolElement.number(.nine)]) &&
           result.additions.contains([ChordSymbolElement.number(.eleven)]) &&
           result.additions.contains([ChordSymbolElement.number(.thirteen)]) {
            
            // 把 .number(.seven) 替换成 .number(.thirteen)， 再删除addition中的 9/11/13
            if let index = result.main.firstIndex(of: .number(.seven)) {
                result.main[index] = .number(.thirteen)
            }
            
            result.additions.removeAll { addition in
                addition == [.number(.nine)] ||
                addition == [.number(.eleven)] ||
                addition == [.number(.thirteen)]
            }
            
            return result
            
        // 情况2, 含有一个大9度/纯11度的音程，简写
        } else if result.additions.contains([ChordSymbolElement.number(.nine)]) &&
                    result.additions.contains([ChordSymbolElement.number(.eleven)]) {
            
            if let index = result.main.firstIndex(of: .number(.seven)) {
                result.main[index] = .number(.eleven)
            }
            result.additions.removeAll { addition in
                addition == [.number(.nine)] ||
                addition == [.number(.eleven)]
            }
            return result
            
        // 情况3, 含有一个 大9度的音程，简写过来
        } else if result.additions.contains([ChordSymbolElement.number(.nine)]) {
            
            if let index = result.main.firstIndex(of: .number(.seven)) {
                result.main[index] = .number(.nine)
            }
            result.additions.removeAll { addition in
                addition == [.number(.nine)]
            }
            return result
        }
        
        return nil
    }

    /// 写法:  **69和弦简写**
    /// 如果原本的和弦有一个 数字6（表示有一个6音），改造前又有一个additon为9，表示有一个 tension 9
    /// 最终可以输出为69

    var canRephraseSixNine: Bool {
        self.main.contains(.number(.six)) &&
        self.additions.contains([ChordSymbolElement.number(.nine)])
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
        if let index = result.main.firstIndex(of: .number(.six)) {
            result.main.insert(.number(.nine), at: index+1 )
        }
        
        // 再把addition的9拿掉
        result.additions.removeAll { addition in
            addition == [.number(.nine)]
        }

        return result
    }
    
    /// 写法： **Atl简写**
    /// 如果考虑到和弦简写的时候
    var canRephraseAlt: Bool {
        
        /// Alt和弦（Altered Chord，变化和弦）是爵士乐中一类重要的属七和弦变体，其核心特征是通过降五音（♭5）和降九音（♭9）等变化音，制造出强烈的紧张感和解决倾向
        
        // Alt和弦在简写之前一定是一个属七和弦
        guard self.main == [.number(.seven)] else {return false}
        
        // 在addition中包含任意 变化音 5/9/11/13，都认定为是一个Alt
        let alteredAdditions: [ChordSymbolElements] = [
            [.acc(.flat), .number(.five)],
            [.acc(.sharp), .number(.five)],
            [.acc(.flat), .number(.nine)],
            [.acc(.sharp), .number(.nine)],
            [.acc(.sharp), .number(.eleven)],
            [.acc(.flat), .number(.thirteen)],
            [.acc(.sharp), .number(.thirteen)]
        ]
        return additions.contains { alteredAdditions.contains($0) }
        
    }

    
    var rephraseAlt: ChordSymbol? {
        guard canRephraseAlt else { return nil }
        var result = self
        
        // 把main替换为 7Alt
        result.main = [.number(.seven), .word(.alt)]
        
        let alteredAdditions: [ChordSymbolElements] = [
            [.acc(.flat), .number(.five)],
            [.acc(.sharp), .number(.five)],
            [.acc(.flat), .number(.nine)],
            [.acc(.sharp), .number(.nine)],
            [.acc(.sharp), .number(.eleven)],
            [.acc(.flat), .number(.thirteen)],
            [.acc(.sharp), .number(.thirteen)]
        ]
        result.additions.removeAll { addition in
            alteredAdditions.contains(addition)
        }
        
        
        return result
    }
    
    /// 写法： **WrongTension**
    /// 考虑到有的人会用 2来替代9， 4来替代11
    var canRephraseWrongTension: Bool {
        additions.contains { addition in
            addition.contains(.number(.nine)) || addition.contains(.number(.eleven))
        }
    }
    
    var rephraseWrongTension: ChordSymbol? {
        guard canRephraseWrongTension else { return nil }
        var result = self
        
        result.additions = result.additions.map { addition in
            addition.map { element in
                switch element {
                case .number(.nine):
                    return .number(.two)
                case .number(.eleven):
                    return .number(.four)
                default:
                    return element
                }
            }
        }
        
        return result
    }

}

extension ChordSymbol {

    // 把ChordSymbol扁平化为一个ChordSymbolInputElement数据结构
    
    public var flatElements: ChordSymbolElements {
       return flatElementsMainSus + flatElementsAdditions
    }
    
    public var flatElementsMainSus: ChordSymbolElements {
        let mainElements = self.main
        let susElements = self.sus
        return mainElements + susElements
    }
    
    public var flatElementsAdditions: ChordSymbolElements {
        var addtionElements: ChordSymbolElements = []
        for addition in self.additions {
            for element in addition {
                addtionElements.append(element)
            }
        }
        return addtionElements
    }

   // public typealias ChordSymbolRelation = (chord: Chord, symbol: ChordSymbol)

//    public static func ChordSymbolElementSequenceDict() -> [ [ChordSymbolElementCase]:
//        [ChordSymbolRelation]]
//    {
//        let symbolDict = ChordSymbolSearchDict()
//        var result: [[ChordSymbolElementCase]: [ChordSymbolRelation]] = [:]
//
//        for (chordSymbol, chord) in symbolDict {
//            let flatElements = chordSymbol.flatInputSymbolElement
//            result[flatElements, default: []].append((chord: chord, symbol: chordSymbol))
//        }
//        return result
//    }

}

// displayString
extension ChordSymbol {
//    public func displayString() -> String{
//        let mainString = self.main.map{ element in
//            return element.displayString()
//        }.joined()
//        
//        let susString = self.sus.map{ element in
//            return element.displayString()
//        }.joined()
//        
//        var additionString = self.additions.map{ addition in
//            addition.map{ $0.displayString() }.joined(separator: "")
//        }.joined(separator: " ")
//        
//        if !additionString.isEmpty {
//            additionString = "(\(additionString))"
//        }
//        
//        return mainString + susString + additionString
//    }
}
