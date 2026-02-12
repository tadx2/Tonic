import Testing

@testable import Tonic

@Suite("ModalScale Tests")
struct ModalScaleTests {

    @Test("get Note")
    func testGetNote() {
        
        
        var modalScale = ModalScale( .C4, mode: ModeTypeMain.majorNatural.mode )
        
        #expect( Note.C4 == modalScale.getNote( scaleClass: 1 ))
        #expect( Note.D4 == modalScale.getNote( scaleClass: 2 ))
        #expect( Note.E4 == modalScale.getNote( scaleClass: 3 ))
        #expect( Note.F4 == modalScale.getNote( scaleClass: 4 ))
        #expect( Note.G4 == modalScale.getNote( scaleClass: 5 ))
        #expect( Note.A4 == modalScale.getNote( scaleClass: 6 ))
        #expect( Note.B4 == modalScale.getNote( scaleClass: 7 ))
        #expect( Note.C5 == modalScale.getNote( scaleClass: 8 ))
        
        modalScale = ModalScale( .D4, mode: ModeTypeMain.majorNatural.mode )
        
        #expect( Note.D4  == modalScale.getNote( scaleClass: 1))
        #expect( Note.E4  == modalScale.getNote( scaleClass: 2))
        #expect( Note.F4s == modalScale.getNote( scaleClass: 3))
        #expect( Note.G4  == modalScale.getNote( scaleClass: 4))
        #expect( Note.A4  == modalScale.getNote( scaleClass: 5))
        #expect( Note.B4  == modalScale.getNote( scaleClass: 6))
        #expect( Note.C5s == modalScale.getNote( scaleClass: 7))
         
        #expect( Note.D5  == modalScale.getNote( scaleClass: 8  ))
        #expect( Note.E5  == modalScale.getNote( scaleClass: 9  ))
        #expect( Note.F5s == modalScale.getNote( scaleClass: 10 ))
        #expect( Note.G5  == modalScale.getNote( scaleClass: 11 ))
        #expect( Note.A5  == modalScale.getNote( scaleClass: 12 ))
        #expect( Note.B5  == modalScale.getNote( scaleClass: 13 ))
        #expect( Note.C6s == modalScale.getNote( scaleClass: 14 ))
         
        #expect( Note.D6  == modalScale.getNote( scaleClass: 15 ))
        #expect( Note.E6  == modalScale.getNote( scaleClass: 16 ))
        #expect( Note.F6s == modalScale.getNote( scaleClass: 17 ))
        #expect( Note.G6  == modalScale.getNote( scaleClass: 18 ))
        #expect( Note.A6  == modalScale.getNote( scaleClass: 19 ))
        #expect( Note.B6  == modalScale.getNote( scaleClass: 20 ))
        #expect( Note.C7s == modalScale.getNote( scaleClass: 21 ))
        
        modalScale = ModalScale( .B3b, mode: ModeTypeMain.majorNatural.mode )
        
        #expect( Note.B3b == modalScale.getNote( scaleClass: 1 ))
        #expect( Note.C4  == modalScale.getNote( scaleClass: 2 ))
        #expect( Note.D4  == modalScale.getNote( scaleClass: 3 ))
        #expect( Note.E4b == modalScale.getNote( scaleClass: 4 ))
        #expect( Note.F4  == modalScale.getNote( scaleClass: 5 ))
        #expect( Note.G4  == modalScale.getNote( scaleClass: 6 ))
        #expect( Note.A4  == modalScale.getNote( scaleClass: 7 ))
         
        #expect( Note.B4b == modalScale.getNote( scaleClass: 8  ))
        #expect( Note.C5  == modalScale.getNote( scaleClass: 9  ))
        #expect( Note.D5  == modalScale.getNote( scaleClass: 10 ))
        #expect( Note.E5b == modalScale.getNote( scaleClass: 11 ))
        #expect( Note.F5  == modalScale.getNote( scaleClass: 12 ))
        #expect( Note.G5  == modalScale.getNote( scaleClass: 13 ))
        #expect( Note.A5  == modalScale.getNote( scaleClass: 14 ))
         
        #expect( Note.B5b == modalScale.getNote( scaleClass: 15 ))
        #expect( Note.C6  == modalScale.getNote( scaleClass: 16 ))
        #expect( Note.D6  == modalScale.getNote( scaleClass: 17 ))
        #expect( Note.E6b == modalScale.getNote( scaleClass: 18 ))
        #expect( Note.F6  == modalScale.getNote( scaleClass: 19 ))
        #expect( Note.G6  == modalScale.getNote( scaleClass: 20 ))
        #expect( Note.A6  == modalScale.getNote( scaleClass: 21 ))
        
        
    }
    
    @Test("get Interval Sequence")
    func testIntervalSequence(){
        
        let modalScale = ModalScale(.C4, mode: ModeTypeMain.minorNatural.mode)
        
        print(modalScale.getIntervalsSequence( from: 1, count: 7).description)
    }
    
}
