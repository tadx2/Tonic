////
////  ChordSymbolPartMain.swift
////  Tonic
////
////  Created by 小汤汤 on 3/5/26.
////
//
//
//public struct ChordSymbolPartMain: Sendable, Equatable, Hashable {
//
//    public var elements: [ChordSymbolElement]
//
//    public init( elements: [ChordSymbolKeyword] = [] ) {
//        self.elements = elements
//    }
//    
//}
//
//// DispalyString
//extension ChordSymbolPartMain {
//    public func displayString(mode: ChordSymbolKeyword.DisplayMode) -> String {
//        let keywordsString = self.keywords.map{ keyword in
//            keyword.displayString(mode: mode)
//        }.joined()
//        
//        let numberWithAccString = numberWithAcc?.displayString ?? ""
//        
//        return keywordsString + numberWithAccString
//    }
//}
