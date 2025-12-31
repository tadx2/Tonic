import Foundation

public struct ChordRaw: Sendable {
    public var rootNote: Note = Note()
    public var dnaRaw: [Int?] = [0,nil,4,nil,7,nil,nil,nil,nil,nil] // 默认一个大三和弦

    public init(rootNote: Note = Note(), dnaRaw: [Int?] = [0,nil,4,nil,7,nil,nil,nil,nil,nil]) {
        self.rootNote = rootNote
        self.dnaRaw = dnaRaw
    }
}

// Pitches
extension ChordRaw{
    
    /// 构成音
    /// 从 raw: [Int?] 中移除所有的 nil，使用 compactMap，丢弃nil并解包非nil的值（原始值）
    public var inUsedPitches: [PitchInt] {
        let inUsedDNA = self.dnaRaw.compactMap { $0 }
        return inUsedDNA.map { PitchInt($0) + rootNote.pitch }
    }
    
    /// 构成音(Set)
    public var inUsedPitchesSet: Set<PitchInt> {
        Set(inUsedPitches)
    }
    
    /// 音级标准位置差
    /// 传入的是级数据，返回的是int差值。例如，3音的标准位置是 4，但是，如果这个和弦的3音是被修改过的。修改为了小三度，那么这个值就是-1
    func diffFromStandardPitch(by chordDegreeInt: ChordDegreeInt) -> PitchInt? {
        guard let index = chordDegreeInt.chordDnaRawIndex else { return nil}
        guard let thisDna = dnaRaw[index]  else { return nil}
        let thisPitch = thisDna + self.rootNote.pitch
        let thisStandardPitch = chordDegreeInt.semitonesFormRootNoteInNaturalMajor + self.rootNote.pitch
        return  thisPitch - thisStandardPitch
    }
}

// ChordDegree
extension ChordRaw {
    
    public var isUsedDegree: [Bool] {
        dnaRaw.map { $0 != nil }
    }
    
    public var inUsedDegreeInt: [ChordDegreeInt] {
        // 把 dnaRaw 中 非nil元素的index组成一个数组传出来。但是要注意：
        // Index 如果是 在 0-6 传出来是 1-7
        // Index 如果是 7 传出来是 9，如果是 8 传出来的是 11， 如果是 9 传出来是 13
        dnaRaw.enumerated()
            .compactMap { index, value in
                value == nil ? nil : index
            }
            .map { index in
                switch index {
                case 0...6:
                    return ChordDegreeInt(index + 1)
                case 7:
                    return 9
                case 8:
                    return 11
                case 9:
                    return 13
                default:
                    fatalError("Unexpected index \(index)")
                }
            }
    }

}

// Interval
extension ChordRaw {
    
    // 查询度数对应的音 距离根音的音程
    public func getInterval(chordDegreeInt: ChordDegreeInt) -> Interval? {
        
        // 度数对应的Dna坐标
        guard let chordDnaRawIndex = chordDegreeInt.chordDnaRawIndex else { return nil }

        // Dna坐标对应的 半音数
        guard let semitones = dnaRaw[chordDnaRawIndex] else { return nil }
        
        return Interval(degree: chordDegreeInt % 14, semitones: semitones)
    }

    /// 获取和弦构成音到音程的映射字典
    /// - Returns: 字典，键为构成音的音高 (PitchInt)，值为该音相对于根音的音程 (Interval)
    public func getPitchIntervalDict() -> [ PitchInt: Interval ] {
        buildPitchDict { getInterval(chordDegreeInt: $0) }
    }
}

// info
extension ChordRaw {
    public var basicInfo: ChordBasicInfo? {
        let basicInfoDna = Array(self.dnaRaw.prefix(7))
        return ChordBasicInfoList.first { item in
            item.DNA == basicInfoDna
        }
    }
}

// NoteName
extension ChordRaw {
    
    // 和弦音名
    public func getNoteName(by degree: ChordDegreeInt) -> String? {
        return getNote(by: degree)?.name
    }

    public func getPitchNoteNameDict() -> [ PitchInt: String ] {
        getPitchNoteDict().compactMapValues { $0.name }
    }

    // 和弦音名—简谱音名
    func getNumberNoteName(by degree: ChordDegreeInt) -> String? {
        guard let diff = diffFromStandardPitch(by: degree) else { return nil}

        let prefix = Accidental(diff).notation

        return "\(degree)\(prefix)"
    }
    
    public func getPitchNumberNoteNameDict() -> [ PitchInt: String ] {
        buildPitchDict { getNumberNoteName(by: $0) }
    }
}

// Note
extension ChordRaw {

    public func getNote(by degree: ChordDegreeInt) -> Note? {
        guard let diff = diffFromStandardPitch(by: degree) else { return nil}
        let scaleNote = Scale(rootNote: self.rootNote, type: .naturalMajor).note(on: degree, diffPlus: diff)
        return scaleNote
    }

    public func getPitchNoteDict() -> [ PitchInt: Note ] {
        buildPitchDict { getNote(by: $0) }
    }
}

extension ChordRaw {
    /// 通用辅助函数：构建音高到任意类型的映射字典
    /// - Parameter transform: 将 ChordDegreeInt 转换为目标类型的闭包
    /// - Returns: 音高到目标类型的映射字典
    private func buildPitchDict<T>(transform: (ChordDegreeInt) -> T?) -> [PitchInt: T] {
        let pitches = inUsedPitches
        let values = inUsedDegreeInt.map(transform)

        var dict: [PitchInt: T] = [:]
        for (pitch, value) in zip(pitches, values) {
            if let value {
                dict[pitch] = value
            }
        }
        return dict
    }
}
