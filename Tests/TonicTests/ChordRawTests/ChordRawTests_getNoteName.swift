import Testing
import Foundation
@testable import Tonic

@Suite("ChordRaw getNoteName Tests")
struct ChordRawTests_getNoteName {

    // MARK: - 三和弦测试

    @Test("getNoteName - Major Triad (C E G)")
    func testGetNoteName_MajorTriad() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM)

        // C Major: C (1), E (3), G (5)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")

        // 不存在的音级应该返回 nil
        #expect(chord.getNoteName(by: 2) == nil)
        #expect(chord.getNoteName(by: 4) == nil)
        #expect(chord.getNoteName(by: 7) == nil)
    }

    @Test("getNoteName - Minor Triad (C Eb G)")
    func testGetNoteName_MinorTriad() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm)

        // C Minor: C (1), Eb (3), G (5)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")

        // 不存在的音级应该返回 nil
        #expect(chord.getNoteName(by: 2) == nil)
        #expect(chord.getNoteName(by: 7) == nil)
    }

    @Test("getNoteName - Diminished Triad (C Eb Gb)")
    func testGetNoteName_DiminishedTriad() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xdim)

        // C Diminished: C (1), Eb (3), Gb (5)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G♭")
    }

    // MARK: - 七和弦测试

    @Test("getNoteName - Major 7th (C E G B)")
    func testGetNoteName_Major7th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM7)

        // C Major 7: C (1), E (3), G (5), B (7)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B")
    }

    @Test("getNoteName - Minor 7th (C Eb G Bb)")
    func testGetNoteName_Minor7th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7)

        // C Minor 7: C (1), Eb (3), G (5), Bb (7)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
    }

    @Test("getNoteName - Dominant 7th (C E G Bb)")
    func testGetNoteName_Dominant7th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.x7)

        // C7: C (1), E (3), G (5), Bb (7)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
    }

    @Test("getNoteName - Diminished 7th (C Eb Gb A)")
    func testGetNoteName_Diminished7th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xdim7)

        // C Diminished 7: C (1), Eb (3), Gb (5), A/Bbb (7)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G♭")
        #expect(chord.getNoteName(by: 7) == "B♭♭")  // Diminished 7th is Bbb (enharmonic to A)
    }

    @Test("getNoteName - Half Diminished 7th (C Eb Gb Bb)")
    func testGetNoteName_HalfDiminished7th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7falt5)

        // C Half Diminished: C (1), Eb (3), Gb (5), Bb (7)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G♭")
        #expect(chord.getNoteName(by: 7) == "B♭")
    }

    // MARK: - 九和弦测试

    @Test("getNoteName - Major 9th (C E G B D)")
    func testGetNoteName_Major9th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM9)

        // C Major 9: C (1), E (3), G (5), B (7), D (9)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B")
        #expect(chord.getNoteName(by: 9) == "D")
    }

    @Test("getNoteName - Minor 9th (C Eb G Bb D)")
    func testGetNoteName_Minor9th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9)

        // C Minor 9: C (1), Eb (3), G (5), Bb (7), D (9)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D")
    }

    @Test("getNoteName - Dominant 9th (C E G Bb D)")
    func testGetNoteName_Dominant9th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.x9)

        // C9: C (1), E (3), G (5), Bb (7), D (9)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D")
    }

    @Test("getNoteName - Minor 7 flat5 flat9 (C Eb Gb Bb Db)")
    func testGetNoteName_Minor7Flat5Flat9() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7flat5flat9)

        // C m7♭5♭9: C (1), Eb (3), Gb (5), Bb (7), Db (9)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G♭")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D♭")
    }

    @Test("getNoteName - Diminished flat9 (C Eb Gb A Db)")
    func testGetNoteName_DiminishedFlat9() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xdimflat9)

        // C dim♭9: C (1), Eb (3), Gb (5), Bbb (7), Db (9)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G♭")
        #expect(chord.getNoteName(by: 7) == "B♭♭")
        #expect(chord.getNoteName(by: 9) == "D♭")
    }

    @Test("getNoteName - Minor 7 flat9 (C Eb G Bb Db)")
    func testGetNoteName_Minor7Flat9() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm7flat9)

        // C m7♭9: C (1), Eb (3), G (5), Bb (7), Db (9)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D♭")
    }

    // MARK: - 十三和弦测试

    @Test("getNoteName - Major 13th (C E G B D F A)")
    func testGetNoteName_Major13th() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM13)

        // C Major 13: C (1), E (3), G (5), B (7), D (9), F (11), A (13)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B")
        #expect(chord.getNoteName(by: 9) == "D")
        #expect(chord.getNoteName(by: 11) == "F")
        #expect(chord.getNoteName(by: 13) == "A")
    }

    // MARK: - Sus和弦测试

    @Test("getNoteName - Sus2 (C D G)")
    func testGetNoteName_Sus2() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xSus2)

        // C Sus2: C (1), D (2), G (5)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 2) == "D")
        #expect(chord.getNoteName(by: 5) == "G")

        // 3音不存在
        #expect(chord.getNoteName(by: 3) == nil)
    }

    // MARK: - 复杂和弦测试

    @Test("getNoteName - 7 sharp9 flat13 (C E G Bb D# Ab)")
    func testGetNoteName_7Sharp9Flat13() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.x7sharp9flat13)

        // C7♯9♭13: C (1), E (3), G (5), Bb (7), D# (9), Ab (13)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D♯")
        #expect(chord.getNoteName(by: 13) == "A♭")
    }

    @Test("getNoteName - M7 sus4 b5 (C F Gb B)")
    func testGetNoteName_M7Sus4b5() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xM7sus4b5)

        // C M7sus4♭5: C (1), F (4), Gb (5), B (7)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 4) == "F")
        #expect(chord.getNoteName(by: 5) == "G♭")
        #expect(chord.getNoteName(by: 7) == "B")
    }

    @Test("getNoteName - m9 flat13 (C Eb G Bb D Ab)")
    func testGetNoteName_m9Flat13() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9flat13)

        // C m9♭13: C (1), Eb (3), G (5), Bb (7), D (9), Ab (13)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D")
        #expect(chord.getNoteName(by: 13) == "A♭")
    }

    @Test("getNoteName - m9 sharp11 flat13 (C Eb G Bb D F# Ab)")
    func testGetNoteName_m9Sharp11Flat13() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9Shrop11flat13)

        // C m9♯11♭13: C (1), Eb (3), G (5), Bb (7), D (9), F# (11), Ab (13)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D")
        #expect(chord.getNoteName(by: 11) == "F♯")
        #expect(chord.getNoteName(by: 13) == "A♭")
    }

    @Test("getNoteName - m9 flat5 sharp11 flat13 (C Eb Gb Bb D F# Ab)")
    func testGetNoteName_m9Flat5Sharp11Flat13() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xm9flat5Shrop11flat13)

        // C m9♭5♯11♭13: C (1), Eb (3), Gb (5), Bb (7), D (9), F# (11), Ab (13)
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G♭")
        #expect(chord.getNoteName(by: 7) == "B♭")
        #expect(chord.getNoteName(by: 9) == "D")
        #expect(chord.getNoteName(by: 11) == "F♯")
        #expect(chord.getNoteName(by: 13) == "A♭")
    }

    @Test("getNoteName - M 9 sharp11 flat13 (C Eb G D F# Ab)")
    func testGetNoteName_M9Sharp11Flat13() {
        let chord = ChordRaw(rootNote: MockNote.C4, dnaRaw: MockRawDNA.xMflat99Shrop11flat13)

        // C M9♯11♭13: C (1), Eb (3), G (5), D (9), F# (11), Ab (13)
        // 注意：这个和弦没有7音，9音是自然音（14半音 = D）
        #expect(chord.getNoteName(by: 1) == "C")
        #expect(chord.getNoteName(by: 3) == "E♭")
        #expect(chord.getNoteName(by: 5) == "G")
        #expect(chord.getNoteName(by: 7) == nil)  // 7音不存在
        #expect(chord.getNoteName(by: 9) == "D")
        #expect(chord.getNoteName(by: 11) == "F♯")
        #expect(chord.getNoteName(by: 13) == "A♭")
    }

    // MARK: - 不同根音测试

    @Test("getNoteName - Different Root Notes")
    func testGetNoteName_DifferentRootNotes() {
        // D Major 和弦: D F# A
        let dMajor = ChordRaw(rootNote: MockNote.D4, dnaRaw: MockRawDNA.xM)
        #expect(dMajor.getNoteName(by: 1) == "D")
        #expect(dMajor.getNoteName(by: 3) == "F♯")
        #expect(dMajor.getNoteName(by: 5) == "A")

        // F Minor 和弦: F Ab C
        let fMinor = ChordRaw(rootNote: MockNote.F4, dnaRaw: MockRawDNA.xm)
        #expect(fMinor.getNoteName(by: 1) == "F")
        #expect(fMinor.getNoteName(by: 3) == "A♭")
        #expect(fMinor.getNoteName(by: 5) == "C")

        // Ab Major 7 和弦: Ab C Eb G
        let abMajor7 = ChordRaw(rootNote: MockNote.Ab4, dnaRaw: MockRawDNA.xM7)
        #expect(abMajor7.getNoteName(by: 1) == "A♭")
        #expect(abMajor7.getNoteName(by: 3) == "C")
        #expect(abMajor7.getNoteName(by: 5) == "E♭")
        #expect(abMajor7.getNoteName(by: 7) == "G")
    }
}
