//
//  ChordSymbolPartSus.swift
//  Tonic
//
//  Created by 小汤汤 on 3/5/26.


public struct ChordSymbolPartSus: Sendable, Equatable, Hashable {

    public let keyword: ChordSymbolKeyword = .sus

    public var numberWithAcc: ChordSymbolNumberWithAcc?

    public init(
        numberWithAcc: ChordSymbolNumberWithAcc?
    ) {
        self.numberWithAcc = numberWithAcc
    }
    
    public func displayString(isHideNumber: Bool = false, isUpcaseAll: Bool = false ) -> String {
        
        var string = "sus"
        
        // 存在数字部分
        if let numberPart = numberWithAcc?.displayString {
            
            string += numberPart
            
            if isHideNumber { string.dropLast() }
        }
        
        if isUpcaseAll { string.uppercased() }
        
        return string
    }
    
}

extension ChordSymbolPartSus {
    public static let sus = ChordSymbolPartSus(numberWithAcc: .four)
    public static let sus2 = ChordSymbolPartSus(numberWithAcc: .two)
    public static let sus4 = ChordSymbolPartSus(numberWithAcc: nil)
}
