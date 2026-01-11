import Testing
import Foundation
@testable import Tonic

@Suite("Accidental Tests")
struct AccidentalTests {

    @Test("Simple Description")
    func testSimpleDescription() {
        // Natural
        #expect(Accidental(0).descriptionSimple == "")
        
        // Sharp
        #expect(Accidental(1).descriptionSimple == "♯")
        #expect(Accidental(2).descriptionSimple == "♯♯")
        #expect(Accidental(3).descriptionSimple == "♯♯♯")
        
        // Flat
        #expect(Accidental(-1).descriptionSimple == "♭")
        #expect(Accidental(-2).descriptionSimple == "♭♭")
        #expect(Accidental(-3).descriptionSimple == "♭♭♭")
    }

    @Test("Standard Notation")
    func testNotation() {
        // Natural
        #expect(Accidental(0).descriptionStrict == "")
        
        // Sharp
        #expect(Accidental(1).descriptionStrict == "♯")
        #expect(Accidental(2).descriptionStrict == "𝄪")      // Double sharp
        #expect(Accidental(3).descriptionStrict == "𝄪♯")     // Triple sharp (1 double + 1 single)
        #expect(Accidental(4).descriptionStrict == "𝄪𝄪")     // Quadruple sharp
        
        // Flat
        #expect(Accidental(-1).descriptionStrict == "♭")
        #expect(Accidental(-2).descriptionStrict == "♭♭")     // Double flat (standard)
        #expect(Accidental(-3).descriptionStrict == "♭♭♭")
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
