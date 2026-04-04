//
//  ChordSymbolElementGroupConvertToTonicElement.swift
//  Tonic
//
//  Created by 小汤汤 on 4/3/26.
//

import Foundation

extension ChordSymbolElementGroup {
    var canConvertToAccidental: Bool {
        allSatisfy(\.isAccidental)
    }

    var toAccidental: Accidental? {
        guard canConvertToAccidental else { return nil }

        var accidental: Accidental = 0

        for element in self {
            if element == .flat {
                accidental -= 1
            } else {
                accidental += 1
            }
        }

        return accidental
    }
}
