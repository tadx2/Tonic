//
//  TimeSignature.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/7/5.
//
import Foundation

/// 时长标志 -> 曲子的拍号&速度
// struct TimeSignature{
//     let sections: Int // 一共多少小节
//     let numerator: Int // 每小节有多少拍
//     let denominator: Int // 多少音符 为一拍
//     let BPM:Int // Beats Per Minute, 每分钟的拍数,是衡量节奏快慢的单位
    
//     /// 整个曲子一共多少拍 = 小节 *  每个小节多少拍
//     var totalBeats:Int{ sections * numerator }
//     /// 整个曲子 要持续多长时间
//     var sechondsAllBeats:Double{ Double(totalBeats) * secondsPerBeat}
    
//     var secondsPerBeat:Double{60.0 / Double(BPM)} // 一拍等于几秒.
    
//     /// 传入几分音符，计算几分音符的时长.
//     ///  例如：4分音符， 传入 1/4， 8分音符，传入1/8 。 全音符，传入 1.
//     func secondsPerXNote(by noteValue:Double)->Double{
//         return secondsPerBeat / noteValue
//     }
// }


/// 以下是一些常见用途中“最常用”或“典型”的 BPM 值
/// 音乐类型              常见 BPM 范围        最常用 BPM（参考值）
/// 抒情慢歌 / 情歌    60 – 80                    70 BPM
/// 华尔兹（3/4 拍）  84 – 90                     90 BPM
/// 流行歌曲                90 – 120            100–110 BPM
/// 嘻哈 / R&B             85 – 110           90 BPM
/// 摇滚 / 另类             100 – 140           120 BPM
/// 爵士 / Bossa Nova    90 – 140         100–110 BPM

//enum Numerator:Int{ // 每个小节有几拍
//    case two = 2
//    case three = 3
//    case four = 4
//    case eight = 8
//    case eleven = 11
    
//    var displayName:String{
//        switch self{
//        case .four: return "4"
//        case .three: return "3"
//        case .two: return "2"
//        case
//        }
//    }
//}

// 拍
// 曲谱的拍通常以2/4/8分音符为一拍，在app中是固定的
//enum Denominator:Double{ // 每拍的音符类型
//    case half = 2        // 2分音符，为一拍
//    case quarter = 4     // 4分音符，为一拍
//    case eighth = 8      // 8分音符，为一拍
//    
//    var displayName:String{
//        switch self{
//        case .quarter: return "1/4"
//        case .eighth: return "1/8"
//        case .half: return "1/2"
//        }
//    }
//}
//
//enum Beat:Double{
//    case whole
//    case half
//    case quarter 
//    case eighth
//    case sixteenth
//    case thirtySecond
//    
//    var rawValue: Double{
//        switch self{
//        case .whole: 1
//        case .half : 1 / 2
//        case .quarter : 1 / 4
//        case .eighth : 1 / 8
//        case .sixteenth : 1 / 16
//        case .thirtySecond : 1 / 32
//        }
//    }
//}
