//
//  ChordSymbolElement.swift
//  Tonic
//
//  Created by 小汤汤 on 3/6/26.
//

public protocol RendableChordSymbolElement {
    func displayString(mode: DisplayModeMainSus) -> String
}

public struct ChordSymbolRoot: Hashable, Sendable, RendableChordSymbolElement {
    public let note: Note

    public init(note: Note) {
        self.note = note
    }

    public func displayString(mode: DisplayModeMainSus = .standard) -> String {
        note.description
    }
}

public enum ChordSymbolElement: Hashable, Sendable, CaseIterable, RendableChordSymbolElement {

    case major, majorFlat5, majorSharp5, major6, major7, majorFlatFlat7, major9, major11, major13,
        major69
    case halfDiminished
    case diminished, diminished6, diminished69, diminished7, diminished9, diminished11, diminished13
    case minor, minorSharp5, minorFlat5, minorAugmented, minor6, minor69, minor7, minorFlatFlat7,
        minor9, minor11, minor13
    case augmented, augmented6, augmented69, augmented7, augmented9, augmented11, augmented13
    case flat5, sharp5
    case seven, flatFlat7, sevenAlt
    case six, six9
    case nine, flat9, sharp9
    case eleven, sharp11
    case thirteen, flat13, sharp13
    case sus, sus2, sus4
    case minorMajor, minorMajorFlat5, minorMajorSharp5, minorMajor7, minorMajor9, minorMajor11,
        minorMajor13
    case alt

    // Only For Wrong Tension
    case two, flat2, sharp2, four, flat4, sharp4

    // 有这个符号的和弦可以写 69模式
    var canChangeToSixNineSymbol: Bool {
        [ChordSymbolElement.six, .major6, .minor6, .diminished6, .augmented6].contains(self)
    }

    // 返回没有6的和弦记号
    var changeToSixNineSymbol: ChordSymbolElement? {
        return switch self {
        case .six: .six9
        case .major6: .major69
        case .minor6: .minor69
        case .diminished6: .diminished69
        case .augmented6: .augmented69
        default: nil
        }
    }

    // 有这个符号的和弦mergedTension
    var canMergedTensionSymbol: Bool {
        [ChordSymbolElement.seven, .major7, .minor7, .diminished7, .augmented7, .minorMajor7]
            .contains(self)
    }

    public func addMergedTensionSymbol(tensionSymbol: ChordSymbolElement) -> ChordSymbolElement? {
        guard canMergedTensionSymbol else { return nil }
        switch self {
        case .seven:
            switch tensionSymbol {
            case .nine: return .nine
            case .eleven: return .eleven
            case .thirteen: return .thirteen
            default: return nil
            }
        case .major7:
            switch tensionSymbol {
            case .nine: return .major9
            case .eleven: return .major11
            case .thirteen: return .major13
            default: return nil
            }
        case .minor7:
            switch tensionSymbol {
            case .nine: return .minor9
            case .eleven: return .minor11
            case .thirteen: return .minor13
            default: return nil
            }
        case .minorMajor7:
            switch tensionSymbol {
            case .nine: return .minorMajor9
            case .eleven: return .minorMajor11
            case .thirteen: return .minorMajor13
            default: return nil
            }
        case .augmented7:
            switch tensionSymbol {
            case .nine: return .augmented9
            case .eleven: return .augmented11
            case .thirteen: return .augmented13
            default: return nil
            }
        case .diminished7:
            switch tensionSymbol {
            case .nine: return .diminished9
            case .eleven: return .diminished11
            case .thirteen: return .diminished13
            default: return nil
            }
        default: return nil
        }
    }

