// //
// //  BaseChord.swift
// //  FantaChord
// //
// //  Created by 小汤汤 on 2025/9/20.
// //

// /// 一个和弦，首个音不是原 RootNote 也没有和 RootNote 一致的音名，但是Base Note 中的note在和弦的构成音可能性中
// struct BaseChord{
//     let chord: Chord
//     let base: Note
    
//     init(chord: Chord, base: Note) {
//         self.chord = chord
//         self.base = base
//     }
    
//     // pitches 是一组用户输入
//     init?(pitchRn: Int, chord: Chord) {
        
//         let chordDetail = ChordDetail(chord: chord)
//         let firstPitchOnKeyboard = pitchRn
        
// //        print(firstPitchOnKeyboard)
        
//         /// 和弦的第一个音，只是代码上的防御，实际情况中，不可能是一个optional
//         guard let firstNoteOfChord = chordDetail.inUsedNote.first else{ return nil}
        
// //        print(firstNoteOfChord.formatNoteNameWithOctave)
        
//         /// 防御确保 rnPitch 与 chord 的firstPitch不相等
//         /// 输入的pitchRn 与 chord 的firtst pitch 如果一致, 返回一个nil，用户收到即代表非base的情况，此baseChord不成立
//         guard firstPitchOnKeyboard != firstNoteOfChord.pitch else {return nil}
        
// //        print(firstPitchOnKeyboard != firstNoteOfChord.pitch)
        
//         /// 防御确保 rnPitch 在 chord 的构成音可能性中
//         /// 如果不在可能性中，返回一个nil，用户收到即代表非base的情况，此baseChord不成立
//         guard let baseNote = chordDetail.getKeyboardChordNote(by: firstPitchOnKeyboard) else{return nil}
        
// //        print(baseNote.formatNoteNameWithOctave)
        
//         /// 考虑到一种，也可能出现的情况
//         /// 48  + CM( 60 64 67 ) 这个和弦中， 符合上述的防御，但是因为48这个音也是C, 所以不是一个 BaseChord
// //        print(firstNoteOfChord != baseNote)
//         guard firstNoteOfChord != baseNote else { return nil }
        
//         self.chord = chord
//         self.base = baseNote
//     }
    
// }

