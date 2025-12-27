//
//  Letter.swift
//  test6
//
//  Created by 小汤汤 on 2025/5/2.
//

public enum Letter: String, Equatable, CaseIterable, Sendable {
    case C, D, E, F, G, A, B
}

extension Letter: Comparable{
    public static func < (lhs: Letter, rhs: Letter) -> Bool {
        return lhs.letterIndex < rhs.letterIndex
    }
}

extension Letter: CustomStringConvertible{
    public var description: String {
        self.rawValue
    }
}

// staff
public extension Letter{

    /// 音名在自然音阶不考虑调性的情况下 (默认是C 大调) 中的索引位置。
    /// C = 0, D = 1, E = 2, F = 3, G = 4, A = 5, B = 6
    var letterIndex: Int {
       switch self {
       case .C: return 0
       case .D: return 1
       case .E: return 2
       case .F: return 3
       case .G: return 4
       case .A: return 5
       case .B: return 6
       }
   }

    // also the relative positon of the pitch
    var semitone: Int {
        switch self {
        case .C: return 0
        case .D: return 2
        case .E: return 4
        case .F: return 5
        case .G: return 7
        case .A: return 9
        case .B: return 11
        }
    }
    
    var diffToGClefStaffCenter: Int{ // 音名与五线谱中 中线（B）的diff，比如说 A就是在B的下方一个单位，diff = -1
        switch self {
        case .C: return -6
        case .D: return -5
        case .E: return -4
        case .F: return -3
        case .G: return -2
        case .A: return -1
        case .B: return 0
        }
    }
}

// index
// extension Letter {
    
//     /// 在给定调性 (Key) 中的音阶索引（0=主音, 1=上主音, ... 6=导音） // 待定验证
//     func diatonicIndex(in keyLetter: Letter) -> Int {
//         let offset = (self.letterIndex - keyLetter.letterIndex + 7) % 7
//         return offset
//     }
// }

// extension Letter {
//     static let basicLetterList: [Letter] = [.C, .D, .E, .F, .G, .A, .B]
// }
