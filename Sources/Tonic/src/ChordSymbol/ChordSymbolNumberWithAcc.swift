//
//  ChordSymbolElementNumberWithAcc.swift
//  Tonic
//
//  Created by 小汤汤 on 3/5/26.

public struct ChordSymbolNumberWithAcc: Sendable, Equatable, Hashable {

    public var accidentals: [ChordSymbolAccidental]

    public var number: ChordSymbolNumber?

    public var displayString: String {

        let currentNumber = self.number?.rawValue
        let currentNumberString = currentNumber?.description ?? ""

        if accidentals == [.flat, .flat] {
            return "𝄫" + currentNumberString
        } else if accidentals == [.sharp, .sharp] {
            return "𝄪" + currentNumberString
        }

        return self.accidentals.map { $0.symbolString }.joined() + currentNumberString
    }

    public init(accidentals: [ChordSymbolAccidental], number: ChordSymbolNumber) {
        self.accidentals = accidentals
        self.number = number
    }

    public init(number: ChordSymbolNumber) {
        self.accidentals = []
        self.number = number
    }

    public init(accidental: ChordSymbolAccidental) {
        self.accidentals = [accidental]
        self.number = nil
    }

}

extension ChordSymbolNumberWithAcc {

    public static let two =
        ChordSymbolNumberWithAcc(accidentals: [], number: .two)
    public static let four =
        ChordSymbolNumberWithAcc(accidentals: [], number: .four)

    static let six =
        ChordSymbolNumberWithAcc(accidentals: [], number: .six)

    // Five
    public static let five =
        ChordSymbolNumberWithAcc(accidentals: [], number: .five)
    public static let fiveFlat =
        ChordSymbolNumberWithAcc(accidentals: [.flat], number: .five)
    public static let fiveSharp =
        ChordSymbolNumberWithAcc(accidentals: [.sharp], number: .five)

    // seven
    public static let seven =
        ChordSymbolNumberWithAcc(accidentals: [], number: .seven)
    public static let doubleFlat7 =
        ChordSymbolNumberWithAcc(accidentals: [.flat, .flat], number: .seven)

    // nine
    public static let nine =
        ChordSymbolNumberWithAcc(accidentals: [], number: .nine)
    public static let nineFlat =
        ChordSymbolNumberWithAcc(accidentals: [.flat], number: .nine)
    public static let nineSharp =
        ChordSymbolNumberWithAcc(accidentals: [.sharp], number: .nine)

    // eleven
    public static let eleven =
        ChordSymbolNumberWithAcc(accidentals: [], number: .eleven)
    public static let elevenSharp =
        ChordSymbolNumberWithAcc(accidentals: [.sharp], number: .eleven)

    // thirteen
    public static let thirteen =
        ChordSymbolNumberWithAcc(accidentals: [], number: .thirteen)
    public static let thirteenFlat =
        ChordSymbolNumberWithAcc(accidentals: [.flat], number: .thirteen)
    public static let thirteenSharp =
        ChordSymbolNumberWithAcc(accidentals: [.sharp], number: .thirteen)

}

public enum ChordSymbolAccidental: CaseIterable, Sendable, Hashable {

    case flat, sharp

    public var symbolString: String {
        switch self {
        case .flat:
            return "♭"
        case .sharp:
            return "♯"
        }
    }

    public var simitone: Double {
        switch self {
        case .flat:
            return -0.5
        case .sharp:
            return 0.5
        }
    }
}

public enum ChordSymbolNumber: Int, CaseIterable, Sendable, Hashable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case nine = 9
    case eleven = 11
    case thirteen = 13
    case sixNine = 69
}
