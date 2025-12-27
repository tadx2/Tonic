//
//  Accidental.swift
//  Tonic
//
//  Created by 小汤汤 on 2025/9/4.
//

import Foundation

/// 升降号 (Accidental)
///
/// 使用整数表示音高的偏移量：
/// - 0: 还原 (Natural)
/// - 1: 升号 (Sharp, ♯)
/// - -1: 降号 (Flat, ♭)
/// - 2: 重升号 (Double Sharp, 𝄪)
/// - -2: 重降号 (Double Flat, ♭♭)
public typealias Accidental = Int

// MARK: - 字符串表示 (String Representation)
public extension Accidental {
    
    /// 简单的字符串表示 (Simple Representation)
    ///
    /// 使用简单的 "♯" 和 "♭" 符号重复表示，不使用特殊的重升符号。
    /// 例如：
    /// - 2 -> "♯♯"
    /// - -2 -> "♭♭"
    var simpleDescription: String {
        Self.getSimpleDescription(for: self)
    }
    
    /// 标准乐理符号表示 (Standard Notation)
    ///
    /// 使用标准的乐理符号，包括重升号 (𝄪)。
    /// 例如：
    /// - 2 -> "𝄪"
    /// - -2 -> "♭♭" (目前重降号通常仍写作两个降号，部分字体支持单字符重降号但这里保持通用性)
    var notation: String {
        Self.getNotation(for: self)
    }
    
    /// 获取简单的重复符号字符串
    /// - Parameter count: 升降号的数量
    static func getSimpleDescription(for count: Int) -> String {
        if count > 0 {
            return String(repeating: "♯", count: count)
        } else if count < 0 {
            return String(repeating: "♭", count: abs(count))
        } else {
            return ""
        }
    }
    
    /// 获取标准乐理符号字符串
    /// - Parameter count: 升降号的数量
    static func getNotation(for count: Int) -> String {
        // 处理升号系列
        if count > 0 {
            let doubleSharps = count / 2
            let singleSharps = count % 2
            
            let doubleSharpStr = String(repeating: "𝄪", count: doubleSharps)
            let singleSharpStr = singleSharps > 0 ? "♯" : ""
            
            return doubleSharpStr + singleSharpStr
        }
        // 处理降号系列
        else if count < 0 {
            return String(repeating: "♭", count: abs(count))
        }
        // 还原/无升降号
        else {
            return ""
        }
    }
}

// MARK: - 常用组合 (Common Combinations)
public extension Accidental {
    
    /// 基础升降号集合
    ///
    /// 包含：降号 (-1), 还原 (0), 升号 (1)
    static let standardSet: [Accidental] = [-1, 0, 1]
    
    /// 扩展升降号集合 (包含重升/重降)
    ///
    /// 包含：重降 (-2), 降号 (-1), 还原 (0), 升号 (1), 重升 (2)
    static let extendedSet: [Accidental] = [-2, -1, 0, 1, 2]

    // MARK: - Legacy / Compatibility
    // 保留旧命名以防兼容性问题，但建议使用新命名
    
    /// (Deprecated) 请使用 `standardSet`
    static let CommonCombinationsVersion1: [Accidental] = [-1, 0, 1]
    
    /// (Deprecated) 请使用 `extendedSet`
    static let CommonCombinationsVersion2: [Accidental] = [-2, -1, 0, 1, 2]
}