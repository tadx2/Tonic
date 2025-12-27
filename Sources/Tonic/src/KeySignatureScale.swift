//
//  KeySignatureScale.swift
//  FantaChord
//
//  Created by 小汤汤 on 2025/9/16.
//

import Foundation

/// 以KeySignature为基础的音阶，所有音阶只存在于KeySignature中

struct KeySignatureScale {
    
    let keySignature: KeySignature
    let octaveRange: ClosedRange<Int>// 从哪个八度开始计算这个音阶
    
    // 基础音阶7级构成 <- octave = 0
    let scaleNoteBasic: [Note]

    init(keySignature: KeySignature = .cMajor, octaveRange: ClosedRange<Int> = 1...7) {
        self.keySignature = keySignature
        self.octaveRange = octaveRange
        
        // 这个大调的基本构成音阶，从octave = 0开始构建7个音
        self.scaleNoteBasic = KeySignatureScale.basicScaleDegree.map{
            KeySignatureScale.KeySignatureScaleNote(by: $0, in: keySignature, on: 0)
        }
    }
    
    // 指定 octave 音阶7级构成
    var scaleNoteBasicOctaveRange: [Note]{ // <- octave =  octaveRange
        var noteList: [Note] = []
        for octave in octaveRange{
            
            let newNotes = scaleNoteBasic.map { note in
                Note(letter: note.letter,
                     accidental: note.accidental,
                     octave: octave)
            }
            noteList += newNotes
        }
        return noteList
    }
    
    // 所有 octave 在键盘上的 音阶7级构成
    var scaleNoteOnKeyBoard: [Note]{ // <- octave =  1...7
        var noteList: [Note] = []
        for octave in 0...8{
            
            let newNotes = scaleNoteBasic.compactMap { note -> Note? in
                let note = Note(
                    letter: note.letter,
                    accidental: note.accidental,
                    octave: octave
                )
                return (21 <= note.pitch && note.pitch <= 108) ? note : nil
            }
            noteList += newNotes
        }
        return noteList
    }
}

extension KeySignatureScale {
    
    /// 计算一个NoteDegree对应的note
    /// C大调 一级是 C 二级是D
    static func KeySignatureScaleNote(by notedegree:NoteDegrees, in keySignature: KeySignature, on octave:Int = 0) -> Note{
        
        // 音名
        
        // 验证：
        // C大调2级 = 0 + 2 - 1 = 1 % 7 = 1 是D
        // C大调7级 = 0 + 7 - 1 = 6 % 7 = 7 是B
        // C大调8级 = 0 + 8 - 1 = 7 % 7 = 0 是C
        let resultLetterIndex = (keySignature.letter.letterIndex + notedegree.degreeCount - 1)
        let resultLetterDegree = resultLetterIndex % 7
        let finalLetter = Letter.allCases[resultLetterDegree]
        
        
        // 升降
        
        // 获取到这个letter在这个调上的本级的生降
        // 验证A
        // G大调7级 = 4 + 7 - 1 = 10 % 7 = 3 是F
        // F查表result = 1
        // 所以音名为F#
        let resultLetterAcInThisKey = keySignature.accidentalOfLetter[finalLetter] ?? 0
        
        // 获取到这个音名最后的ac，在原本的基础上，加上制定的升降
        // 验证A
        // G大调7b级 = 4 + 7 - 1 = 10 % 7 = 3 是F
        // F查表result = 1 7b级自带=-1  总合 0
        // 所以音名为F
        let finalAcInThisKey = resultLetterAcInThisKey + notedegree.degreeAccidentalCount
        
        // 八度
        // 本次音名的升降有没有跨越 Letter.basicLetterList 这张表格
        // 验证：
        // A大调3级 = 5 + 3 - 1 = 7 / 7 = 1 跨越了一个8度
        // A大调2级 = 5 + 2 - 1 = 6 / 7 = 0 没有一个8度
        let finalOctave = resultLetterIndex / 7 + octave
        
        return Note(letter: finalLetter, accidental: finalAcInThisKey, octave: finalOctave)
    }
    
    
    // 写出来是为了让你知道，一个音阶的7个音，就是由这个7级组成的
    static let basicScaleDegree = [
        NoteDegrees(degreeCount: 1, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 2, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 3, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 4, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 4, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 5, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 6, degreeAccidentalCount: 0),
        NoteDegrees(degreeCount: 7, degreeAccidentalCount: 0),
    ]
}

// Prediction 预测
extension KeySignatureScale{
    
    /// pitch 音名 称呼（范围两边double）
    /// Pitch Possible Note 指的是 一个pitch 对应的note音名，可能需要根据左右来称呼
    /// 例如： Pitch = 61，不知道这个音名，就应该用 baseON左右来称呼
    /// baseOnLeft 用C#来称呼. baseOnRight 用Db来称呼. baseOnLeftDouble 用B## 来称呼
    typealias PitchNoteBaseOnDoubleTwoSide =  (baseOnLeft: Note?, baseOnRight: Note?, baseOnLeftDouble: Note? , baseOnRightDouble: Note?)
    
