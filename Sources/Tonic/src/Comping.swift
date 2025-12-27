////
////  File.swift
////  FantaChord
////
////  Created by 小汤汤 on 2025/7/2.
////
//
//import Foundation
//
//// comping
//// 第一个String意味着，是几音
//// 第二个Int -> 在第几个octave
//// 第三个(Int,Int) -> 代表这个音在一拍中的时间范围，把一拍分为0-100.00,代表走满一拍
//struct CompingData: Codable, Hashable {
//    var degree: Int       // 原来的 String 或 Int
//    var octave: Int
//    var timeIntervalStart: Double
//    var timeIntervalEnd: Double
//}
//
//struct CompingDetail:Hashable{
//    let compingData:CompingData
//    
//    // 有可能存的degree是一个不存在的degree
//    var degree:ChordDegrees{return ChordDegrees(rawValue: compingData.degree) ?? .root}
//    
//    var octave:Int{compingData.octave}
//    var timeIntervalStart:Double{ compingData.timeIntervalStart}
//    var timeIntervalEnd:Double{ compingData.timeIntervalEnd}
//    
//    
//}