    public var inputElements: [ChordSymbolElementInput] {
        switch self {
        case .major:
            [.major]
        case .majorFlat5:
            [.major, .flat, .five]
        case .majorSharp5:
            [.major, .sharp, .five]
        case .major6:
            [.major, .six]
        case .major69:
            [.major, .six, .nine]
        case .major7:
            [.major, .seven]
        case .majorFlatFlat7:
            [.major, .flat, .flat, .seven]
        case .major9:
            [.major, .nine]
        case .major11:
            [.major, .eleven]
        case .major13:
            [.major, .thirteen]
        case .halfDiminished:
            [.halfDiminished]
        case .diminished:
            [.diminished]
        case .diminished6:
            [.diminished, .six]
        case .diminished69:
            [.diminished, .six, .nine]
        case .diminished7:
            [.diminished, .seven]
        case .diminished9:
            [.diminished, .nine]
        case .diminished11:
            [.diminished, .eleven]
        case .diminished13:
            [.diminished, .thirteen]
        case .minor:
            [.minor]
        case .minorSharp5:
            [.minor, .sharp, .five]
        case .minorFlat5:
            [.minor, .flat, .five]
        case .minorAugmented:
            [.minor, .augmented]
        case .minor6:
            [.minor, .six]
        case .minor69:
            [.minor, .six, .nine]
        case .minor7:
            [.minor, .seven]
        case .minorFlatFlat7:
            [.minor, .flat, .flat, .seven]
        case .minor9:
            [.minor, .nine]
        case .minor11:
            [.minor, .eleven]
        case .minor13:
            [.minor, .thirteen]
        case .augmented:
            [.augmented]
        case .augmented6:
            [.augmented, .six]
        case .augmented69:
            [.augmented, .six, .nine]
        case .augmented7:
            [.augmented, .seven]
        case .augmented9:
            [.augmented, .nine]
        case .augmented11:
            [.augmented, .eleven]
        case .augmented13:
            [.augmented, .thirteen]
        case .flat5:
            [.flat, .five]
        case .sharp5:
            [.sharp, .five]
        case .seven:
            [.seven]
        case .flatFlat7:
            [.flat, .flat, .seven]
        case .sevenAlt:
            [.seven, .alt]
        case .six:
            [.six]
        case .six9:
            [.six, .nine]
        case .nine:
            [.nine]
        case .flat9:
            [.flat, .nine]
        case .sharp9:
            [.sharp, .nine]
        case .eleven:
            [.eleven]
        case .sharp11:
            [.sharp, .eleven]
        case .thirteen:
            [.thirteen]
        case .flat13:
            [.flat, .thirteen]
        case .sharp13:
            [.sharp, .thirteen]
        case .sus:
            [.sus]
        case .sus2:
            [.sus, .two]
        case .sus4:
            [.sus, .four]
        case .minorMajor:
            [.minor, .major]
        case .minorMajorFlat5:
            [.minor, .major, .flat, .five]
        case .minorMajorSharp5:
            [.minor, .major, .sharp, .five]
        case .minorMajor7:
            [.minor, .major, .seven]
        case .minorMajor9:
            [.minor, .major, .nine]
        case .minorMajor11:
            [.minor, .major, .eleven]
        case .minorMajor13:
            [.minor, .major, .thirteen]
        case .alt:
            [.alt]

        // Only For Wrong tension
        case .two:
            [.two]
        case .flat2:
            [.flat, .two]
        case .sharp2:
            [.sharp, .two]
        case .four:
            [.four]
        case .flat4:
            [.flat, .four]
        case .sharp4:
            [.sharp, .four]
        }
    }

    public func displayString(mode: DisplayModeMainSus = .standard) -> String {
        return switch self {
        case .majorFlatFlat7:
            switch mode {
            case .standard:
                "M𝄫7"
            case .min_maj:
                "maj7"
            case .MIN_MAJ:
                "MAJ𝄫7"
            case .graph:
                "△𝄫7"
            }
        case .flatFlat7:
            "𝄫7"
        case .minorMajor:
            switch mode {
            case .standard:
                "mM"
            case .min_maj:
                "min maj"
            case .MIN_MAJ:
                "MIN MAJ"
            case .graph:
                "-△"
            }
        case .minorMajor13:
            switch mode {
            case .standard:
                "mM13"
            case .min_maj:
                "minMaj13"
            case .MIN_MAJ:
                "MINMAJ13"
            case .graph:
                "-△13"
            }
        default:
            self.inputElements.map {
                $0.displayString(mode: mode)
            }.joined()
        }

    }

}

public enum DisplayModeMainSus: CaseIterable, CustomStringConvertible {
    case standard, min_maj, MIN_MAJ, graph

    public var description: String {
        switch self {
        case .standard:
            "M/m"
        case .min_maj:
            "min/maj"
        case .MIN_MAJ:
            "MIN/MAJ"
        case .graph:
            "△/-"
        }
    }
}

public enum DisplayModeAddition: CaseIterable, CustomStringConvertible {
    case parentheses, add

    public var description: String {
        switch self {
        case .parentheses:
            "()"
        case .add:
            "add"
        }
    }
}

public enum ChordSymbolElementInput: CaseIterable, Sendable, RendableChordSymbolElement {

    case C, D, E, F, G, A, B
    case major, minor, augmented, diminished, sus, halfDiminished
    case two, four, five, six, seven, nine, eleven, thirteen
    case flat, sharp
    case alt
    case separator

    public func displayString(mode: DisplayModeMainSus = .standard) -> String {
        return switch self {
        case .C: "C"
        case .D: "D"
        case .E: "E"
        case .F: "F"
        case .G: "G"
        case .A: "A"
        case .B: "B"
        case .major:
            switch mode {
            case .standard:
                "M"
            case .min_maj:
                "maj"
            case .MIN_MAJ:
                "MAJ"
            case .graph:
                "△"
            }
        case .minor:
            switch mode {
            case .standard:
                "m"
            case .min_maj:
                "min"
            case .MIN_MAJ:
                "MIN"
            case .graph:
                "-"
            }
        case .augmented:
            switch mode {
            case .standard:
                "aug"
            case .min_maj:
                "aug"
            case .MIN_MAJ:
                "Aug"
            case .graph:
                "+"
            }
        case .diminished:
            switch mode {
            case .standard:
                "dim"
            case .min_maj:
                "dim"
            case .MIN_MAJ:
                "Dim"
            case .graph:
                "o"
            }
        case .halfDiminished:
            switch mode {
            case .standard:
                "m7♭5"
            case .min_maj:
                "min7♭5"
            case .MIN_MAJ:
                "MIN7♭5"
            case .graph:
                "ø"
            }
        case .sus: "sus"
        case .two: "2"
        case .four: "4"
        case .five: "5"
        case .six: "6"
        case .seven: "7"
        case .nine: "9"
        case .eleven: "11"
        case .thirteen: "13"
        case .flat: "♭"
        case .sharp: "♯"
        case .alt: "Alt"
        case .separator: "'"
        }
    }

}

