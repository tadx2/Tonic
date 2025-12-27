// //
// //  Scale.swift
// //  FantaChord
// //
// //  Created by 小汤汤 on 2025/6/4.
// //

// import Foundation

// typealias ScaleIndex = Int // ScaleIndex 为几音. 比如 C大调的第三个音, ScaleIndex == 3

// struct Scale:Equatable{
    
//     let scaleType:ScaleType // 调式
    
//     let key:Note
    
//     /// 获取一组音阶,这里的range为这个音阶的几音到几音的意思
//     /// TODO delete, 方法准备废弃
//     func getScaleNoteByRange(by indexRange: ClosedRange<Int>) -> [Note] {
//         indexRange.compactMap { index in
//             getScaleNote(by: index)
//         }
//     }
    
//     /// 获取音阶构成音
//     /// 最标准的办法, 获取到 自然大调scale下的note
//     /// 例: C大调的 第一个音：getScaleNote(by:1) 返回一个note.
//     /// Note? 返回值是可选的原因是, 有可能因为index 问题, 获取不到 Note
//     /// diffPlus 是半音差
//     func getScaleNote(by scaleIndex: ScaleIndex, diffPlus:Int = 0, isFromKeyOctave:Bool = true) -> Note?{
//         /// 判断是否要从keyNote开始
//         /// 如果不是从keyNote开始, 就要从键盘最左边开始, 键盘最左边的octave 是 -1, Pitch 是从0开始, 并且不会被用户看到Pitch 1-12不会被用户看到.
//         var key = key
//         if isFromKeyOctave == false {key.octave = -1}
        
//         /// TODO 考虑-1的情况? 也就是向下数?
//         if scaleIndex<1{ return nil }// index 必须大于1.
        
//         /// 寻找音阶音数, 本质是建立在自然大调音阶上的. 这个逻辑不能变, 不能用其他调的关系!
//         /// 数组中的数字,皆为 与根音的半音数关系
//         let majScale =  [0,2,4,5,7,9,11]

//         /// **setp1** 获取target note 的标准位置  (对应相同音名的白键位置)
//         /// 从一个note开始, 往下数, 第N个音, 的音名, 一定是依据标准的音名顺序往下数. 规则不能变.
//         /// 例: Db 大调, 第2个音, 一定是 E 为Letter的音符.
//         /// 例如: E大调, 第9个音,一定是 F 为Letter的音符. 但是, 因为超过了一个八度. 所以, 要加上octaveDelta
//         /// 通俗理解: 把原本的note(key -> root note), 当作就是在白键上的音, 从 白键 找 白键
//         ///
//         let letters = ["C", "D", "E", "F", "G", "A", "B"] // 位置轮盘
//         /// root note(key) 在轮盘上的 的位置
//         let startIndex = letters.firstIndex(of: key.letter.rawValue)! // 因为Letter一定在轮盘里面, 所以可以强制解包
//         let targetIndex = (startIndex + (scaleIndex - 1)) % 7 // 轮盘往下数,数了几个
//         let octaveDelta = (startIndex + (scaleIndex - 1)) / 7 // 轮盘往下数,数了几圈
//         let targetLetter = letters[targetIndex] // 轮盘往下数,数了到第几个字母
//         /// targe note 在键盘上的 标准 pitch
//         /// 根据Letter转 target note
//         /// target note 代表了标准位置, 就应该在白键上, note 不能有 accidential.
//         let targetStandardPitch = Note(letter: Letter(rawValue: targetLetter)!,octave: key.octave + octaveDelta).pitch
        
//         /// **setp2** rootNote与target pitch 距离
//         /// 也就是按照自然大调音阶, 全全半, 全全全半的关系,要向下数几个pitch
//         let pitchRelative = majScale[(scaleIndex - 1) % 7]
//         let pitchOctaveDelta = (scaleIndex - 1) / 7
//         /// targe note 实际在键盘上的pitch
//         /// 第几个音, 实际就是向下数了 pitchRelative + pitchOctaveDelta * 12  个pitch
//         let targetRealPitch = pitchRelative + pitchOctaveDelta * 12 + key.pitch
        
