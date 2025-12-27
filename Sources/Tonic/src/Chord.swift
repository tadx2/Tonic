//import Foundation
//
//enum ChordEditBasicMode{
//    case add // 添加模式，右上角的按钮为添加
//    case edit // 编辑模式，右上角的按钮为保存
//    case play // 游乐模式，右上角没有按钮
//}
//
//
//
//struct ChordDetail: Identifiable, Equatable{
//    
//    let id = UUID().uuidString
//    
//    // 此ChordDetail为最核心的变量,这个类的目的就是用来解释chord的数据
//    // !! Warning !! 在这个变量中不能给这个chord赋值
//    let chord:Chord
//
//    // 判断
//    // 判断两个chord是否 完全一样, 还需要把, TODO voicingDNA放到里面
//    static func == (lhs: ChordDetail, rhs: ChordDetail) -> Bool {
//        return lhs.chord.rootNote == rhs.chord.rootNote &&
//        lhs.chord.rawDNA == rhs.chord.rawDNA
//    }
//    
//    var rootNote: Note{
//        chord.rootNote
//    }
//    
//    // Pitches
//    var rootPitch:Int{
//        chord.rootNote.pitch
//    }
//    
//    
//    
//
//    // 音级标准位置差
//    ///传入的是级数据，返回的是int差值。例如，3音的标准位置是 4，但是，这个和弦的3音是被修改过的。修改为了小三度，那么这个值就是-1
//    private func diffFromStandardPitch(by degree:ChordDegrees) -> Int{
//        let thisPitch = normalizedPitches[degree.chordDNAIndex]
//        let thisStandardPitch = degree.pitchNormalPosion + rootPitch
//        
////        print("rootPitch:\(rootPitch.description) thisPitch: \(thisPitch) thisStandardPitch:\(thisStandardPitch)")
//        return  thisPitch - thisStandardPitch
//    }
//    
//    
//
//    /// ⚠️ 这个值是最重要的值，概念必须明白！！！
//    /// 一般化数据，可以理解为把raw数据中的nil都统一翻译为默认值
//    /// Model Chord only have rawDNA which can translate to normalizedDNA & normalizedIsUsed which value don't have nil
//    ///
//    // 一般化DNA值序列
//    // 如果原本的chord.rawDNA，某个音是nil，那么就用标准的位置去填充。不能让一般化DNA值序列中存在nil。
//    var normalizedDNA:[Int]{
//        let defaultValues = [0, 2, 4, 5, 7, 9, 11, 14, 17, 21]
//        return chord.rawDNA.enumerated().map { index, value in
//                value ?? defaultValues[index]
//        }
//    }
//    
//    // 一般化isUsed值序列
//    ///  return all isUsed don't have nil.
//    ///  [nil, true ,nil] -> [false, true, false]
//    var normalizedIsUsed:[Bool]{
//        chord.rawDNA.map { $0 != nil }
//    }
//    
//    // 一般化Pitch序列
//    // return all the pitches don't have nil. every normalizedDNA's item plus the rootPitch is all the pitches in this chord
//    var normalizedPitches:[Int]{
//        return normalizedDNA.map { $0 + rootPitch }
//    }
//    
//    /// inUesd化数据。可以理解为哪些音是激活的，也就是实际用到的音
//    // inUesd化Pitch
//    var inUsedPitches:[Pitch] {
//        let inUsedDNA = chord.rawDNA.compactMap { $0 } //从 raw: [Int?] 中移除所有的 nil，使用 compactMap，丢弃nil并解包非nil的值（原始值）
//        return inUsedDNA.map { Pitch($0 + rootPitch) }
//    }
//    
//    // inUesd化midiNumber // TODO
//    // 把inUsedPitches转为化midiNumber。多此一举。TODO 删除！
//    var midiNumber: [UInt8] {
//        inUsedPitches.map { UInt8($0.midiNumber) }
//    }
//    
//    // inUsed化Degree - 只有basic
//    // return inUsedDegree only basic
//    var inUsedBasicDegree:[ChordDegrees]{
//        var allDegree = inUsedDegree
//        let valuesToRemove: Set<ChordDegrees> = [.ninth, .eleventh, .thirteenth]
//        allDegree.removeAll(where: { valuesToRemove.contains($0) })
//        return allDegree
//    }
//    
//    // inUsed化Degree - 只有tension
//    // return inUsedDegree only Tension
//    var inUsedTensionDegree: [ChordDegrees] {
//        let valuesToKeep: Set<ChordDegrees> = [.ninth, .eleventh, .thirteenth]
//        return inUsedDegree.filter { valuesToKeep.contains($0) }
//    }
//
//    // 查询预存的和弦信息
//    // Info Basic
//    var basicChordInfo: ChordBasicInfo? {
//        let basicInfoDna = Array(chord.rawDNA.prefix(7))
//        return ChordBasicMap.first { item in
//            item.DNA == basicInfoDna
//        }
//    }
//    
//    // 查看chord是否在basicInfo里面，也就是这个chord是一个合法的chord
//    var isChordInBasicInfo:Bool{
//        return basicChordInfo != nil
//    }
//    
//    // 查询是否用到了几音
//    // According to degree generate:
//    func getIsInUsed(degree:ChordDegrees) -> Bool{
//        normalizedIsUsed[degree.chordDNAIndex]
//    }
//    
//    // 获取和弦pitch. 标准化. 用之前, 一定要检查 degree 为启用状态! 
//    // 查询这个音的绝对位置,通过degree. 这里返回的是, normalizedPitch, 如果这个和弦音没有启用, 返回的是这个和弦音的标准位置.
//    func getPitchByDegree(by degree:ChordDegrees) -> Pitch{
//        Pitch(normalizedPitches[degree.chordDNAIndex])
//    }
//    
//    // 查询这个音距离根音的音程
//    // interval
//    func getInterval(degree: ChordDegrees) -> Interval {
//        let semitones = normalizedDNA[degree.chordDNAIndex]
//        return Interval(semitones: semitones, degree: degree.chordDNAIndex)
//    }
//    
//
//    
//    // 音名
//    // rootNote为key，各个和弦音的音名
//    func getNoteName(by degree:ChordDegrees) -> String{
//        let key = chord.rootNote
//        let scale = Scale(scaleType: .NaturalMajor, key: key)
//        
//        let note = scale.getScaleNote(
//            by: degree.inScales,
//            diffPlus: diffFromStandardPitch(by: degree))
//        
//        let noteName = note?.formatNoteName ?? ""
//        
//        // 返回的Note有可能不存在，所以要加上一个？， 如果不存在，要返回“”，即没有这个名字
//        return noteName
//    }
//    
//    // 返回简谱音名
//    func getNumberedName(by degree:ChordDegrees) -> String{
//        degree.dispalyName + diffFromStandardPitchToString(by: degree)
//    }
//    
//    // 返回简谱音名组
//    var inUsedNumberName: [String]{
//        inUsedDegree.map{
//            $0.dispalyName + diffFromStandardPitchToString(by: $0)
//        }
//    }
//    
//    
//    
//    // Print
//    // 打印调试的时候，输出DNA字体串，0，1，3，5 。。。
//    var describeDNA:String {
//        return normalizedDNA.compactMap { $0.description }.joined(separator: ", ")
//    }
//    var describePitch:String {
//        return normalizedPitches.compactMap { $0.description }.joined(separator: ", ")
//    }
//    // 打印调试的时候，输出DNA字体串，1，0，1，0 。。。
//    var describeIsUsed:String {
//        return normalizedIsUsed.map { $0 ? 1 : 0 }.map(String.init).joined(separator: ", ")
//    }
//
//    // degree 上的音，与 标准位置的差 转化为 升降号
//    func diffFromStandardPitchToString(by degree:ChordDegrees) -> String{
//        let diffInt = diffFromStandardPitch(by: degree)
//        return diffInt == 0 ? "" : String(repeating: diffInt > 0 ? "♯" : "♭", count: abs(diffInt))
//    }
//}
//
//
//
//
//
//
//
//
//
///// chord name - 和弦名
//extension ChordDetail{
//    
//    // 和弦名, 两套和弦名，要不要简写7，其中， 基础名（7音以下的名字）又分为 系统体 和 手写体
//    enum ChordNameMode{
//        case sysName, handName
//    }
//    
//    // 第一套和弦名 无简写 7 的情况
//    // 使用表中sysName字段，没有简写。 比如 C大11和弦， 直接显示CM7 上标 9、11
//    // 这是最标准的和弦名,但是信息量比较冗余
//    func getFullBasicName(_ mode:ChordNameMode = .sysName) -> String? {
//        switch mode{
//        case .sysName:  basicChordInfo?.sysName ?? nil
//        case .handName: basicChordInfo?.handName ?? nil
//        }
//    }
//    //  tentison是什么写什么
//    func getFullTensionName(tension degree: ChordDegrees) -> String? {
//        
//        // 基础名字都没有，很定也没有tension名字
//        guard getFullBasicName() != nil else {return nil}
//        
//        // 不是tension的degree 就没有名字
//        guard getIsInUsed(degree: degree) else { return nil }
//        
//        switch getInterval(degree: degree) {
//        case .M9:   return "9"
//        case .m9:   return "♭9"
//        case .A9:   return "♯9"
//        case .P11:  return "11"
//        case .A11:  return "♯11"
//        case .M13:  return "13"
//        case .m13:  return "♭13"
//        case .A13:  return "♯13"
//        default:    return nil
//        }
//    }
//    
//    // 第二套和弦名 简写 7 的情况
//    // 比如 C大11和弦， 直接显示CM11
//    // Short ChordName.
//    func getShortBasicName(_ mode:ChordNameMode = .sysName) -> String? {
//        
//        switch mode{
//        case .sysName:
//            // 含“7” 升格，tension中有9就把sysName里面的7换为9，11、13的情况一样
//            if getIsInUsed(degree: .thirteenth) && normalizedDNA[ChordDegrees.thirteenth.chordDNAIndex] == 21{
//                if getIsInUsed(degree: .seventh) &&
//                    (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//                    ((basicChordInfo?.sysName.contains("7")) != nil)
//                {
//                    return basicChordInfo?.sysName.replacingOccurrences(of: "7", with: "13")
//                }
//            }
//            if getIsInUsed(degree: .eleventh) && normalizedDNA[ChordDegrees.eleventh.chordDNAIndex] == 17{
//                if getIsInUsed(degree: .seventh) &&
//                    (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//                    ((basicChordInfo?.sysName.contains("7")) != nil)
//                {
//                    return basicChordInfo?.sysName.replacingOccurrences(of: "7", with: "11")
//                }
//            }
//            if getIsInUsed(degree: .ninth) && normalizedDNA[ChordDegrees.ninth.chordDNAIndex] == 14{
//                if getIsInUsed(degree: .seventh) &&
//                    (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//                    ((basicChordInfo?.sysName.contains("7")) != nil)
//                {
//                    return basicChordInfo?.sysName.replacingOccurrences(of: "7", with: "9")
//                }
//            }
//            return basicChordInfo?.sysName ?? nil
//        case .handName:
//            // 含“7” 升格，tension中有9就把handName里面的7换为9，11、13的情况一样
//            if getIsInUsed(degree: .thirteenth) && normalizedDNA[ChordDegrees.thirteenth.chordDNAIndex] == 21{
//                if getIsInUsed(degree: .seventh) &&
//                    (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//                    ((basicChordInfo?.handName.contains("7")) != nil)
//                {
//                    return basicChordInfo?.handName.replacingOccurrences(of: "7", with: "13")
//                }
//            }
//            if getIsInUsed(degree: .eleventh) && normalizedDNA[ChordDegrees.eleventh.chordDNAIndex] == 17{
//                if getIsInUsed(degree: .seventh) &&
//                    (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//                    ((basicChordInfo?.handName.contains("7")) != nil)
//                {
//                    return basicChordInfo?.handName.replacingOccurrences(of: "7", with: "11")
//                }
//            }
//            if getIsInUsed(degree: .ninth) && normalizedDNA[ChordDegrees.ninth.chordDNAIndex] == 14{
//                if getIsInUsed(degree: .seventh) &&
//                    (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//                    ((basicChordInfo?.handName.contains("7")) != nil)
//                {
//                    return basicChordInfo?.handName.replacingOccurrences(of: "7", with: "9")
//                }
//            }
//            return basicChordInfo?.handName ?? nil
//        }
//
//    }
//    func getShortTensionName(tension degree: ChordDegrees) -> String? {
//        
//        // 基础名字都没有肯定是nil
//        guard getShortBasicName() != nil else {return nil}
//        
//        // 如果和弦本身没有用到这个tension，那么就返回 nil
//        guard getIsInUsed(degree: degree) else { return nil }
//        
//        // 含“7” 升格，有7的情况下，就不要写tension了，返回nil
//        /// 条件1：用了7音，
//        /// 条件2：7音是大七度 或者是 小7度 的情况
//        /// 条件3：sysName中有7这个字符串
//        if getIsInUsed(degree: .seventh) &&
//            (normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 11 || normalizedDNA[ChordDegrees.seventh.chordDNAIndex] == 10 ) &&
//            ((basicChordInfo?.sysName.contains("7")) != nil)
//        {
//            switch getInterval(degree: degree) {
//            case .M9:   return nil
//            case .m9:   return "♭9"
//            case .A9:   return "♯9"
//            case .P11:  return nil
//            case .A11:  return "♯11"
//            case .M13:  return nil
//            case .m13:  return "♭13"
//            case .A13:  return "♯13"
//            default:    return nil
//            }
//        }
//        
//        return getFullTensionName(tension: degree)
//    }
//    
//    // 判断是和弦是否存在 简写7的情况，如果 fullBaseName 不等于 shortBasicName 返回 true 存在简写 7的情况
//    var isHaveShortName:Bool{
//        return getFullBasicName(.sysName) != getShortBasicName(.sysName)
//    }
//    
//    // 判断和弦是否存在handName
//    var isHaveHandName: Bool{
//        return getFullBasicName(.handName) != getFullBasicName(.sysName)
//    }
//    
//    var isHaveTensionNameWhenShort: Bool{
//        var tensionName:String = ""
//        for tensionDegree in [ChordDegrees.ninth, ChordDegrees.eleventh, ChordDegrees.thirteenth]{
//            tensionName.append(getShortTensionName(tension: tensionDegree) ?? "")
//        }
//        return !tensionName.isEmpty
//    }
//    
//    
//    var tensionNumberNameListWhenShort: (ninth: String?, eleventh:String?, thirteenth:String? ){
//        return (
//            ninth:getShortTensionName(tension: .ninth),
//            eleventh:getShortTensionName(tension: .eleventh),
//            thirteenth:getShortTensionName(tension: .thirteenth),
//        )
//    }
//}
//
//enum ChordDegrees:Int,CaseIterable,Comparable{
//    
//    
//    case root, second, third, fourth, fifth, sixth, seventh, ninth, eleventh, thirteenth
//    
//    // Comparable 协议要求实现 用来实现 ChordDegrees的大小比较
//    static func < (lhs: ChordDegrees, rhs: ChordDegrees) -> Bool {
//        return lhs.rawValue < rhs.rawValue
//    }
//    
//    var dispalyName: String {
//        switch self {
//        case .root: return "1"
//        case .second: return "2"
//        case .third: return "3"
//        case .fourth: return "4"
//        case .fifth: return "5"
//        case .sixth: return "6"
//        case .seventh: return "7"
//        case .ninth: return "9"
//        case .eleventh: return "11"
//        case .thirteenth: return "13"
//        }
//    }
//    
//    var pitchNormalPosion: Int {
//        switch self {
//        case .root:  0
//        case .second:  2
//        case .third:  4
//        case .fourth:  5
//        case .fifth:  7
//        case .sixth:  9
//        case .seventh:  11
//        case .ninth:  14
//        case .eleventh:  17
//        case .thirteenth: 21
//        }
//    }
//    
//    // this degree 是音阶中的第几个音
//    var inScales: Int {
//        switch self {
//        case .root:  1
//        case .second:  2
//        case .third:  3
//        case .fourth:  4
//        case .fifth:  5
//        case .sixth:  6
//        case .seventh:  7
//        case .ninth:  9
//        case .eleventh:  11
//        case .thirteenth: 13
//        }
//    }
//    
//    // 这个degree在rawDNA这个数组上的Index位置
//    var chordDNAIndex: Int {
//        switch self {
//        case .root: return 0
//        case .second: return 1
//        case .third: return 2
//        case .fourth: return 3
//        case .fifth: return 4
//        case .sixth: return 5
//        case .seventh: return 6
//        case .ninth: return 7
//        case .eleventh: return 8
//        case .thirteenth: return 9
//        }
//    }
//    
//    var allowedSemitoneRange: ClosedRange<Int>{
//        switch self {
//        case .root:
//            return -150...150 //这里代表无限的距离
//        case .second:
//            return 1...3
//        case .third:
//            return 3...4
//        case .fourth:
//            return 4...6
//        case .fifth:
//            return 6...8
//        case .sixth:
//            return 8...10
//        case .seventh:
//            return  9...11
//        case .ninth:
//            return 13...15
//        case .eleventh:
//            return 17...18
//        case .thirteenth:
//            return 20...22
//        }
//    }
//    
//    // 把口语化的几音翻译为ChordDegrees. 比如口语中，说3音，程序就返回 .third
//    static func translateNumberToDegree(by numberDegree: Int) -> ChordDegrees? {
//        switch numberDegree {
//        case 1: return .root
//        case 2: return .second
//        case 3: return .third
//        case 4: return .fourth
//        case 5: return .fifth
//        case 6: return .sixth
//        case 7: return .seventh
//        case 9: return .ninth
//        case 11: return .eleventh
//        case 13: return .thirteenth
//        default: return nil
//        }
//    }
//}
//
//enum DropType{
//    case two
//    case three
//    case twoANDthree
//}
//
//
//extension ChordDetail{
//    
//    /// 和弦基础信息 音列 表. 反馈这和弦用了哪些degree
//    /// 例: [ture,false,true,false,true,false,false...] 返回 [.root, .third, .fifth]
//    var inUsedDegree:[ChordDegrees]{
//
//        // 翻译index, index = inUsedDNA 上的位置
//        func translateIndex(_ index: Int) -> ChordDegrees {
//            let translations:[Int:ChordDegrees] = [
//                0: .root ,
//                1: .second,
//                2: .third,
//                3: .fourth,
//                4: .fifth,
//                5: .sixth,
//                6: .seventh,
//                7: .ninth,
//                8: .eleventh,
//                9: .thirteenth
//            ]
//            return translations[index]!
//        }
//        
//        // 找到所有为true的index并翻译
//        return normalizedIsUsed // 因为normalizedIsUsed是顺序的,所以,inUsedDegree保留了原本的顺序
//            .enumerated() // 获取(index, element)元组
//            .filter { $0.element } // 筛选出值为true的元素
//            .map { translateIndex($0.offset) } // 翻译index
//    }
//    
//}
//
///// Voicing
//extension ChordDetail{
//    
//    /// 和弦是否被被voicing过
//    var isVoiced: Bool {
//        
//        /// 如果和弦的 voicingDNA 是 nil 这是考虑到数据库中的数据,之前有可能是空的. 同时,即使有了voicingDNA也有考虑,用户是否编辑过了这个voicingDNA, 但是没有添加任何 voicing 音, 也就是isEmpty == true
//        /// chord.voicingDNA?.isEmpty 返回一个 Optional<Bool>，如果 voicingDNA 为 nil，则结果为 nil
//        /// == false 会将 nil 和 true 都变为 false，只有在不为 nil 且非空时结果才为 true。
//        chord.voicingDNA?.isEmpty == false
//    }
//    
//    /// 和弦voicing 音列 表,  反馈和弦voicing时 用了哪些degree
//    /// 例如 VoicingDNA 为 [1,1,3] 转为 [.root, .root, .third]. 如果要去重复 直接用代码 Array(Set(inUsedVoicingDegree))
//    ///  例如 VoicingDNA 为 [] 转为 []. 空 转 空
//    /// 保留顺序, 且没有去重复, 只是把原本的VoicingDNA 直接转化为 degree Map.
//    var voicingDnaDegree: [ChordDegrees] {
//        
//        /// 如果 chord.voicingDNA 为 nil，则使用空数组
//        (chord.voicingDNA ?? [])
//        /// 翻译 Int -> ChordDegree
//        .compactMap { ChordDegrees.translateNumberToDegree(by: $0) } // compactMap = map + 去掉 nil. 考虑 translateNumberToDegree后的元素可能是nil, 如果是nil, 要跳过
//    }
//    
//    // voicing中的tension应该是覆盖的逻辑. 会覆盖掉原本的chord里面的tension. 原本rawDNA中的tension不应该在这一层中考虑.
//  
//    
//    
//    // 判断chord的pitch里面是否有冲突音
//    var isVoicingHaveSameDegreePitch:Bool{
//        /// 外层 contains(where:)：检查 inUsedPitches 里是否有某个 pitch 符合条件。
//        /// 内层 contains(_:)：检查 inUsedPitches 是否包含 pitch + 12（即比当前音高高一个八度的音）
//        /// 如果存在 pitch 使得 pitch + 12 也在集合里，就返回 true，否则返回 false。
//        return inUsedPitches.contains { pitch in
//            inUsedPitches.contains(pitch + Pitch(12))
//        }
//    }
//    
//    /// 和弦voicing 基础音 列表
//    /// 保留了 VoicingDNA中的顺序, 去除九度、十一度和十三度
//    /// 没有去重复.  保留原始位置
//    var voicingDnaDegreeBasic:[ChordDegrees]{
//        voicingDnaDegree.filter { ![.ninth, .eleventh, .thirteenth].contains($0) }
//    }
//    
//    /// 和弦voicing 延伸音 列表
//    /// 保留了 VoicingDNA中的顺序, 只有九度、十一度和十三度
//    /// 没有去重复.  保留原始位置
//    var voicingDnaDegreeTension:[ChordDegrees]{
//        /// 只保留 `inUsedVoicingDegree` 中的 tension
//        voicingDnaDegree.filter { [.ninth, .eleventh, .thirteenth].contains($0) }
//    }
//    
//    /// Voicing实际启用 延伸音
//    /// Voicing的时候用 实际用了哪些 tension 音
//    /// 例: 和弦基础 已经包含了 [.nineth, .eleventh, .thirteenth] voicingDnaDegreeTension =   [thirteenth, .nineth, .thirteenth]
//    /// 返回:  [.nineth,, .thirteenth]
//    /// 本质是在对 voicingDnaDegreeTension **去重复 并 排序**
//    var inUsedVoicingTensionDegree:[ChordDegrees]{
//        /// 要保证voicingDegreeTension 在 inUsedTensionDegree 里面,
//        /// 因为 voicingDegree 一定是包含在inUsedDegree中. voicingDegree解码的时候已经 做了确保
//        return Array(Set(voicingDnaDegreeTension)).sorted(by: <)
//    }
//    
//    /// Voicing实际启用 基础音
//    /// Voicing的时候用 实际用了哪些 basic 音
//    /// 例: 和弦chord.inUsedBasicDegree 已经包含了 [.third, .fifth, .seventh] voicingDnaDegreeBasic =   [.fifth, .third, .third,]
//    /// 返回:  [.third, .fifth]
//    /// 本质是在对 voicingDnaDegreeBasic **去重复 并 排序**
//    var inUsedVoicingBasicDegree:[ChordDegrees]{
//        /// 要保证voicingDnaDegreeBasic 在 inUsedBasicDegree 里面,
//        /// 因为 voicingDegree 一定是包含在inUsedDegree中. voicingDegree解码的时候已经 做了确保
//        return Array(Set(voicingDnaDegreeBasic)).sorted(by: <)
//    }
//    
//    /// Voicing实际启用 基础音 + 延伸音
//    /// 本质是在对 voicingDnaDegreeBasic **去重复 并 排序**
//    var inUsedVoicingDegree:[ChordDegrees]{
//        return Array(Set(voicingDnaDegree)).sorted(by: <)
//        
//    }
//    
//    /// 获取所有 可能性Piitch
//    /// 键盘 要用到的数据. 通俗的说就是要让键盘上的哪些pitch显示哪些degree.
//    var inUsedDegreePitchPossible:[Pitch: ChordDegrees]{
//        let range: ClosedRange<Int> = 0...8 // 键盘范围
//        var result: [Pitch: ChordDegrees] = [:]
//        
//        
//        // 所有用户编辑的voicingDNA对应的 可能性, 显示上键盘上.
//        for degree in  inUsedDegree { // 由这个和弦的性质决定
//            
//            // 这个degree 可以拿到的, 在这个和弦中的pitch. getPitchByDegree本质是去拿normallizeDNA, 这是一个非常重要的数据. 如果和弦原本有这个音, 就拿这个音. 如果没有, 就拿默认的标准位置! 这里的逻辑是对的.
//            let baseMidi = getPitchByDegree(by: degree).midiNumber % 12
//            
//            for octave in range {
//                let midi = (octave + 1) * 12 + baseMidi
//                let pitch = Pitch(midi)
//                result[pitch] = degree
//            }
//        }
//        return result
//    }
//    
//    
//    /// 获取所有 可能性Piitch
//    /// 键盘 要用到的数据. 通俗的说就是要让键盘上的哪些pitch显示哪些degree.
//    var allDegreePitchPossible:[Pitch: ChordDegrees]{
//        let range: ClosedRange<Int> = 0...8 // 键盘范围
//        var result: [Pitch: ChordDegrees] = [:]
//        
//        
//        // 所有用户编辑的voicingDNA对应的 可能性, 显示上键盘上.
//        for degree in  ChordDegrees.allCases { // 由这个和弦的性质决定
//            
//            // 这个degree 可以拿到的, 在这个和弦中的pitch. getPitchByDegree本质是去拿normallizeDNA, 这是一个非常重要的数据. 如果和弦原本有这个音, 就拿这个音. 如果没有, 就拿默认的标准位置! 这里的逻辑是对的.
//            let baseMidi = getPitchByDegree(by: degree).midiNumber % 12
//            
//            for octave in range {
//                let midi = (octave + 1) * 12 + baseMidi
//                let pitch = Pitch(midi)
//                result[pitch] = degree
//            }
//        }
//        return result
//    }
//    
//    /// 但是，如果
//    
//    /// Voicing实际省略 基础音
//    /// 例: 和弦chord.inUsedBasicDegree 已经包含了 [.root, .third, .fifth, .seventh] inUsedVoicingBasicDegree =   [.third, .fifth,]
//    /// 返回:  [.root, .seventh]
//    /// 因为inUsedBasicDegree是顺序的, 所以返回的结果也是 **顺序** 的.
//    var inUsedVoicingBasicOmitDegree:[ChordDegrees]{
//        inUsedBasicDegree.filter { !inUsedVoicingBasicDegree.contains($0) }
//    }
//    
//    
//    /// 根据 Voicing实际启用 延伸音 生成 add name. 不对外暴露, 只给最后的名字用来拼接
//    private func voicedChordNameAdd() -> String {
//        
//        // 判断 和弦是是否在voicing的时候 用上tension 和弦有inUsedVoicingTensionDegree一定就是isVoiced的状态
//        /// 如果没有任何tension, 就不能出现AddName
//        /// 确保 inUsedVoicingTensionDegree 不为空, 不为空继续
//        /// inUsedVoicingTensionDegree.isEmpty 为空  -> true
//        /// ! inUsedVoicingTensionDegree.isEmpty -> false -> 执行 else
//        guard !inUsedVoicingTensionDegree.isEmpty else {return ""}
//        
//        // Voicing实际启用 延伸音 转化为 数字音名
//        let tensionNumberName = inUsedVoicingTensionDegree.map{ getNumberedName(by: $0) }
//        
//        // 拼接
//        let joined = tensionNumberName.joined(separator: " ")
//
//        return "add(\(joined))"
//    }
//    
//    /// 根据 Voicing实际启用 basic音 生成 omit name. 不对外暴露, 只给最后的名字用来拼接
//    /// omit的情况,只能用来omit 2/4/5
//    private func voicedChordNameOmit() -> String {
//        
//        /// 如果没有任何omit, 就不能出现OmitName
//        /// 确保 inUsedVoicingBasicOmitDegree 不为空, 不为空继续
//        /// inUsedVoicingBasicOmitDegree.isEmpty 为空  -> true
//        /// ! inUsedVoicingBasicOmitDegree.isEmpty -> false -> 执行 else
//        guard !inUsedVoicingBasicOmitDegree.isEmpty else {return ""}
//        
//        /// 如果任何基础音都omit了, 也不能出现OmitName
//        guard inUsedVoicingBasicOmitDegree != inUsedBasicDegree else {return ""}
//        
//        /// 如果omit了根音, 返回RootLess
//        guard !inUsedVoicingBasicOmitDegree.contains(.root) else {return "Rootless"}
//        
//        /// 获取数字音名
//        let omittedNumberName = inUsedVoicingBasicOmitDegree.map{ getNumberedName(by: $0) }
//        
//        /// 拼接返回
//        let joined = omittedNumberName.joined(separator: " ")
//        return "omit(\(joined))"
//    }
//    
//    /// 返回的 voicedChordName
//    var voicedChordName:String{
//       chord.rootNote.formatNoteName + (basicChordInfo?.sysName ?? "") + voicedChordNameAdd() + voicedChordNameOmit()
//    }
//    
//    
//    /// 判断voicing 名字 是否合法
//    var isLeagleVoicing:Bool{
//        
//        /// 如果任何基础音都omit了, 不合法
//        if inUsedVoicingBasicOmitDegree != inUsedBasicDegree{
//            return false
//        }
//        
//        return true
//    }
//
//    
// 
//    // VoicingDNA 所有元素 依据排列 找 最近对应的可能性 Pitch
//    /// 键盘用,高亮的音
//    var voicingPitches:[Pitch] {
//        // 获取到和弦voicingDnaDegree如果是空的, 返回空数组, 即用户没有输入任何有效的voingDNA,不需计算pitch
//        guard !voicingDnaDegree.isEmpty else {return []}
//        
//        //  虚拟指针开始位置
//        var startIndex = chord.rootNote.pitch
//        var result:[Pitch] = []
//        
//        for degree in  voicingDnaDegree {
//            for i in startIndex...108{ // 键盘最多108个音 不要找太远
//                if let possible = inUsedDegreePitchPossible[Pitch(i)] , possible == degree{
//                    result.append(Pitch(i))
//                    startIndex = i + 1
//                    break // 找到了就要退出
//                }
//            }
//        }
//        return result
//    }
//    
//    var voicingMidiNumber: [UInt8] {
//        voicingPitches.map { UInt8($0.midiNumber) }
//    }
//    
//}
//
///// relaction to scale
//extension ChordDetail{
//    
//    // 获取chord对应的note
//    var inUsedNote:[Note]{
//        let key = chord.rootNote
//        let scale = Scale(scaleType: .NaturalMajor, key: key)
//        
//        return inUsedDegree.compactMap { degree in
//            
//            scale.getScaleNote(
//                by: degree.inScales,
//                diffPlus: diffFromStandardPitch(by: degree)
//            )
//            
//        }
//    }
//    
//    // 获取所有chord对应的note，在octave -1...8的范围内
//    var inUsedNoteInAllKeyBoard: Set<Note> {
//        var result: Set<Note> = []
//
//        for baseNote in inUsedNote {
//            for octave in -1...8 {
//                var transposed = baseNote
//                transposed.octave = octave
//                result.insert(transposed)
//            }
//        }
//
//        return result
//    }
//}
//
//extension ChordDetail{
//    /// 和弦是否被被voicing过
//    var isWaterFall: Bool {
//        !chord.midiPads.isEmpty
//    }
//}
//
//// chord CN name
//extension ChordDetail {
//    
//    var cnNameBasicString: String {
//        let targetBasicRawDna = Array(self.chord.rawDNA.prefix(7))
//        
//        let basicCNName:String = ChordBasicMap.first(where: { $0.DNA == targetBasicRawDna })?.cnNameString ?? "No Chord Basic Name"
//        
//        return basicCNName
//    }
//    
//    var cnNameTensionString: String {
//        let targetTensionDegree = self.chord.rawDNA.suffix(3).compactMap {$0}
//        
//        var tensionCNName: String = ""
//        
//        for item in targetTensionDegree{
//            if item == 13{
//                tensionCNName += "小九"
//            }
//            if item == 14 {
//                tensionCNName += "加九"
//            }
//            if item == 15 {
//                tensionCNName += "增九"
//            }
//            
//            if item == 17 {
//                tensionCNName += "加十一"
//            }
//            if item == 18 {
//                tensionCNName += "增十一"
//            }
//            
//            if item == 20 {
//                tensionCNName += "小十三"
//            }
//            
//            if item == 21 {
//                tensionCNName += "加十三"
//            }
//            if item == 22 {
//                tensionCNName += "增十三"
//            }
//        }
//
//        return tensionCNName
//    }
//    
//}
//
///// 和弦音可能性扩展
//extension ChordDetail {
//    
//    /// 和弦构成音拓展
//    var inUsedNoteAllPossibleOnKeyboard: [Note]{
//        var result: [Note] = []
//
//        // 键盘上的音所在全范围octave 1-8
//        for baseNote in inUsedNote {
//            for octave in 0...8 {
//                var transposed = baseNote
//                transposed.octave = octave
//                result.append(transposed)
//            }
//        }
//        return result
//    }
//    
//    /// 根据某个pitch返回这个键盘上可能的和弦音
//    func getKeyboardChordNote(by pitchInt: Int) -> Note?{
//        inUsedNoteAllPossibleOnKeyboard.first { note in
//            note.pitch == pitchInt
//        }
//    }
//    
//}
//
