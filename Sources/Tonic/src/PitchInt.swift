//
//  PitchInt.swift
//
//  Created by 小汤汤 on 2025/5/2.
//

import Foundation

public typealias PitchString = (pitchInt: PitchInt, noteName: NoteName)
public typealias PitchInt = Int
public typealias NoteName = String

extension PitchInt {
    /// 钢琴上是否为黑键
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

    /// 将音高映射到一个八度内（12个半音中的位置）
    ///
    /// 结果范围：0...11，对应 C 到 B 的 12 个音级。
    /// 例如：
    /// - 60 (C4) → 0
    /// - 61 (C#4) → 1
    /// - -1 → 11（保证负数也正确映射）
    ///
    /// 说明：
    /// Swift 的 `%` 是余数（remainder），对负数会返回负值，
    /// 因此通过 `(x % 12 + 12) % 12` 将结果规范到 0...11 区间。
    var semitoneClass: Int {
        (self % 12 + 12) % 12
    }
}

// Convenient
public let C3: PitchString = (pitchInt: 48, noteName: "C")
public let E3: PitchString = (pitchInt: 52, noteName: "E")
public let G3: PitchString = (pitchInt: 55, noteName: "G")
public let B3: PitchString = (pitchInt: 59, noteName: "B")
public let D4: PitchString = (pitchInt: 62, noteName: "D")
public let F4: PitchString = (pitchInt: 65, noteName: "F")
public let A4: PitchString = (pitchInt: 69, noteName: "A")
public let C4: PitchString = (pitchInt: 60, noteName: "C")
public let E4: PitchString = (pitchInt: 64, noteName: "E")
public let G4: PitchString = (pitchInt: 67, noteName: "G")
public let B4: PitchString = (pitchInt: 71, noteName: "B")
public let D5: PitchString = (pitchInt: 74, noteName: "D")
public let F5: PitchString = (pitchInt: 77, noteName: "F")
public let A5: PitchString = (pitchInt: 81, noteName: "A")

public extension [PitchString] {
    static let cMaj_3 = [C3, E3, G3]
    static let cMaj7_3 = [C3, E3, G3, B3]
    static let cMaj9_3 = [C3, E3, G3, B3, D4]
    static let cMaj11_3 = [C3, E3, G3, B3, D4, F4]
    static let cMaj13_3 = [C3, E3, G3, B3, D4, F4, A4]
    static let cMaj_4 = [C4, E4, G4]
    static let cMaj7_4 = [C4, E4, G4, B4]
    static let cMaj9_4 = [C4, E4, G4, B4, D5]
    static let cMaj11_4 = [C4, E4, G4, B4, D5, F5]
    static let cMaj13_4 = [C4, E4, G4, B4, D5, F5, A5]
}
