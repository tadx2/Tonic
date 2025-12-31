

//public enum ChordDegree: Int, CaseIterable{
//    
//    case root, second, third, fourth, fifth, sixth, seventh, ninth, eleventh, thirteenth
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
//extension ChordDegree: Comparable{
//    static func < (lhs: ChordDegrees, rhs: ChordDegrees) -> Bool {
//        return lhs.rawValue < rhs.rawValue
//    }
//}
