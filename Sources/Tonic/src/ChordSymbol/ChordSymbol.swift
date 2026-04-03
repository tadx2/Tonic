//
//  ChordSymbol.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

public struct ChordSymbol: Hashable, Sendable, CustomDebugStringConvertible {
    // Root Note
    public let rootNoteLetter: ChordSymbolElement?
    public let rootNoteAcc: ChordSymbolElementGroup

    // Body
    public var quality: ChordSymbolElementGroup
    public var sus: ChordSymbolElementGroup
    public var additions: [ChordSymbolElementGroup]

    // Bass Note
    public let bassNoteLetter: ChordSymbolElement?
    public let bassNoteAcc: ChordSymbolElementGroup

    public init(
        rootNoteLetter: ChordSymbolElement? = nil,
        rootNoteAcc: ChordSymbolElementGroup = [],
        quality: ChordSymbolElementGroup = [],
        sus: ChordSymbolElementGroup = [],
        additions: [ChordSymbolElementGroup] = [],
        bassNoteLetter: ChordSymbolElement? = nil,
        bassNoteAcc: ChordSymbolElementGroup = []
    ) {
        self.rootNoteLetter = rootNoteLetter
        self.rootNoteAcc = rootNoteAcc

        self.quality = quality
        self.sus = sus
        self.additions = additions

        self.bassNoteLetter = bassNoteLetter
        self.bassNoteAcc = bassNoteAcc
    }

    public var isEmpty: Bool {
        rootNoteLetter == nil && quality.isEmpty && sus.isEmpty && additions.isEmpty && bassNoteLetter == nil
    }

    public var debugDescription: String {
        var parts: [String] = []
        // Root note letter + accidentals
        if let letter = rootNoteLetter {
            parts.append(letter.toString)
        }
        parts.append(contentsOf: rootNoteAcc.map(\.toString))
        // Quality
        parts.append(contentsOf: quality.map(\.toString))
        // Sus
        parts.append(contentsOf: sus.map(\.toString))
        // Additions
        for group in additions {
            parts.append("(" + group.map(\.toString).joined() + ")")
        }
        // Bass note (slash chord)
        if let bassLetter = bassNoteLetter {
            parts.append("/")
            parts.append(bassLetter.toString)
            parts.append(contentsOf: bassNoteAcc.map(\.toString))
        }
        return parts.joined()
    }
}

// MARK: Valid

public extension ChordSymbol {
    // ACC

    private static let validAccNote: Set<ChordSymbolElementGroup> = [.b, .bb, .s, .ss, []]

    private static let validAccAddition: Set<ChordSymbolElementGroup> = [.b, .s, []]

    var isRnAccValid: Bool {
        Self.validAccNote.contains(rootNoteAcc)
    }

    var isBsAccValid: Bool {
        Self.validAccNote.contains(bassNoteAcc)
    }

    func isAdditionItemAccValid(index: Int) -> Bool {
        guard additions.indices.contains(index) else { return false }
        let item = additions[index]
        // 提取 acc 部分（非 number 的元素）
        let acc = item.filter { $0.isAccidental }
        return Self.validAccAddition.contains(acc)
    }

    func isAdditionItemNumberValid(index: Int) -> Bool {
        guard additions.indices.contains(index) else { return false }
        // 每个 addition item 必须包含恰好一个数字元素
        return additions[index].filter { $0.isNumber }.count == 1
    }

    /// Letter
    var isBsRnNoteSame: Bool {
        guard rootNoteLetter != nil else { return true } // rootNoteLetter 不为 nil， 否则 bs letter 怎么样都是 valid
        return ([rootNoteLetter] + rootNoteAcc) == ([bassNoteLetter] + bassNoteAcc)
    }

    /// Other
    var isMainValid: Bool {
        let qualitySusSymbol = main
        return validSymbols.contains(qualitySusSymbol)
    }

    /// 验证 additions 中的 tension 是否按数字严格递增排列
    /// 例如 (♭9)(♯11)(13) 合法，(♯11)(♭9) 不合法
    var isAdditionOrderValid: Bool {
        // 1. 提取每个 addition group 中的数字元素（如 .nine、.eleven、.thirteen），忽略无数字的 group
        let numbers = additions.compactMap { group in
            group.first(where: { $0.isNumber })
        }
        // 2. 0 或 1 个 tension 不存在排序问题，直接合法
        guard numbers.count > 1 else { return true }
        // 3. 逐对比较相邻元素的 numberOrder，前一个 >= 后一个则不是严格递增，返回 false
        for i in 1 ..< numbers.count {
            guard numbers[i - 1].numberOrder < numbers[i].numberOrder else { return false }
        }
        return true
    }
}

/// Sub Class 分类
public extension ChordSymbol {
    /// Main = Quality + Sus
    var main: ChordSymbol {
        ChordSymbol(
            quality: quality,
            sus: sus
        )
    }

    /// Body = Quality + Sus + Addiditons
    ///      = Main + Addiditons
    var body: ChordSymbol {
        ChordSymbol(
            quality: quality,
            sus: sus,
            additions: additions
        )
    }
}

/// Convinent
public extension ChordSymbol {
    static let Cmaj7 = ChordSymbol(rootNoteLetter: .C, quality: .major7)
    static let Dmin7 = ChordSymbol(rootNoteLetter: .D, quality: .minor7)
    static let G7 = ChordSymbol(rootNoteLetter: .G, quality: .seven)

    static let Asharp12flat9 = ChordSymbol(rootNoteLetter: .A, additions: [.sharp13, .flat9])

    static let errorSymbol = ChordSymbol(rootNoteLetter: .A,
                                         quality: [.sus, .sus],
                                         additions: [.sharp13, .sharp13, .flat9])
}

/// Random
public extension ChordSymbol {
    /// 随机生成一个 ChordSymbol
    static func random() -> ChordSymbol {
        let letters: [ChordSymbolElement] = [.C, .D, .E, .F, .G, .A, .B]
        let accidentals: [ChordSymbolElementGroup] = [[], [.flat], [.sharp]]
        let qualities: [ChordSymbolElementGroup] = [
            .major,
            [.minor],
            [.minor, .seven],
            [.major, .seven],
            [.seven],
            [.diminished],
            [.augmented],
        ]

        return ChordSymbol(
            rootNoteLetter: letters.randomElement()!,
            rootNoteAcc: accidentals.randomElement()!,
            quality: qualities.randomElement()!,
            sus: [],
            additions: []
        )
    }
}
