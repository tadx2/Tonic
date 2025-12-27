import Testing
import Foundation
@testable import Tonic

@Suite("Accidental Tests")
struct AccidentalTests {

    @Test("Simple Description")
    func testSimpleDescription() {
        // Natural
        #expect(Accidental(0).simpleDescription == "")
        
        // Sharp
        #expect(Accidental(1).simpleDescription == "♯")
        #expect(Accidental(2).simpleDescription == "♯♯")
        #expect(Accidental(3).simpleDescription == "♯♯♯")
        
        // Flat
        #expect(Accidental(-1).simpleDescription == "♭")
        #expect(Accidental(-2).simpleDescription == "♭♭")
        #expect(Accidental(-3).simpleDescription == "♭♭♭")
    }

    @Test("Standard Notation")
    func testNotation() {
        // Natural
        #expect(Accidental(0).notation == "")
        
        // Sharp
        #expect(Accidental(1).notation == "♯")
        #expect(Accidental(2).notation == "𝄪")      // Double sharp
        #expect(Accidental(3).notation == "𝄪♯")     // Triple sharp (1 double + 1 single)
        #expect(Accidental(4).notation == "𝄪𝄪")     // Quadruple sharp
        
        // Flat
        #expect(Accidental(-1).notation == "♭")
        #expect(Accidental(-2).notation == "♭♭")     // Double flat (standard)
        #expect(Accidental(-3).notation == "♭♭♭")
    }

    @Test("Common Combinations")
    func testCombinations() {
        // Standard Set (Version 1)
        #expect(Accidental.standardSet.count == 3)
        #expect(Accidental.standardSet.contains(0))
        #expect(Accidental.standardSet.contains(1))
        #expect(Accidental.standardSet.contains(-1))
        
        // Extended Set (Version 2)
        #expect(Accidental.extendedSet.count == 5)
        #expect(Accidental.extendedSet.contains(2))   // Double sharp
        #expect(Accidental.extendedSet.contains(-2))  // Double flat
        
        // Legacy Compatibility
        #expect(Accidental.CommonCombinationsVersion1 == Accidental.standardSet)
        #expect(Accidental.CommonCombinationsVersion2 == Accidental.extendedSet)
    }
}