//         /// **setp3** diff
//         /// 实际和标准位置差了多少个pich, 这个pitch最后就是accidentialCount
//         /// diffPlus 可以理解为, 如果我要找 大调音阶的第 1b个音, 就是找( index=1, diffPlus = -1) .如果我要找 大调音阶的第 6#个音, 就是找( index=6, diffPlus = 1)
//         let diff = targetRealPitch - targetStandardPitch + diffPlus
        
//         /// 返回的note, 为目标letter确保音名正确.
//         return Note(letter: Letter(rawValue: targetLetter)!,accidentialCount: diff, octave: key.octave + octaveDelta)
//     }
    
    
//     /// 根据scale type 获取到范围内的 note
//     /// type 只是一个模板, 要把这个模板扩大化, 扩大的方式可以是,先获取一组标准的note ,再扩大
//     /// 例: octaveRange = -1...8 , 获取到这个音阶的全pitch
//     func getScaleNoteByType(octaveRange:ClosedRange<Int> = -1...8, isFromKeyOctave:Bool) -> [Note]{
        
//         // 根据 scale type 生成的 note范围, 在哪个 octave 范围里面
//         // 考虑 range = -1...8 的情况, key 在 8
//         var octaveRange = octaveRange // 默认是全键盘 再看isFromKeyOctave
//         if isFromKeyOctave {octaveRange = key.octave...octaveRange.upperBound}
        
//         /// 扩大typeCode
//         /// typeCode = [1, 3b, 4b, 5b] 这样的typecode需要根据 octabe扩大化
//         /// [1, 3b, 4b, 5b] 这样的数组[String], 如果给一个N,
//         /// N == 1 的情况下, 返回 [1, 3b, 4b, 5b]  不变
//         /// N== 2 的情况下, 返回[1, 3b, 4b, 5b, 8, 10b, 11b, 12b], 也就是所有数组的数组部分, 加上N*1, 再拼接上
//         /// 以此类推
//         let octaveCount = octaveRange.count
//         var result:[Note] = []
//         for i in 0..<octaveCount{
//             let offset = i * 7
            
//             // 遍历每一个dna
//             for dna in scaleType.typeDNA{

//                 /// 获取dna对应的 diff.
//                 let count_flat = dna.filter { $0 == "b" }.count
//                 let count_sharp = dna.filter { $0 == "#" }.count
//                 let diff = count_flat * -1 + count_sharp
                
//                 /// 如果 dna里面没有数字, 就跳过,但是正常情况下, 只要 原始数据是对的, 就没有问题, guard 的作用主要是为了解包
//                 guard let digits = Int(dna.filter { $0.isNumber }) else{continue}
                
//                 /// 获取到对应的scalenote, 这里解包的目的是跳过不可能的digits, 可能存在 -1的情况
//                 guard let scaleNote = getScaleNote(by: digits + offset , diffPlus: diff, isFromKeyOctave:isFromKeyOctave) else {continue}
                   
//                 result.append(scaleNote)
//             }
//         }
//         return result
//     }
    
//     /// 返回这个音阶下，有效pitch 以及对应的 note
//     func getScalePitchByType(octaveRange:ClosedRange<Int> = -1...8, isFromKeyOctave:Bool = false) -> [PitchIndex:Note]{
        
//         let notes = getScaleNoteByType(octaveRange: octaveRange, isFromKeyOctave: isFromKeyOctave)
        
//         var result:[PitchIndex:Note] = [:]
        
//         for note in notes {
//             result[note.pitch] = note
//         }
        
//         return result
//     }
    
// }



// /// 顺阶和弦
// /// Equatable: 比较值是否相等
// /// Identifiable: 识别唯一身份
// struct DiatonicChord:Equatable,Identifiable {
//     let id = UUID()
    
