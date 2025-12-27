//
//  KeySignature.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/8/23.
//

import Foundation

struct KeySignature: Hashable, Sendable { // 调号
    
    // key letter & accidental
    // 例如: Bb调， letter = .B accidental = -1, C#调， letter = .C accidental = 1
    let letter: Letter
    let accidentalCount: Int
    
    // 调中有多少个 b 与 多少个 #
    let accidentalTotalCount: Int
    
    // 调的类型 大调 小调 这里注意，五线谱中的调号只有自然大调小调
    enum KeySignatureType: String, Sendable {
        case major,minor
        
        var description: String{
            switch self {
            case .major:
                return "major"
            case .minor:
                return "minor"
            }
        }
        
        var upcaseDescription: String{
            let name = description
            return  name.prefix(1).uppercased() + name.dropFirst()
        }
    }
    let type: KeySignatureType
    
    // 存储该调号中的音默认升降
    // 例如 G大调，这里就是 [.F: 1]
    // Bb大调，这里就是 [.B: -1, .E: -1]
    let accidentalOfLetter: [Letter: Int]
}

// 所有自然大小调
extension KeySignature {
    
    // MARK: - Natural Keys (0 Accidentals)
    static let cMajor      = KeySignature(letter: .C, accidentalCount:  0, accidentalTotalCount:  0, type: .major, accidentalOfLetter: [:])
    static let aMinor      = KeySignature(letter: .A, accidentalCount:  0, accidentalTotalCount:  0, type: .minor, accidentalOfLetter: [:])
    
