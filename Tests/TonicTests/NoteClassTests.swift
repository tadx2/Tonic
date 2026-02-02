import Foundation
import Testing

@testable import Tonic

@Suite("NoteClass Tests")
struct NoteClassTests {

    @Test("Shifted")
    func testShifted() {

        #expect(NoteClass.C.shifted(by: .P1) == (.C, 0))
        #expect(NoteClass.C.shifted(by: .P5) == (.G, 0))
        #expect(NoteClass.C.shifted(by: .M7) == (.B, 0))
        #expect(NoteClass.C.shifted(by: .P8) == (.C, 1))
        #expect(NoteClass.C.shifted(by: .M9) == (.D, 1))
        #expect(NoteClass.C.shifted(by: .P11) == (.F, 1))
        #expect(NoteClass.C.shifted(by: .M13) == (.A, 1))
        #expect(NoteClass.C.shifted(by: .P15) == (.C, 2))

        #expect(NoteClass.C.shifted(by: -.P1) == (.C, 0))

        #expect(NoteClass.C.shifted(by: -Interval(degreeInt: 2, semitonesDiff: -3)) == (.Bss, -1))
        #expect(NoteClass.C.shifted(by: -.d2) == (.Bs, -1))
        #expect(NoteClass.C.shifted(by: -.m2) == (.B, -1))
        #expect(NoteClass.C.shifted(by: -.M2) == (.Bb, -1))
        #expect(NoteClass.C.shifted(by: -.A2) == (.Bbb, -1))

        #expect(NoteClass.C.shifted(by: -.P4) == (.G, -1))
        #expect(NoteClass.C.shifted(by: -.P5) == (.F, -1))
        #expect(NoteClass.C.shifted(by: -.M7) == (.Db, -1))
        #expect(NoteClass.C.shifted(by: -.P8) == (.C, -1))
        #expect(NoteClass.C.shifted(by: -.M9) == (.Bb, -2))
        #expect(NoteClass.C.shifted(by: -.P11) == (.G, -2))
        #expect(NoteClass.C.shifted(by: -.M13) == (.Eb, -2))
        #expect(NoteClass.C.shifted(by: -.P15) == (.C, -2))

        // F
        #expect(NoteClass.F.shifted(by: .P5) == (.C, 1))
        #expect(NoteClass.F.shifted(by: .d5) == (.Cb, 1))
    }

    @Test("Shifted - & + ")
    func testShiftedC() {

        #expect(NoteClass.C - .P1 == .C)
        #expect(NoteClass.C + .P1 == .C)

        #expect(NoteClass.C - .M2 == .Bb)
        #expect(NoteClass.C + .M2 == .D)

        #expect(NoteClass.C - .m2 == .B)
        #expect(NoteClass.C + .m2 == .Db)

        #expect(NoteClass.C - .d2 == .Bs)
        #expect(NoteClass.C + .d2 == .Dbb)

        #expect(NoteClass.C + .P5 == .G)
        #expect(NoteClass.C - .P5 == .F)

        #expect(NoteClass.C - -.P5 == .G)

        #expect(NoteClass.C + .M9 == .D)
        #expect(NoteClass.C - .M9 == .Bb)
        #expect(NoteClass.C - -.M9 == .D)

    }

}