//     // 顺接的种类
//     enum DiatonicChordType: String, CaseIterable {
        
//         case triadChord
//         case seventhChord
        
//         case sixChord
//         case sixNinthChord
        
//         case susTwoTriadChord
//         case susFourTriadChord
//         case susTwoSeventhChord
//         case susFourSeventhChord
        
//         case ninthChord
//         case eleventhChord
//         case thirteenthChord
        
       
        

//         var degrees: [ChordDegrees] {
//             switch self {
//             case .triadChord:
//                 return [.root, .third, .fifth]
//             case .seventhChord:
//                 return [.root, .third, .fifth,.seventh]
//             case .ninthChord:
//                 return [.root, .third, .fifth,.seventh, .ninth]
//             case .eleventhChord:
//                 return [.root, .third, .fifth,.seventh, .ninth, .eleventh]
//             case .thirteenthChord:
//                 return [.root, .third, .fifth,.seventh, .ninth, .eleventh, .thirteenth]
//             case .sixChord:
//                 return [.root, .third, .fifth,.sixth]
//             case .sixNinthChord:
//                 return [.root, .third, .fifth,.sixth,.ninth]
//             case .susTwoTriadChord:
//                 return [.root, .second, .fifth]
//             case .susFourTriadChord:
//                 return [.root, .fourth, .fifth]
//             case .susTwoSeventhChord:
//                 return [.root, .second, .fifth, .seventh]  
//             case .susFourSeventhChord:
//                 return [.root, .fourth, .fifth, .seventh]
//             }
            
//         }
        
//         var displayName: String {
//               switch self {
//               case .triadChord: return "diatonic_chord_triad"
//               case .seventhChord: return "diatonic_chord_seventh"
//               case .ninthChord: return "diatonic_chord_ninth"
//               case .eleventhChord: return "diatonic_chord_eleventh"
//               case .thirteenthChord: return "diatonic_chord_thirteenth"
//               case .sixChord: return "diatonic_chord_sixth"
//               case .sixNinthChord: return "diatonic_chord_sixth_ninth"
//               case .susTwoTriadChord: return "diatonic_chord_susTwoTriad"
//               case .susFourTriadChord: return "diatonic_chord_susFourTriad"
//               case .susTwoSeventhChord: return "diatonic_chord_susTwoSeventh"
//               case .susFourSeventhChord: return "diatonic_chord_susFourSeventh"
//               }
//           }
//     }
    
//     // 当前顺接和弦所属的音阶
//     let scale:Scale

//     // 顺接和弦种类，也就是会用到音阶上的几音
//     let diatonicType: DiatonicChord.DiatonicChordType
    
//     // 顺接和弦 是从这个音阶上的几级
//     let diatonicDegree:ScaleDegree
    
    
//     /// 根据diatonicType来获取到对应的note. 此note可以组成一个 chord
//     private var notes:[Note]{
//         /// 1. 获取到所有音阶上的note, 要一直获取到键盘的末尾.
//         /// 例: C大调自然音阶, 这里可以获取到, 所有键盘上白键 对应的 Note, 并且保证 音名是对的.
//         /// 默认全键盘, octave = -1...8
//         /// isFromKeyOctave = false 表示, 从keynote开始. 要从keynote开始,因为, 因为
//         let allPossibleNotes:[Note] = scale.getScaleNoteByType(isFromKeyOctave: true)
        
//         /// 2. 获取到所有的note后, 开始按照 diatonicType 来寻找特定的note
//         /// 找到开始音, 也就是 diatonicDegree(是ScaleDegree) 是这个音阶开始音的位置 就是 diatonicDegree(ScaleDegree).rawValue - 1
//         /// 例: C自然大调的音阶, 第二级, diatonicDegree == .ii. 那么这个note, 在 allPossibleNotes  这个list 中的 第二个位置, index = 1 也就是 ==  diatonicDegree.rawValue - 1.
//         /// 这里要注意, diatonicDegree的rawValue是从1开始数的.
//         let startIndex:Int = diatonicDegree.rawValue - 1
        
