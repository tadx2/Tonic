import Foundation
import Testing

@testable import Tonic

@Suite("Letter Tests")
struct LetterTests {

    @Test("Letter Addition")
    func testLetterAddition() {
        #expect(Letter.C + 0 == .C)
        #expect(Letter.C + 1 == .D)
        #expect(Letter.C + 2 == .E)
        #expect(Letter.C + 7 == .C)
        #expect(Letter.C + 8 == .D)
        #expect(Letter.C + 9 == .E)
        #expect(Letter.C + 15 == .D)

        #expect(Letter.B + 1 == .C)
        #expect(Letter.B + 2 == .D)

        #expect(Letter.C + -1 == .B)
        #expect(Letter.C + -2 == .A)
        #expect(Letter.C + -7 == .C)
    }

    @Test("Letter Subtraction")
    func testLetterSubtraction() {
        #expect(Letter.C - 0 == .C)
        #expect(Letter.D - 1 == .C)
        #expect(Letter.E - 2 == .C)
        #expect(Letter.C - (-1) == .D)
        #expect(Letter.B - (-6) == .A)
        #expect(Letter.G - 4 == .C)
    }

    @Test("Letter Shifted")
    func testShifted() {
        // Up
        var res = Letter.C.shifted(by: 1)
        #expect(res.letter == .D)
        #expect(res.octaveDiff == 0)
        
        res = Letter.C.shifted(by: 2)
        #expect(res.letter == .E)
        #expect(res.octaveDiff == 0)
        
        res = Letter.C.shifted(by: 3)
        #expect(res.letter == .F)
        #expect(res.octaveDiff == 0)
        
        res = Letter.C.shifted(by: 4)
        #expect(res.letter == .G)
        #expect(res.octaveDiff == 0)
        
        res = Letter.C.shifted(by: 5)
        #expect(res.letter == .A)
        #expect(res.octaveDiff == 0)
        
        res = Letter.C.shifted(by: 6)
        #expect(res.letter == .B)
        #expect(res.octaveDiff == 0)

        res = Letter.C.shifted(by: 7)
        #expect(res.letter == .C)
        #expect(res.octaveDiff == 1)

        res = Letter.C.shifted(by: 8)
        #expect(res.letter == .D)
        #expect(res.octaveDiff == 1)

        res = Letter.B.shifted(by: 1)
        #expect(res.letter == .C)
        #expect(res.octaveDiff == 1)

        // Down
        res = Letter.C.shifted(by: -1)
        #expect(res.letter == .B)
        #expect(res.octaveDiff == -1)
        
        res = Letter.C.shifted(by: -7)
        #expect(res.letter == .C)
        #expect(res.octaveDiff == -1)
        
        res = Letter.C.shifted(by: -8)
        #expect(res.letter == .B)
        #expect(res.octaveDiff == -2)

        res = Letter.C.shifted(by: -14)
        #expect(res.letter == .C)
        #expect(res.octaveDiff == -2)

    }
}
