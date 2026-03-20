//
//  ChordSymbolValid.swift
//  Tonic
//
//  Created by 小汤汤 on 3/19/26.
//


// 外部对和弦符号进行判断 合法
// - Valid 是否合法，是否存在在预设中
extension ChordSymbol {
    
    // 判断 bodySymbol 在不在 validSymbols 中
    public var isBodyValid: Bool {
        validSymbols.contains(self.body)
    }
    
    // TODO
    public var isRootNoteValid: Bool { return true }
}