    // MARK: - Sharp Keys (Major)
    static let gMajor      = KeySignature(letter: .G, accidentalCount:  0, accidentalTotalCount:  1, type: .major, accidentalOfLetter: [.F: 1])
    static let dMajor      = KeySignature(letter: .D, accidentalCount:  0, accidentalTotalCount:  2, type: .major, accidentalOfLetter: [.F: 1, .C: 1])
    static let aMajor      = KeySignature(letter: .A, accidentalCount:  0, accidentalTotalCount:  3, type: .major, accidentalOfLetter: [.F: 1, .C: 1, .G: 1])
    static let eMajor      = KeySignature(letter: .E, accidentalCount:  0, accidentalTotalCount:  4, type: .major, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1])
    static let bMajor      = KeySignature(letter: .B, accidentalCount:  0, accidentalTotalCount:  5, type: .major, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1, .A: 1])
    static let fSharpMajor = KeySignature(letter: .F, accidentalCount:  1, accidentalTotalCount:  6, type: .major, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1, .A: 1, .E: 1])
    static let cSharpMajor = KeySignature(letter: .C, accidentalCount:  1, accidentalTotalCount:  7, type: .major, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1, .A: 1, .E: 1, .B: 1])
    
    // MARK: - Flat Keys (Major)
    static let fMajor      = KeySignature(letter: .F, accidentalCount:  0, accidentalTotalCount: -1, type: .major, accidentalOfLetter: [.B: -1])
    static let bFlatMajor  = KeySignature(letter: .B, accidentalCount: -1, accidentalTotalCount: -2, type: .major, accidentalOfLetter: [.B: -1, .E: -1])
    static let eFlatMajor  = KeySignature(letter: .E, accidentalCount: -1, accidentalTotalCount: -3, type: .major, accidentalOfLetter: [.B: -1, .E: -1, .A: -1])
    static let aFlatMajor  = KeySignature(letter: .A, accidentalCount: -1, accidentalTotalCount: -4, type: .major, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1])
    static let dFlatMajor  = KeySignature(letter: .D, accidentalCount: -1, accidentalTotalCount: -5, type: .major, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1, .G: -1])
    static let gFlatMajor  = KeySignature(letter: .G, accidentalCount: -1, accidentalTotalCount: -6, type: .major, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1, .G: -1, .C: -1])
    static let cFlatMajor  = KeySignature(letter: .C, accidentalCount: -1, accidentalTotalCount: -7, type: .major, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1, .G: -1, .C: -1, .F: -1])
    
    // MARK: - Sharp Keys (Minor)
    static let eMinor      = KeySignature(letter: .E, accidentalCount:  0, accidentalTotalCount:  1, type: .minor, accidentalOfLetter: [.F: 1])
    static let bMinor      = KeySignature(letter: .B, accidentalCount:  0, accidentalTotalCount:  2, type: .minor, accidentalOfLetter: [.F: 1, .C: 1])
    static let fSharpMinor = KeySignature(letter: .F, accidentalCount:  1, accidentalTotalCount:  3, type: .minor, accidentalOfLetter: [.F: 1, .C: 1, .G: 1])
    static let cSharpMinor = KeySignature(letter: .C, accidentalCount:  1, accidentalTotalCount:  4, type: .minor, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1])
    static let gSharpMinor = KeySignature(letter: .G, accidentalCount:  1, accidentalTotalCount:  5, type: .minor, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1, .A: 1])
    static let dSharpMinor = KeySignature(letter: .D, accidentalCount:  1, accidentalTotalCount:  6, type: .minor, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1, .A: 1, .E: 1])
    static let aSharpMinor = KeySignature(letter: .A, accidentalCount:  1, accidentalTotalCount:  7, type: .minor, accidentalOfLetter: [.F: 1, .C: 1, .G: 1, .D: 1, .A: 1, .E: 1, .B: 1])
    
    // MARK: - Flat Keys (Minor)
    static let dMinor      = KeySignature(letter: .D, accidentalCount:  0, accidentalTotalCount: -1, type: .minor, accidentalOfLetter: [.B: -1])
    static let gMinor      = KeySignature(letter: .G, accidentalCount:  0, accidentalTotalCount: -2, type: .minor, accidentalOfLetter: [.B: -1, .E: -1])
    static let cMinor      = KeySignature(letter: .C, accidentalCount:  0, accidentalTotalCount: -3, type: .minor, accidentalOfLetter: [.B: -1, .E: -1, .A: -1])
    static let fMinor      = KeySignature(letter: .F, accidentalCount:  0, accidentalTotalCount: -4, type: .minor, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1])
    static let bFlatMinor  = KeySignature(letter: .B, accidentalCount: -1, accidentalTotalCount: -5, type: .minor, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1, .G: -1])
    static let eFlatMinor  = KeySignature(letter: .E, accidentalCount: -1, accidentalTotalCount: -6, type: .minor, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1, .G: -1, .C: -1])
    static let aFlatMinor  = KeySignature(letter: .A, accidentalCount: -1, accidentalTotalCount: -7, type: .minor, accidentalOfLetter: [.B: -1, .E: -1, .A: -1, .D: -1, .G: -1, .C: -1, .F: -1])

}

// MARK: - function
extension KeySignature {
    
    /// 判断在该调号下音符需要显示的最终升降号/还原号
    func accidentalCountFinalDisplayOnStaff(of note: Note) -> Int? {
        
        // 获取五线谱调号下的默认升降
        // 没有获取到就是不需要变号 代表这个letter在调号下本来就不需要变号
        let keySignatureAccidentalCount = self.accidentalOfLetter[note.letter] ?? 0 //
        
        /// 计算音符自身的升降号与调号升降号的差值,
        /// 例如：
        /// Bb 在 F大调中，因为F自然大调五线谱显示中的 B音本来就是 降了一个八度（-1），所以 Bb这个音原本的 accidental（-1） 减去 （ 五线谱上的-1） = 0 ，也就是最终的显示 升降号 为 0，也就是没有显示任何升降号
        let noteSelfAcc = note.accidental - keySignatureAccidentalCount
        
        /// 但可能出现这个情况
        /// 例如：CM和弦，在D自然大调上
        /// C - E - G
        /// D自然大调上的音阶为： D E F# G A B C# D
        /// 经过计算后，noteSelfAcc = -1 即为 一个降号
        /// 但是这个是错的，应该显示为一个还原号，
        /// 之所以显示为一个还原号，是因为，noteSelfAcc 降号后，又回到了C大调的位置，应该称作还原
        /// static let dMajor      = KeySignature(letter: .D, accidentalCount:  0, accidentalTotalCount:  2, type: .major, accidentalOfLetter: [.F: 1, .C: 1])
        
        if  (keySignatureAccidentalCount + noteSelfAcc) == 0 && noteSelfAcc != 0 {
            return nil
        }
        
        return noteSelfAcc
    }
    
