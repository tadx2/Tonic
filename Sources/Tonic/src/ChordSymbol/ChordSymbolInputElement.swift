//
//  ChordSymbolInputElement.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

// 组成和弦符号输入的基本元素
public enum ChordSymbolInputElement: Hashable {
    case keyword(ChordSymbolKeyword)
    case accidental(ChordSymbolAccidental)
    case number(ChordSymbolNumber)
}

public typealias ChordSymbolInputElementSequence = [ChordSymbolInputElement]
