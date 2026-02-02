//
//  ChordTests.swift
//  Tonic
//
//  Created by 小汤汤 on 2/2/26.
//

import Foundation
import Testing

@testable import Tonic

@Suite("Chord Name Tests")
struct ChordNameTests {
    @Test("Chord Name Maj")
    func testChordNameMaj() {
        
        // C4M7
        #expect(
            ChordName(chord: MockChord.C4M7).getChordNameString(isMergeTension: true, isShort: true) == "C△"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7).getChordNameString(isMergeTension: true, isShort: false) == "CM7"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7).getChordNameString(isMergeTension: false, isShort: true) == "C△"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7).getChordNameString(isMergeTension: false, isShort: false) == "CM7"
        )
        
        // C4M7_M9
        #expect(
            ChordName(chord: MockChord.C4M7_M9).getChordNameString(isMergeTension: true, isShort: true) == "C△9"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9).getChordNameString(isMergeTension: true, isShort: false) == "CM9"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9).getChordNameString(isMergeTension: false, isShort: true) == "C△(9)"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9).getChordNameString(isMergeTension: false, isShort: false) == "CM7(9)"
        )
        
        // C4M7_M13
        #expect(
            ChordName(chord: MockChord.C4M7_M13).getChordNameString(isMergeTension: true, isShort: true) == "C△13"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M13).getChordNameString(isMergeTension: true, isShort: false) == "CM13"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M13).getChordNameString(isMergeTension: false, isShort: true) == "C△(13)"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M13).getChordNameString(isMergeTension: false, isShort: false) == "CM7(13)"
        )
        
        // C4M7_M9_M13
        #expect(
            ChordName(chord: MockChord.C4M7_M9_M13).getChordNameString(isMergeTension: true, isShort: true) == "C△13"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_M13).getChordNameString(isMergeTension: true, isShort: false) == "CM13"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_M13).getChordNameString(isMergeTension: false, isShort: true) == "C△(9 13)"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_M13).getChordNameString(isMergeTension: false, isShort: false) == "CM7(9 13)"
        )
        
        // C4M7_M9_P11
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11).getChordNameString(isMergeTension: true, isShort: true) == "C△11"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11).getChordNameString(isMergeTension: true, isShort: false) == "CM11"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11).getChordNameString(isMergeTension: false, isShort: true) == "C△(9 11)"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11).getChordNameString(isMergeTension: false, isShort: false) == "CM7(9 11)"
        )
        
        // C4M7_M9_P11_M13
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11_M13).getChordNameString(isMergeTension: true, isShort: true) == "C△13"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11_M13).getChordNameString(isMergeTension: true, isShort: false) == "CM13"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11_M13).getChordNameString(isMergeTension: false, isShort: true) == "C△(9 11 13)"
        )
        
        #expect(
            ChordName(chord: MockChord.C4M7_M9_P11_M13).getChordNameString(isMergeTension: false, isShort: false) == "CM7(9 11 13)"
        )
    
    }

    @Test("Chord Name Minor")
    func testChordNameMinor() {
        
        // D4m7
        #expect(
            ChordName(chord: MockChord.D4m7).getChordNameString(isMergeTension: true, isShort: true) == "D-7"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7).getChordNameString(isMergeTension: true, isShort: false) == "Dm7"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7).getChordNameString(isMergeTension: false, isShort: true) == "D-7"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7).getChordNameString(isMergeTension: false, isShort: false) == "Dm7"
        )
        
        // D4m7_M9
        #expect(
            ChordName(chord: MockChord.D4m7_M9).getChordNameString(isMergeTension: true, isShort: true) == "D-9"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9).getChordNameString(isMergeTension: true, isShort: false) == "Dm9"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9).getChordNameString(isMergeTension: false, isShort: true) == "D-7(9)"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9).getChordNameString(isMergeTension: false, isShort: false) == "Dm7(9)"
        )
        
        // D4m7_M9_M11
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11).getChordNameString(isMergeTension: true, isShort: true) == "D-11"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11).getChordNameString(isMergeTension: true, isShort: false) == "Dm11"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11).getChordNameString(isMergeTension: false, isShort: true) == "D-7(9 11)"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11).getChordNameString(isMergeTension: false, isShort: false) == "Dm7(9 11)"
        )
        
        // D4m7_M9_M11
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11_M13).getChordNameString(isMergeTension: true, isShort: true) == "D-13"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11_M13).getChordNameString(isMergeTension: true, isShort: false) == "Dm13"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11_M13).getChordNameString(isMergeTension: false, isShort: true) == "D-7(9 11 13)"
        )
        
        #expect(
            ChordName(chord: MockChord.D4m7_M9_P11_M13).getChordNameString(isMergeTension: false, isShort: false) == "Dm7(9 11 13)"
        )
        
        
    }
    
    @Test("Chord Name Dominent")
    func testChordNameDominent() {
        
        // G4x7
        #expect(
            ChordName(chord: MockChord.G4x7).getChordNameString(isMergeTension: true, isShort: true) == "G7"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7).getChordNameString(isMergeTension: true, isShort: false) == "G7"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7).getChordNameString(isMergeTension: false, isShort: true) == "G7"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7).getChordNameString(isMergeTension: false, isShort: false) == "G7"
        )
        
        // G4x7_M9
        #expect(
            ChordName(chord: MockChord.G4x7_M9).getChordNameString(isMergeTension: true, isShort: true) == "G9"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9).getChordNameString(isMergeTension: true, isShort: false) == "G9"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9).getChordNameString(isMergeTension: false, isShort: true) == "G7(9)"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9).getChordNameString(isMergeTension: false, isShort: false) == "G7(9)"
        )
        
        // G4x7_M9_P11
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11).getChordNameString(isMergeTension: true, isShort: true) == "G11"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11).getChordNameString(isMergeTension: true, isShort: false) == "G11"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11).getChordNameString(isMergeTension: false, isShort: true) == "G7(9 11)"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11).getChordNameString(isMergeTension: false, isShort: false) == "G7(9 11)"
        )
        
        // G4x7_M9_M13
        #expect(
            ChordName(chord: MockChord.G4x7_M9_M13).getChordNameString(isMergeTension: true, isShort: true) == "G13"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_M13).getChordNameString(isMergeTension: true, isShort: false) == "G13"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_M13).getChordNameString(isMergeTension: false, isShort: true) == "G7(9 13)"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_M13).getChordNameString(isMergeTension: false, isShort: false) == "G7(9 13)"
        )
        
        // G4x7_M9_P11_M13
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11_M13).getChordNameString(isMergeTension: true, isShort: true) == "G13"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11_M13).getChordNameString(isMergeTension: true, isShort: false) == "G13"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11_M13).getChordNameString(isMergeTension: false, isShort: true) == "G7(9 11 13)"
        )
        
        #expect(
            ChordName(chord: MockChord.G4x7_M9_P11_M13).getChordNameString(isMergeTension: false, isShort: false) == "G7(9 11 13)"
        )
        
    }

}