    /// 判断一个letter在这个keySignature下是第几级
    /// 例如：
    /// 在C大调中，D音的音级是 II
    /// 在Bb大调中，A音的音级是 VII
    /// 在F大调中， B的音级是 IV#
    func degree(of note: Note) -> NoteDegrees{
        
        // 级数差
        let DiffCountDegree = note.letter.letterIndex - self.letter.letterIndex
        let DiffCountDegreeFinal =  (DiffCountDegree >= 0 ? DiffCountDegree : DiffCountDegree + 7 ) + 1
        
        // 最终显示accidental
        let accidentalCount = note.accidental - (self.accidentalOfLetter[note.letter] ?? 0)
        
        return NoteDegrees(degreeCount: DiffCountDegreeFinal, degreeAccidentalCount: accidentalCount)
    }
    
}

// MARK: - Collections and Naming
extension KeySignature {
    
    // 按五度圈顺序排列的所有大调
    static var allMajorKeys: [KeySignature] {
        return [
            // 降号调 (从 1 个降号到 7 个降号)
            .fMajor, .bFlatMajor, .eFlatMajor, .aFlatMajor, .dFlatMajor, .gFlatMajor, .cFlatMajor,
            // 无升降号
            .cMajor,
            // 升号调 (从 1 个升号到 7 个升号)
            .gMajor, .dMajor, .aMajor, .eMajor, .bMajor, .fSharpMajor, .cSharpMajor
        ]
    }
    
//     按五度圈顺序排列的所有小调
    static var allMinorKeys: [KeySignature] {
        return [
            // 降号调
            .dMinor, .gMinor, .cMinor, .fMinor, .bFlatMinor, .eFlatMinor, .aFlatMinor,
            // 无升降号
            .aMinor,
            // 升号调
            .eMinor, .bMinor, .fSharpMinor, .cSharpMinor, .gSharpMinor, .dSharpMinor, .aSharpMinor
        ]
    }
    
    // 用于在 UI 中显示的名称
    var name: String {
        // 假设 Letter 枚举的 rawValue 是 "C", "D" 等字符串
        // 如果不是，请相应调整
        var letterName = letter.rawValue
        
        // 根据 accidentalCount 添加升降号
        if accidentalCount > 0 {
            letterName += "♯" // Sharp symbol
        } else if accidentalCount < 0 {
            letterName += "♭" // Flat symbol
        }
        
        // 将首字母大写
        let typeName = type.rawValue.prefix(1).uppercased() + type.rawValue.dropFirst()
        
        return "\(letterName) \(typeName)" // 例如: "C♯ Major" 或 "A♭ Minor"
    }
}

// description
extension KeySignature: CustomStringConvertible{
    
    //
    var description: String { keyNameNote }
    
//    // 返回keySignature letter
//    var letterDestciption: String {
//        keyNameNote
//    }
//    
    // 返回keySignature type
    var typeDescription: String {
        type.rawValue
    }
    
    var keyNameNote: String{
        let noteLetterName = self.letter.rawValue
        let noteAcitentalName = self.accidentalCount.simpleDescription
        return noteLetterName + noteAcitentalName
    }
    
    var keyNameFull: String {
        let noteName = keyNameNote
        let keySignatureType = self.type.upcaseDescription
        return "\(noteName) \(keySignatureType)"
    }
}
