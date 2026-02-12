//
//  Interval.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/9/2.
//

import Foundation

public struct Interval: Sendable, Hashable {

    public let degreeInt: Int

    public let semitones: Int

    public let direction: Direction

    public enum Direction: Sendable {
        case up, down  // 上行 下行
    }

    // 与标准的音程距离的差值，也就是 不考虑大小/纯减 度数原本对应的 semitone
    public let semitonesDegreeStandard: Int

    public let semitonesDiff: Int

    public init(degreeInt: Int, semitones: Int, direction: Direction = .up) {
        self.degreeInt = degreeInt
        self.semitones = semitones
        self.direction = direction

        let (letterVirtual, octaveVirtuaDiff) = Letter.C.shifted(by: degreeInt - 1)
        self.semitonesDegreeStandard = (letterVirtual.pitchClass + octaveVirtuaDiff * 12)

        self.semitonesDiff = self.semitones - self.semitonesDegreeStandard
    }

    // 根据 semitoneDiff 来生成 音程
    public init(degreeInt: Int, semitonesDiff: Int, direction: Direction = .up) {
        self.degreeInt = degreeInt
        self.direction = direction
        self.semitonesDiff = semitonesDiff

        let (letterVirtual, octaveVirtuaDiff) = Letter.C.shifted(by: degreeInt - 1)
        self.semitonesDegreeStandard = (letterVirtual.pitchClass + octaveVirtuaDiff * 12)

        self.semitones = self.semitonesDiff + self.semitonesDegreeStandard
    }

}

extension Interval: Comparable {
    public static func < (lhs: Interval, rhs: Interval) -> Bool {
        if lhs.degreeInt != rhs.degreeInt {
            return lhs.degreeInt < rhs.degreeInt
        }
        return lhs.semitones < rhs.semitones
    }
}

// MARK: - CustomStringConvertible
extension Interval: CustomStringConvertible {

    /// 音程的完整文本描述（例如："P1", "m2", "M3", "A4", "d5" , “-m2”）
    public var description: String {

        // (self.degreeInt - 1) % 7 不保证在 0...6 之间，可能有崩溃的风险，可能调用者会 把 degreeInt设置为负数，
        // swift 中 a % b 的结果 和 a 同号，(-1 - 1 ) % 7 = -2  这边添加一个防御性
        guard self.degreeInt > 0 else { return "error, degreeInt must > 0" }
        guard self.semitones >= 0 else { return "error, semitone must >= 0" }

        // 把 degreeInt 转化为 虚拟 letter 以便于后续的计算， 这里的 letter 是一个相对关系，归到 一个音组里计算
        // 例如 degreeInt == 9， 计算出来是 letterVirtual = .D , octaveVirtuaDiff = 1
        let (letterVirtual, octaveVirtuaDiff) = Letter.C.shifted(by: degreeInt - 1)
        let diff = self.semitones - (letterVirtual.pitchClass + octaveVirtuaDiff * 12)

        // 判断是纯音程系列（1, 4, 5）还是大小音程系列（2, 3, 6, 7）
        var element: String = "init"

        if [1, 4, 5].contains(letterVirtual.letterClass + 1) {
            // 纯音程系列：P(纯), A(增), d(减)
            if diff == 0 {
                element = "P"
            } else if diff > 0 {
                element = String(repeating: "A", count: diff)
            } else if diff < 0 {
                element = String(repeating: "d", count: -diff)
            }
        } else if [2, 3, 6, 7].contains(letterVirtual.letterClass + 1) {
            // 大小音程系列：M(大), m(小), A(增), d(减)
            if diff == 0 {
                element = "M"
            } else if diff == -1 {
                element = "m"
            } else if diff < -1 {
                element = String(repeating: "d", count: -diff - 1)
            } else if diff > 0 {
                element = String(repeating: "A", count: diff)
            }
        }

        return String(self.direction == .up ? "" : "-") + element + String(self.degreeInt)
    }

    /// 带升降号修饰的度数描述（例如："1", "♭2", "3", "♯4", "♭5"）。
    public var descriptionNumber: String {

        // (self.degreeInt - 1) % 7 不保证在 0...6 之间，可能有崩溃的风险，可能调用者会 把 degreeInt设置为负数，
        // swift 中 a % b 的结果 和 a 同号，(-1 - 1 ) % 7 = -2  这边添加一个防御性
        guard degreeInt > 0 else { return "error, degreeInt must > 0" }
        guard semitones >= 0 else { return "error, semitone must >= 0" }

        // 把 degreeInt 转化为 letter 以便于后续的计算
        let (letterVirtual, octaveVirtuaDiff) = Letter.C.shifted(by: degreeInt - 1)
        let diff = self.semitones - (letterVirtual.pitchClass + octaveVirtuaDiff * 12)

        // 判断是纯音程系列（1, 4, 5）还是大小音程系列（2, 3, 6, 7）
        var element: String = "init"

        // 根据与标准大调音阶的差异添加升降号
        if diff == 0 {
            element = ""
        } else if diff > 0 {
            element = String(repeating: "♯", count: diff)
        } else if diff < 0 {
            element = String(repeating: "♭", count: -diff)
        }

        return String(self.direction == .up ? "" : "-") + element + String(self.degreeInt)
    }
}

extension Interval {
    /// 返回一个方向相反的 Interval（up <-> down）
    public static prefix func - (rhs: Interval) -> Interval {
        Interval(
            degreeInt: rhs.degreeInt,
            semitones: rhs.semitones,
            direction: rhs.direction == .up ? .down : .up)
    }
}

extension Set<Interval> {

    public mutating func deleteInterval(by degreeInt: ChordDegreeInt) {
        self = self.filter { $0.degreeInt != degreeInt }
    }

    public func hasInterval(of degreeInt: ChordDegreeInt) -> Bool {
        self.contains { $0.degreeInt == degreeInt }
    }

    public func getInterval(of degreeInt: ChordDegreeInt) -> [Interval] {
        self.filter { $0.degreeInt == degreeInt }
    }

    public mutating func changeInterval(of interval: Interval) {
        guard self.hasInterval(of: interval.degreeInt) else { return }
        self.deleteInterval(by: interval.degreeInt)
        self.insert(interval)
    }

}


