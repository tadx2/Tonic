//
//  ChordSymbol.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation

public struct ChordSymbol: Hashable, Sendable {
    // Root Note
    public let rootNoteLetter: ChordSymbolElement?
    public let rootNoteAcc: ChordSymbolElementGroup

    // Body
    public var quality: ChordSymbolElementGroup
    public var sus: ChordSymbolElementGroup
    public var additions: [ChordSymbolElementGroup]

    public init(
        rootNoteLetter: ChordSymbolElement? = nil,
        rootNoteAcc: ChordSymbolElementGroup = [],
        quality: ChordSymbolElementGroup = [],
        sus: ChordSymbolElementGroup = [],
        additions: [ChordSymbolElementGroup] = []
    ) {
        self.quality = quality
        self.sus = sus
        self.additions = additions
        self.rootNoteLetter = rootNoteLetter
        self.rootNoteAcc = rootNoteAcc
    }

    /// 返回一个不包含 RN 的Symbol
    public var body: ChordSymbol {
        ChordSymbol(
            rootNoteLetter: nil,
            rootNoteAcc: [],
            quality: quality,
            sus: sus,
            additions: additions
        )
    }

    public var isEmpty: Bool {
        rootNoteLetter == nil && quality.isEmpty && sus.isEmpty && additions.isEmpty
    }

    public var toString: String {
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
        return parts.joined()
    }
}

/// Convinent
public extension ChordSymbol {
    static let Cmaj7 = ChordSymbol(rootNoteLetter: .C, quality: .major7)
    static let Dmin7 = ChordSymbol(rootNoteLetter: .D, quality: .minor7)
    static let G7 = ChordSymbol(rootNoteLetter: .G, quality: .seven)
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
