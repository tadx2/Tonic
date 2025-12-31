import Testing
import Foundation
@testable import Tonic

@Suite("ChordDegreeInt Tests")
struct ChordDegreeIntTests {

    @Test("inUsedDegreeInt")
    func testInUsedDegreeInt() {
        #expect(1.chordDnaRawIndex == 0)
        #expect(2.chordDnaRawIndex == 1)
        #expect(3.chordDnaRawIndex == 2)
        #expect(4.chordDnaRawIndex == 3)
        #expect(5.chordDnaRawIndex == 4)
        #expect(6.chordDnaRawIndex == 5)
        #expect(7.chordDnaRawIndex == 6)
        
        #expect(8.chordDnaRawIndex == nil)
        #expect(9.chordDnaRawIndex == 7)
        #expect(10.chordDnaRawIndex == nil)
        #expect(11.chordDnaRawIndex == 8)
        #expect(12.chordDnaRawIndex == nil)
        #expect(13.chordDnaRawIndex == 9)
        #expect(14.chordDnaRawIndex == nil)
        
        #expect(15.chordDnaRawIndex == 0)
        #expect(16.chordDnaRawIndex == 1)
        #expect(17.chordDnaRawIndex == 2)
        #expect(18.chordDnaRawIndex == 3)
        #expect(19.chordDnaRawIndex == 4)
        #expect(20.chordDnaRawIndex == 5)
        #expect(21.chordDnaRawIndex == 6)
        
        #expect(22.chordDnaRawIndex == nil)
        #expect(23.chordDnaRawIndex == 7)
        #expect(24.chordDnaRawIndex == nil)
        #expect(25.chordDnaRawIndex == 8)
        #expect(26.chordDnaRawIndex == nil)
        #expect(27.chordDnaRawIndex == 9)
        #expect(28.chordDnaRawIndex == nil)
    }

}