//         /// 3. 从startIndex开始的位置向下寻找 diatonicType 对应的音.
//         /// 例:diatonicType = [1, 3, 5] 也就是, 从 allPossibleNotes 中的 startIndex 开始找 第1个音
//         return diatonicType.degrees.compactMap { degree in
//             let targetIndex = startIndex + degree.inScales - 1
//             /// 这里面考虑的是数组越界问题. 如果 targetIndex超过了 allPossibleNotes的范围, 那么 这个note不能被添加进去
//             return allPossibleNotes.indices.contains(targetIndex) ? allPossibleNotes[targetIndex] : nil // compactMap过滤了 返回结果 是 nil 的情况
//         }
//     }
    
    
//     /// 顺接和弦具体信息
//     var chordDetail:ChordDetail{
        
//         let rootNote:Note = notes[0]
//         var nomolizedDNA:[Int] = [0, 2, 4, 5, 7, 9, 11, 14, 17, 21]
//         var nomolizedInUsedDegree = [false,false,false,false,false,false,false,false, false,false]
        
        
//         // 把所有的这个degree下的值转为rawDNA
//         for (note, degree) in zip(notes, diatonicType.degrees) {
//             nomolizedDNA[degree.chordDNAIndex] = note.pitch - rootNote.pitch
//             nomolizedInUsedDegree[degree.chordDNAIndex] = true
//         }
        
//         let rawDNA: [Int?] = zip(nomolizedDNA, nomolizedInUsedDegree).map { (value, isUsed) in
//             isUsed ? value : nil
//         }
        
//         /// 根据rawDNA和rootNote生成一个chord再转化为ChordDetail
//         let chord = Chord(rootNote: rootNote, rawDNA: rawDNA)
        
//         /// 无论合法还是不合法，这个chord都应该被返回
//         /// 顺阶顺阶，就是顺着音阶，无论这个和弦是否在ChordBasicInfo里面，都应该成立
//         /// 区分是不是一个合法Chord也就是这个和弦的基础信息在不在ChordBasicInfo里面，要看 chordDetail.isChordInBasicInfo是不是true
//         return ChordDetail(chord: chord)
//     }
    
//     /// TODO 把这个方法放到chordDetail里面
//     var noteNames:String{
//         let noteNames = notes.map{
//             $0.formatNoteName
//         }
//         return noteNames.joined(separator: "-")
//     }
    
// }

// enum ScaleType:String, CaseIterable,Equatable{
//     case NaturalMajor
//     case NaturalMinor
//     case HarmonicMinor
//     case MelodicMinor
//     case Ionian //伊奥尼亚 do
//     case Dorian // 多利亚 re
//     case Phrygian // 弗里吉亚 mi
//     case Lydian // 利地亚 fa
//     case Mixolydian // 混合利地亚 so
//     case Aeolian // 爱奥利亚 la
//     case Locrian // 洛克利亚 si
//     case Blues
   

//     // 不同的音阶, 还是以自然大调音阶为基础,创建的.
//     // 也可以说是与自然大调的音级差异
//     var typeDNA: [String] {
//          switch self {
//          case .NaturalMajor, .Ionian:
//              return ["1", "2", "3", "4", "5", "6", "7"]
//          case .Dorian:
//              return ["1", "2", "3b", "4", "5", "6", "7b"]
//          case .Phrygian:
//              return ["1", "2b", "3b", "4", "5", "6b", "7b"]
//          case .Lydian:
//              return ["1", "2", "3", "4#", "5", "6", "7"]
//          case .Mixolydian:
//              return ["1", "2", "3", "4", "5", "6", "7b"]

