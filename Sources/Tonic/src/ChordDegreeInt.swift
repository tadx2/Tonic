//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 12/30/25.
//

public typealias ChordDegreeInt = Int

extension ChordDegreeInt {
    
    // 度数在 chordDnaRaw 的中 index 位置
    var chordDnaRawIndex: Int? {
        let degree = self % 14

        switch degree {
        case 1...7:
            return degree - 1
        case 9:
            return 7
        case 11:
            return 8
        case 13:
            return 9
        default:
            return nil
        }
    }
    
    // 自然大调中度数与根音的半音数距离
    // - 计算度数所在的八度（octave）
    // - 确定基础度数（1-7）
    // - 映射每个度数到自然大调中对应的半音数
    // - 返回总半音数：八度数 × 12 + 基础半音数
    //
    // 这样可以正确处理：
    // - 基础度数（1-7）
    // - 扩展度数（9度=14半音, 11度=17半音, 13度=21半音）
    // - 任意更高的度数
    var semitonesFormRootNoteInNaturalMajor: Int {
        // 计算八度和基础度数
        let octave = (self - 1) / 7
        let baseDegree = ((self - 1) % 7) + 1

        // 大调音阶中每个度数对应的半音数
        let semitones: Int
        switch baseDegree {
        case 1: semitones = 0
        case 2: semitones = 2
        case 3: semitones = 4
        case 4: semitones = 5
        case 5: semitones = 7
        case 6: semitones = 9
        case 7: semitones = 11
        default: semitones = 0
        }

        return octave * 12 + semitones
    }
}