extension ChordSymbolElementInput {
    var rootLetter: Letter? {
        switch self {
        case .C: .C
        case .D: .D
        case .E: .E
        case .F: .F
        case .G: .G
        case .A: .A
        case .B: .B
        default: nil
        }
    }

    var isAccidental: Bool {
        self == .flat || self == .sharp
    }

    var accidentalValue: Accidental {
        switch self {
        case .flat:
            -1
        case .sharp:
            1
        default:
            0
        }
    }
}

public struct ChordSymbolElementInputGroup: Sendable {

    public let elements: [ChordSymbolElementInput]

    public init(_ elements: [ChordSymbolElementInput]) {
        self.elements = elements
    }

    // 有效用户输入, [ChordSymbolElementInput] 转化为 [ChordSymbolElement]
    public var validUserInput: [ChordSymbolElement] {
        self.convertToRendableChordSymbolElement.compactMap { $0 as? ChordSymbolElement }
    }

    // 最合适 chordSymbol  [ChordSymbolElement] 转化为 set 再 寻找最合适的匹配 ChordSymbol
    public var matchedChordSymbol: [ChordSymbol] {
        let matches =
            ChordSymbol.ChordSymbolInputElementSetSearchChordSymbolDictionary[
                Set(self.validUserInput)]
            ?? []
        guard let root = parsedRoot?.note else { return matches }
        return matches.map { symbol in
            var result = symbol
            result.root = root
            return result
        }
    }

}

// 可渲染元素
extension ChordSymbolElementInputGroup {

    public var parsedRoot: ChordSymbolRoot? {
        extractRootAndRemainingInput().root
    }

    // 根据用户的 ChordSymbolElementInput 输入转化为 可渲染元素
    public var convertToRendableChordSymbolElement: [RendableChordSymbolElement] {
        guard !elements.isEmpty else { return [] }

        var result: [RendableChordSymbolElement] = []
        var index = 0
        var hasParsedRoot = false

        while index < elements.count {
            let current = elements[index]

            if !hasParsedRoot, let letter = current.rootLetter {
                var accidental: Accidental = 0
                var cursor = index + 1
                var accidentalCount = 0

                while cursor < elements.count, accidentalCount < 2, elements[cursor].isAccidental {
                    accidental += elements[cursor].accidentalValue
                    accidentalCount += 1
                    cursor += 1
                }

                result.append(ChordSymbolRoot(note: Note(letter: letter, accidental: accidental)))
                hasParsedRoot = true
                index = cursor
                continue
            }

            // 从当前位置做贪心最长匹配（保持输入顺序）
            var bestMatch: ChordSymbolElement? = nil
            var bestMatchLength = 0

            for candidate in ChordSymbolElement.allCases {
                let candidateInputs = candidate.inputElements
                let length = candidateInputs.count
                guard length > bestMatchLength, index + length <= elements.count else { continue }

                let slice = Array(elements[index..<(index + length)])
                if slice == candidateInputs {
                    bestMatch = candidate
                    bestMatchLength = length
                }
            }

            if let matched = bestMatch {
                result.append(matched)
                index += bestMatchLength
            } else {
                result.append(current)
                index += 1
            }
        }

        return result
    }

    /// 从整体输入中抽取根音：
    /// - 根音模式：一个字母 + 最多两个 accidental（# / b）
    /// - 根音可以出现在输入序列任意位置
    private func extractRootAndRemainingInput() -> (
        root: ChordSymbolRoot?, remaining: [ChordSymbolElementInput]
    ) {
        guard let rootLetterIndex = elements.firstIndex(where: { $0.rootLetter != nil }),
            let letter = elements[rootLetterIndex].rootLetter
        else {
            return (nil, elements)
        }

        var accidental: Accidental = 0
        var consumedAccidentalCount = 0
        var cursor = rootLetterIndex + 1

        while cursor < elements.count, consumedAccidentalCount < 2, elements[cursor].isAccidental {
            accidental += elements[cursor].accidentalValue
            consumedAccidentalCount += 1
            cursor += 1
        }

        let root = ChordSymbolRoot(note: Note(letter: letter, accidental: accidental))
        var remaining = elements
        remaining.removeSubrange(rootLetterIndex..<cursor)
        return (root, remaining)
    }

}