//          case .NaturalMinor, .Aeolian:
//              return ["1", "2", "3b", "4", "5", "6b", "7b"]
//          case .HarmonicMinor:
//              return ["1", "2", "3b", "4", "5", "6b", "7"]
//          case .MelodicMinor:
//              return ["1", "2", "3b", "4", "5", "6", "7"]
//          case .Locrian:
//              return ["1", "2b", "3b", "4", "5b", "6b", "7b"]
//          case .Blues:
//              // 常见六音布鲁斯音阶
//              return ["1", "3b", "4", "4#", "5", "7b"]
//          }
         
//      }
    
//     /// 它们都属于“七声音阶”，是 diatonic（全音阶的），因此你应该包括所有这些调式。
//     /// .Blues 并不是严格意义上的 diatonic scale（它是六声音阶，还引入了“蓝调音”，比如 #4），因此不属于该集合
    
//     static let scaleCanDiatonic: [ScaleType] = [
//         .NaturalMajor,
//         .NaturalMinor,
//         .HarmonicMinor,
//         .MelodicMinor,
//         .Ionian,
//         .Dorian,
//         .Phrygian,
//         .Lydian,
//         .Mixolydian,
//         .Aeolian,
//         .Locrian
//     ]
    
    
//     // 用来对外显示的字符串
//     var displayName: String {
//             switch self {
//             case .NaturalMajor: return "scale_type_natural_major"
//             case .NaturalMinor: return "scale_type_natural_minor"
//             case .HarmonicMinor: return "scale_type_natural_minor_harmonic"
//             case .MelodicMinor: return "scale_type_natural_minor_melodic"
//             case .Ionian: return "scale_type_ionian"
//             case .Dorian: return "scale_type_dorian"
//             case .Phrygian: return "scale_type_phrygian"
//             case .Lydian: return "scale_type_lydian"
//             case .Mixolydian: return "scale_type_mixolydian"
//             case .Aeolian: return "scale_type_aeolian"
//             case .Locrian: return "scale_type_locrian"
//             case .Blues: return "scale_type_blues"
//             }
//         }
// }

// /// 音级
// /// 是指音阶中每一个音的位置编号.
// /// 是指一个音在音阶（Scale）中所处的“级数(degree)”。用来表示音在调式（key）中的 **相对位置**
// enum ScaleDegree:Int{ // 声明 Int: 会自动从 0 开始为每个 case 分配 rawValue
//     /// v 代表 5, x 代表 10.
//     /// 默认音阶, 只有 7个音, 最典型的就是自然大调.
//     /// 显式地给第一个 case 设置值, enum 从 1 开始为每个 case 分配 rawValue
//     case i=1, ii, iii, iv, v, vi, vii
    
//     /// 显示名称（小写罗马数字）
//     var displayName: String {
//         switch self {
//         case .i: return "I"
//         case .ii: return "II"
//         case .iii: return "III"
//         case .iv: return "IV"
//         case .v: return "V"
//         case .vi: return "VI"
//         case .vii: return "VII"
//         }
//     }
    
//     static let defaultDiatonicChord: [ScaleDegree] = [.i, .ii, .iii, .iv, .v, .vi,.vii]
    
// //    /// 运算符重载：模7加法
// //    static func + (lhs: ScaleDegree, rhs: ScaleDegree) -> ScaleDegree {
// //        let lhsIndex = lhs.rawValue - 1 // 转为 0 ~ 6
// //        let rhsIndex = rhs.rawValue - 1
// //        let resultIndex = (lhsIndex + rhsIndex) % 7
// //        return ScaleDegree.defaultDiatonicChord[resultIndex]
// //    }
// //    
// //    /// 运算符重载：模7减法
// //    static func - (lhs: ScaleDegree, rhs: ScaleDegree) -> ScaleDegree {
// //        let lhsIndex = lhs.rawValue - 1
// //        let rhsIndex = rhs.rawValue - 1
// //        let resultIndex = (lhsIndex - rhsIndex + 7) % 7
// //        return ScaleDegree.defaultDiatonicChord[resultIndex]
// //    }
// }
