//
//  NoteDegrees.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/9/6.
//

import Foundation


struct NoteDegrees {
    let degreeCount: Int
    
    var degreeAccidentalCount: Int = 0
    
    var degreeAccidental: Accidental{
        degreeAccidentalCount
    }
}

// name
extension NoteDegrees {
    
    // Degree 罗马符号， I/II/III/IV/V
    var romanSymbol: String{
        intToRoman(degreeCount)
    }
    
    // accidental 符号 符合五线谱乐理情况 # -> 𝄪
    var accidentalSymbolRegular: String{
        degreeAccidental.notation
    }
    
    // accidental 符号 不符合五线谱乐理情况 # -> ##
    var accidentalSymbolIrregular: String{
        degreeAccidental.simpleDescription
    }
    
    var degreeNumberName: String {
        degreeCount.description + degreeAccidental.simpleDescription
    }
    
    func intToRoman(_ num: Int) -> String {
        let values = [100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbols = ["C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        
        var number = num
        var result = ""
        
        for (i, value) in values.enumerated() {
            while number >= value {
                number -= value
                result += symbols[i]
            }
        }
        return result
    }
}

// basicDegree
extension NoteDegrees{
    static let ninth = NoteDegrees(degreeCount: 9)
    static let eleventh = NoteDegrees(degreeCount: 11)
    static let thirteenth = NoteDegrees(degreeCount: 13)
}

enum BasicDegees: String {
    case i, ii, iii, iv, v
}




/// 判断两个note的degree间距
//    static func degreeDistance(from startNote: Note, to endNote: Note) -> NoteDegrees {
//        let diff = endNote.diatonicIndex - startNote.diatonicIndex
//        return NoteDegrees(degreeCount: diff)
//    }
