//
//  Pitch.swift
//
//  Created by 小汤汤 on 2025/5/2.
//

import Foundation

/// MIDI 音高 (Pitch)
///
/// 使用整数表示 MIDI 音高，范围通常为 0-127。
typealias Pitch = Int

extension Pitch {
    /// 是否为黑键
    var isBlack: Bool {
        let m = self % 12
        return [1, 3, 6, 8, 10].contains(m < 0 ? m + 12 : m)
    }
    
    /// 八度 (Octave)
    ///
    /// 与 Note 保持一致：C4 (60) 的 octave 为 4。
    /// 计算公式：floor(pitch / 12) - 1
    var octave: Int {
        Int(floor(Double(self) / 12.0)) - 1
    }
}
