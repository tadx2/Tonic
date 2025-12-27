//
//  Key.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/6/4.
//



// 调
struct Key{
    let tonality:KeyTonality
    let mode:KeyMode
    
    init(_ tonality: KeyTonality = KeyTonality() , mode: KeyMode = .NaturalMajor) {
        self.tonality = tonality
        self.mode = mode
    }
}

// 调性/主音
struct KeyTonality{
    let letter: Letter
    let accidental:Int
    
    init(_ letter: Letter = .C, _ accidental:Int = 0) {
        self.letter = letter
        self.accidental = accidental
    }
}

// 调式,大部分乐曲不是大调就是小调
enum KeyMode:String{
    case NaturalMajor
    case NaturalMinor
}

// 准备废弃
enum KeyTest{
    // 五度圈下行五度
    static let descendingOnCircle = [ Note(letter: .C),
                               Note(letter: .F),
                               Note(letter: .B,accidental:-1),
                               Note(letter: .E,accidental:-1),
                               Note(letter: .A,accidental:-1),
                               Note(letter: .D,accidental:-1),
                               Note(letter: .G,accidental:-1),
                               Note(letter: .B),
                               Note(letter: .E),
                               Note(letter: .A),
                               Note(letter: .D),
                               Note(letter: .G),]
}




