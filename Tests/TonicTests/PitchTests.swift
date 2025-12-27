import Testing
import Foundation
@testable import Tonic

@Suite("Pitch Tests")
struct PitchTests {

    @Test("Black Key Detection")
    func testIsBlack() {
        // C (60) - White
        #expect(60.isBlack == false)
        // C# (61) - Black
        #expect(61.isBlack == true)
        // D (62) - White
        #expect(62.isBlack == false)
        // Eb (63) - Black
        #expect(63.isBlack == true)
        // E (64) - White
        #expect(64.isBlack == false)
        // F (65) - White
        #expect(65.isBlack == false)
        // F# (66) - Black
        #expect(66.isBlack == true)
        // G (67) - White
        #expect(67.isBlack == false)
        // G# (68) - Black
        #expect(68.isBlack == true)
        // A (69) - White
        #expect(69.isBlack == false)
        // Bb (70) - Black
        #expect(70.isBlack == true)
        // B (71) - White
        #expect(71.isBlack == false)
        
        // Edge cases and octaves
        #expect(0.isBlack == false) // C-1
        #expect(1.isBlack == true)  // C#-1
        #expect(12.isBlack == false) // C0
        #expect(13.isBlack == true)  // C#0
        
        // Negative MIDI (theoretical)
        #expect((-1).isBlack == false) // B-2
        #expect((-2).isBlack == true)  // Bb-2
    }

    @Test("Octave Calculation")
    func testOctave() {
        // Standard C4 reference
        #expect(60.octave == 4)
        #expect(71.octave == 4) // B4
        
        // C5
        #expect(72.octave == 5)
        
        // C0
        #expect(12.octave == 0)
        #expect(23.octave == 0)
        
        // C-1 (MIDI 0)
        #expect(0.octave == -1)
        
        // Below MIDI 0
        #expect((-1).octave == -2)
        #expect((-12).octave == -2)
        #expect((-13).octave == -3)
    }
    
    @Test("Pitch as Int")
    func testPitchAsInt() {
        let p: Pitch = 60
        #expect(p + 1 == 61)
        #expect(p - 12 == 48)
        #expect(p < 72)
    }
}
