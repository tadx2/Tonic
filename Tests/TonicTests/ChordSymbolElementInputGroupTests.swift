import Testing

@testable import Tonic

@Suite("ChordSymbolElementInputGroup Tests")
struct ChordSymbolElementInputGroupTests {

    @Test("Converts empty input to empty result")
    func convertEmptyInput() {
        let result = ChordSymbolElementInputGroup([]).convertToChordSymbolElement
        #expect(result.isEmpty)
    }

    @Test("Returns matched element for direct input")
    func convertDirectInput() {
        let input: [ChordSymbolElementInput] = [.major, .sharp, .five]
        let result = ChordSymbolElementInputGroup(input).convertToChordSymbolElement
        #expect(result.count == 1)
        #expect(result[0] as? ChordSymbolElement == .majorSharp5)
    }

    @Test("Returns merged element only for exact group")
    func convertHalfDiminishedInput() {
        // minor + seven + flat + five => 没有直接匹配的单一 ChordSymbolElement
        // minor7 匹配 [.minor, .seven], flat5 匹配 [.flat, .five]
        let input: [ChordSymbolElementInput] = [.minor, .seven, .flat, .five]
        let result = ChordSymbolElementInputGroup(input).convertToChordSymbolElement
        #expect(result.count == 2)
        #expect(result[0] as? ChordSymbolElement == .minor7)
        #expect(result[1] as? ChordSymbolElement == .flat5)
    }

    @Test("Returns split elements for partial match input")
    func convertSplitOnlyInput() {
        // major + sharp + five => majorSharp5, seven => seven
        let input: [ChordSymbolElementInput] = [.major, .sharp, .five, .seven]
        let result = ChordSymbolElementInputGroup(input).convertToChordSymbolElement
        #expect(result.count == 2)
        #expect(result[0] as? ChordSymbolElement == .majorSharp5)
        #expect(result[1] as? ChordSymbolElement == .seven)
    }

    @Test("Returns raw input when no candidate matches")
    func convertUnmatchedInput() {
        let result = ChordSymbolElementInputGroup([.flat]).convertToChordSymbolElement
        #expect(result.count == 1)
        #expect(result[0] as? ChordSymbolElementInput == .flat)
    }

    @Test("Separator breaks greedy match: M ' b5 => major + separator + flat5")
    func convertWithSeparator() {
        // Without separator: [.major, .flat, .five] => majorFlat5
        // With separator:    [.major, .separator, .flat, .five] => major + separator + flat5
        let input: [ChordSymbolElementInput] = [.major, .separator, .flat, .five]
        let result = ChordSymbolElementInputGroup(input).convertToChordSymbolElement
        #expect(result.count == 3)
        #expect(result[0] as? ChordSymbolElement == .major)
        #expect(result[1] as? ChordSymbolElementInput == .separator)
        #expect(result[2] as? ChordSymbolElement == .flat5)
    }

    @Test(
        "Multiple separators: m M ' b 5 ' 7 => minorMajor + separator + flat5 + separator + seven")
    func convertWithMultipleSeparators() {
        let input: [ChordSymbolElementInput] = [
            .minor, .major, .separator, .flat, .five, .separator, .seven,
        ]
        let result = ChordSymbolElementInputGroup(input).convertToChordSymbolElement
        #expect(result.count == 5)
        #expect(result[0] as? ChordSymbolElement == .minorMajor)
        #expect(result[1] as? ChordSymbolElementInput == .separator)
        #expect(result[2] as? ChordSymbolElement == .flat5)
        #expect(result[3] as? ChordSymbolElementInput == .separator)
        #expect(result[4] as? ChordSymbolElement == .seven)
    }

    @Test("Separator at edges produces correct result")
    func convertWithEdgeSeparators() {
        // Leading separator: ' M => separator + major
        let input1: [ChordSymbolElementInput] = [.separator, .major]
        let result1 = ChordSymbolElementInputGroup(input1).convertToChordSymbolElement
        #expect(result1.count == 2)
        #expect(result1[0] as? ChordSymbolElementInput == .separator)
        #expect(result1[1] as? ChordSymbolElement == .major)

        // Trailing separator: M ' => major + separator
        let input2: [ChordSymbolElementInput] = [.major, .separator]
        let result2 = ChordSymbolElementInputGroup(input2).convertToChordSymbolElement
        #expect(result2.count == 2)
        #expect(result2[0] as? ChordSymbolElement == .major)
        #expect(result2[1] as? ChordSymbolElementInput == .separator)
    }
}
