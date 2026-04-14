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

/// To String
public extension ChordSymbol {
    var debugDescription: String {
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
        if !additions.isEmpty {
            let additionsText = additions
                .map { $0.map(\.toString).joined() }
                .joined(separator: " ")
            parts.append("(\(additionsText))")
        }
        // Bass note (slash chord)
        if let bassLetter = bassNoteLetter {
            parts.append("/")
            parts.append(bassLetter.toString)
            parts.append(contentsOf: bassNoteAcc.map(\.toString))
        }
        return parts.joined()
    }
    
    // 一个没有Letter信息的Description，如果是空的返回这大三和弦标记
    var descriptionWithoutRnBn: String {
        var parts: [String] = []
        // Quality
        parts.append(contentsOf: quality.map(\.toString))
        // Sus
        parts.append(contentsOf: sus.map(\.toString))
        // Additions
        if !additions.isEmpty {
            let additionsText = additions
                .map { $0.map(\.toString).joined() }
                .joined(separator: " ")
            parts.append("(\(additionsText))")
        }
        
        if parts.isEmpty {
            return "M"
        }
        
        return parts.joined()
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