    /// pitch 预测值（范围两边double）
    /// isOnKeyScale 是否在这个调内音阶上
    /// pitchPossibleNote 如果isOnKeyScale为false， 返回所有的音名称呼
    /// maximumPossibilityNote 如果pitchPossibleNote存在，最有可能的音名称呼
    typealias PredictionNoteBaseOnDoubleTwoSide = ( isOnKeyScale: Bool, pitchPossibleNote: PitchNoteBaseOnDoubleTwoSide?, maximumPossibilityNote: Note? )
    
    /// pitch 音名 全预测
    func pitchNotePrediction(pitchInt: Int) -> PredictionNoteBaseOnDoubleTwoSide{
        
        let pitchOnKeyScaleResult = pitchNoteIsOnThisScale(pitchInt: pitchInt)
        
        if pitchOnKeyScaleResult.isOn { // note找到的情况
            return (isOnKeyScale: true, pitchPossibleNote: nil, maximumPossibilityNote: pitchOnKeyScaleResult.note)
        }else{
            
            var resultNotePossible: PitchNoteBaseOnDoubleTwoSide = (baseOnLeft: nil, baseOnRight: nil, baseOnLeftDouble: nil , baseOnRightDouble: nil)
            
            var maximumPossibilityNote: Note? = nil
            
            // 左边一个音
            let leftPitchSituation = pitchNoteIsOnThisScale(pitchInt: pitchInt - 1)
            if leftPitchSituation.isOn {
                let leftNote = leftPitchSituation.note! // 为true的时候一定存在 note！
                let thisNoteAc = leftNote.accidental + 1
                let thisNote = Note(letter: leftNote.letter, accidental: thisNoteAc, octave: leftNote.octave)
                resultNotePossible.baseOnLeft = thisNote
                
                if thisNote.accidental == 0 { maximumPossibilityNote = thisNote }
            }

            // 右边一个音
            let rightPitchSituation = pitchNoteIsOnThisScale(pitchInt: pitchInt + 1)
            if rightPitchSituation.isOn {
                let rightNote = rightPitchSituation.note! // 为true的时候一定存在 note！
                let thisNoteAc = rightNote.accidental - 1
                let thisNote = Note(letter: rightNote.letter, accidental: thisNoteAc, octave: rightNote.octave)
                resultNotePossible.baseOnRight = thisNote
                
                if thisNote.accidental == 0 { maximumPossibilityNote = thisNote }
            }

            // 左边第二个音
            let leftPitchSituationDouble = pitchNoteIsOnThisScale(pitchInt: pitchInt - 2)
            if leftPitchSituationDouble.isOn {
                let leftNoteDouble = leftPitchSituationDouble.note! // 为true的时候一定存在 note！
                let thisNoteAc = leftNoteDouble.accidental + 2
                let thisNote = Note(letter: leftNoteDouble.letter, accidental: thisNoteAc, octave: leftNoteDouble.octave)
                resultNotePossible.baseOnLeftDouble = thisNote
                
                if thisNote.accidental == 0 { maximumPossibilityNote = thisNote }
            }
            
            // 右边第二个音
            let rightPitchSituationDouble = pitchNoteIsOnThisScale(pitchInt: pitchInt + 2)
            if rightPitchSituationDouble.isOn {
                let rightNoteDouble = rightPitchSituationDouble.note! // 为true的时候一定存在 note！
                let thisNoteAc = rightNoteDouble.accidental - 2
                let thisNote = Note(letter: rightNoteDouble.letter, accidental: thisNoteAc, octave: rightNoteDouble.octave)
                resultNotePossible.baseOnRightDouble = thisNote
                
                if thisNote.accidental == 0 { maximumPossibilityNote = thisNote }
            }
            
            /// 已经对maximumPossibilityNote进行了初步的判断，如果是accidental = 0的情况，已经设置为了此最可能性音名
            /// 如果出来nil的情况，就是这个音名 满足了以下的条件 1. 不在调上 2. 没有 不带来升降号的音名来表示这个pitch
            /// 现在设置一个规则来判断这个音名：
            /// 1. 如果这个调是小调，优先使用右边第一个音，也就是带降号的音名来表示这个音
            /// 2. 如果这个调是大调，优先使用左边第一个音，也就是带升号的音名来表示这个音
            if maximumPossibilityNote == nil, keySignature.type == .minor {
                maximumPossibilityNote = resultNotePossible.baseOnRight
            }else if  maximumPossibilityNote == nil, keySignature.type == .major{
                maximumPossibilityNote = resultNotePossible.baseOnLeft
            }

            return (isOnKeyScale: false, pitchPossibleNote: resultNotePossible, maximumPossibilityNote: maximumPossibilityNote )
        }
    }
    
    /// 判断pitch是否在调号音阶上
    func pitchNoteIsOnThisScale(pitchInt: Int) -> (isOn:Bool, note: Note?) {
        let isOn = scaleNoteOnKeyBoard.contains { $0.pitch == pitchInt }
        let note = scaleNoteOnKeyBoard.first { $0.pitch == pitchInt }
        return (isOn: isOn, note: note)
    }
}
