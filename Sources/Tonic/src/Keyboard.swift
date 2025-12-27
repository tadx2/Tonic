//
//  Keyboard.swift
//  test6
//
//  Created by 小汤汤 on 2025/5/2.
//

import SwiftUI

struct Keyboard{
    var range:ClosedRange<Int>
    
    var whiteKeyWidth:CGFloat
    var whiteKeyHeight:CGFloat
    var blackKeyWidth:CGFloat
    var blackkeyHeight:CGFloat
    
    var whiteKeyCount: Int {
        let whiteKeySemitones: Set<Int> = [0, 2, 4, 5, 7, 9, 11]
        return range.filter { whiteKeySemitones.contains($0 % 12) }.count
    }
    
    var keyBoardWidth:CGFloat
    
    var keyBoardHeight:CGFloat{
        whiteKeyHeight
    }
    
//    init(range: ClosedRange<Int>, whiteKeyWidth: CGFloat, whiteKeyHeight: CGFloat, blackKeyWidth: CGFloat, blackkeyHeight: CGFloat) {
//        self.range = range
//        self.whiteKeyWidth = whiteKeyWidth
//        self.whiteKeyHeight = whiteKeyHeight
//        self.blackKeyWidth = blackKeyWidth
//        self.blackkeyHeight = blackkeyHeight
//    }
    
}
