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
        additions: [ChordSymbolElementGroup] = [],
    ) {
        self.quality = quality
        self.sus = sus
        self.additions = additions
        self.rootNoteLetter = rootNoteLetter
        self.rootNoteAcc = rootNoteAcc
    }

    // 返回一个不包含 RN 的Symbol
    public var body: ChordSymbol {
        ChordSymbol(
            rootNoteLetter: nil,
            rootNoteAcc: [],
            quality: quality,
            sus: sus,
            additions: additions
        )
    }

}
