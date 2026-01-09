//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 1/5/26.
//

import Foundation

public struct ChordBasicInfo {
     public var baseName: String
     public var baseNameAddition: [Interval]  // 基础和弦中需要特别说明的音
     public var shortName: String?
     public var cnName: String?
     public var enName: String?
     public var intervals: Set<Interval>
     public var isDiatonic: Bool

     public var basicType: BasicType

     public enum BasicType {
          case triad, triadSus2, triadSus4
          case seventh, seventhSus2, seventhSus4
          case sixth, sixthSus2, sixthSus4

          public var isTriad: Bool {
               switch self {
               case .triad, .triadSus2, .triadSus4:
                    return true
               default:
                    return false
               }
          }

          public var isSeventh: Bool {
               switch self {
               case .seventh, .seventhSus2, .seventhSus4:
                    return true
               default:
                    return false
               }
          }

          public var isSixth: Bool {
               switch self {
               case .sixth, .sixthSus2, .sixthSus4:
                    return true
               default:
                    return false
               }
          }

          public var isSus: Bool {
               switch self {
               case .triadSus2, .triadSus4,
                    .seventhSus2, .seventhSus4,
                    .sixthSus2, .sixthSus4:
                    return true
               default:
                    return false
               }
          }

          public var isSus2: Bool {
               switch self {
               case .triadSus2, .seventhSus2, .sixthSus2:
                    return true
               default:
                    return false
               }
          }

          public var isSus4: Bool {
               switch self {
               case .triadSus4, .seventhSus4, .sixthSus4:
                    return true
               default:
                    return false
               }
          }
     }

     public init(
          baseName: String, baseNameAddition: [Interval] = [], shortName: String? = nil,
          cnName: String? = nil, enName: String? = nil, intervals: Set<Interval>,
          basicType: BasicType, isDiatonic: Bool = false
     ) {
          self.baseName = baseName
          self.baseNameAddition = baseNameAddition
          self.shortName = (shortName != nil) ? shortName : baseName
          self.intervals = intervals
          self.cnName = cnName
          self.enName = enName
          self.basicType = basicType
          self.isDiatonic = isDiatonic
     }

}

extension ChordBasicInfo {
     // 把 baseName 与 baseNameAddition 组成一个新的名字
     // 例如 baseName: "M", baseNameAddition: [.d5],
     // 返回 M(b5)
     // 注意，baseNameAddition 有，在baseName后面添加一个数字音名（Interval.descriptionNumber）. 有就加括号，没有就不要加。
     public var baseNameFull: String {
          if baseNameAddition.isEmpty {
               return baseName
          }
          let additions = baseNameAddition.map { $0.descriptionNumber }.joined()
          return "\(baseName)(\(additions))"
     }
}

public protocol ChordType {
     var info: ChordBasicInfo { get }
}

//
public enum ChordTypeAdvance: CaseIterable, ChordType {
     case majorSixNinth
     case major9
     case dominant9
     case minor9
     case major11
     case dominant11
     case minor11
     case major13
     case dominant13
     case minor13
     case major7Sharp11
     case dominant7Sharp11
     case dominant7Flat9
     case dominant7Sharp9

     public var info: ChordBasicInfo {
          switch self {
          case .majorSixNinth:
               return ChordBasicInfo(
                    baseName: "69",
                    cnName: "六九",
                    enName: "six nine",
                    intervals: [.M3, .P5, .M6, .M9],
                    basicType: .sixth)
          case .major9:
               return ChordBasicInfo(
                    baseName: "M9",
                    cnName: "大九",
                    enName: "major 9th",
                    intervals: [.M3, .P5, .M7, .M9],
                    basicType: .seventh)
          case .dominant9:
               return ChordBasicInfo(
                    baseName: "9",
                    cnName: "属九",
                    enName: "dominant 9th",
                    intervals: [.M3, .P5, .m7, .M9],
                    basicType: .seventh)
          case .minor9:
               return ChordBasicInfo(
                    baseName: "m9",
                    cnName: "小九",
                    enName: "minor 9th",
                    intervals: [.m3, .P5, .m7, .M9],
                    basicType: .seventh)
          case .major11:
               return ChordBasicInfo(
                    baseName: "M11",
                    cnName: "大十一",
                    enName: "major 11th",
                    intervals: [.M3, .P5, .M7, .M9, .P11],
                    basicType: .seventh)
          case .dominant11:
               return ChordBasicInfo(
                    baseName: "11",
                    cnName: "属十一",
                    enName: "dominant 11th",
                    intervals: [.M3, .P5, .m7, .M9, .P11],
                    basicType: .seventh)
          case .minor11:
               return ChordBasicInfo(
                    baseName: "m11",
                    cnName: "小十一",
                    enName: "minor 11th",
                    intervals: [.m3, .P5, .m7, .M9, .P11],
                    basicType: .seventh)
          case .major13:
               return ChordBasicInfo(
                    baseName: "M13",
                    cnName: "大十三",
                    enName: "major 13th",
                    intervals: [.M3, .P5, .M7, .M9, .M13],
                    basicType: .seventh)
          case .dominant13:
               return ChordBasicInfo(
                    baseName: "13",
                    cnName: "属十三",
                    enName: "dominant 13th",
                    intervals: [.M3, .P5, .m7, .M9, .M13],
                    basicType: .seventh)
          case .minor13:
               return ChordBasicInfo(
                    baseName: "m13",
                    cnName: "小十三",
                    enName: "minor 13th",
                    intervals: [.m3, .P5, .m7, .M9, .M13],
                    basicType: .seventh)
          case .major7Sharp11:
               return ChordBasicInfo(
                    baseName: "M7",
                    baseNameAddition: [.A11],
                    cnName: "大七升十一",
                    enName: "major 7th sharp 11th",
                    intervals: [.M3, .P5, .M7, .A11],
                    basicType: .seventh)
          case .dominant7Sharp11:
               return ChordBasicInfo(
                    baseName: "7",
                    baseNameAddition: [.A11],
                    cnName: "属七升十一",
                    enName: "dominant 7th sharp 11th",
                    intervals: [.M3, .P5, .m7, .A11],
                    basicType: .seventh)
          case .dominant7Flat9:
               return ChordBasicInfo(
                    baseName: "7",
                    baseNameAddition: [.m9],
                    cnName: "属七降九",
                    enName: "dominant 7th flat 9th",
                    intervals: [.M3, .P5, .m7, .m9],
                    basicType: .seventh)
          case .dominant7Sharp9:
               return ChordBasicInfo(
                    baseName: "7",
                    baseNameAddition: [.A9],
                    cnName: "属七升九",
                    enName: "dominant 7th sharp 9th",
                    intervals: [.M3, .P5, .m7, .A9],
                    basicType: .seventh)
          }
     }
}

// 7音以下所有排列组合
public enum ChordTypeBasic: ChordType, CaseIterable {

     // 三和弦
     case majorTriad
     case augmentedTriad
     case majorFlatFiveTriad
     case minorTriad
     case minorAugmentedTriad
     case diminishedTriad

     // 挂留和弦
     case sus2
     case sus2FlatFive
     case sus2SharpFive
     case sus4
     case sus4FlatFive
     case sus4SharpFive

     // 七和弦
     case major7
     case dominant7
     case majorDoubleFlat7
     case major7Flat5
     case dominant7Flat5
     case majorFlat5DoubleFlat7
     case major7Sharp5
     case dominant7Sharp5
     case majorSharp5DoubleFlat7
     case minorMajor7
     case minor7
     case minorDoubleFlat7
     case minorMajor7Flat5
     case halfDiminished7
     case diminished7
     case minorMajor7Sharp5
     case minor7Sharp5
     case minorSharp5DoubleFlat7

     // 七挂留和弦
     case major7Sus2
     case dominant7Sus2
     case sus2DoubleFlat7
     case major7Sus2Flat5
     case dominant7Sus2Flat5
     case sus2Flat5DoubleFlat7
     case major7Sus2Sharp5
     case dominant7Sus2Sharp5
     case sus2Sharp5DoubleFlat7
     case major7Sus4
     case dominant7Sus4
     case sus4DoubleFlat7
     case major7Sus4Flat5
     case dominant7Sus4Flat5
     case sus4Flat5DoubleFlat7
     case major7Sus4Sharp5
     case dominant7Sus4Sharp5
     case sus4Sharp5DoubleFlat7

     // 六和弦
     case major6
     case augmented6
     case major6Flat5
     case minor6
     case minor6Sharp5
     case diminished6

     // 六挂留和弦
     case major6Sus2
     case major6Sus2Sharp5
     case major6Sus2Flat5
     case major6Sus4
     case major6Sus4Sharp5
     case major6Sus4Flat5

     public var info: ChordBasicInfo {
          switch self {
          case .majorTriad:
               return ChordBasicInfo(
                    baseName: "M",
                    shortName: "",
                    cnName: "大三",
                    enName: "major triad",
                    intervals: [.M3, .P5],
                    basicType: .triad,
                    isDiatonic: true)
          case .augmentedTriad:
               return ChordBasicInfo(
                    baseName: "aug",
                    shortName: "+",
                    cnName: "增三",
                    enName: "augmented triad",
                    intervals: [.M3, .A5],
                    basicType: .triad)
          case .majorFlatFiveTriad:
               return ChordBasicInfo(
                    baseName: "M",
                    baseNameAddition: [.d5],
                    cnName: "大三减五",
                    enName: "major triad flat five",
                    intervals: [.M3, .d5],
                    basicType: .triad)
          case .minorTriad:
               return ChordBasicInfo(
                    baseName: "m",
                    shortName: "-",
                    cnName: "小三",
                    enName: "minor triad",
                    intervals: [.m3, .P5],
                    basicType: .triad,
                    isDiatonic: true)
          case .minorAugmentedTriad:
               return ChordBasicInfo(
                    baseName: "m",
                    baseNameAddition: [.A5],
                    cnName: "小三增五",
                    enName: "minor augmented triad",
                    intervals: [.m3, .A5],
                    basicType: .triad)
          case .diminishedTriad:
               return ChordBasicInfo(
                    baseName: "dim",
                    shortName: "°",
                    cnName: "减三",
                    enName: "diminished triad",
                    intervals: [.m3, .d5],
                    basicType: .triad,
                    isDiatonic: true)
          case .sus2:
               return ChordBasicInfo(
                    baseName: "sus2",
                    cnName: "挂二",
                    enName: "suspended 2",
                    intervals: [.M2, .P5],
                    basicType: .triadSus2)
          case .sus2FlatFive:
               return ChordBasicInfo(
                    baseName: "sus2",
                    baseNameAddition: [.d5],
                    cnName: "挂二减五",
                    enName: "suspended 2 diminished 5",
                    intervals: [.M2, .d5],
                    basicType: .triadSus2)
          case .sus2SharpFive:
               return ChordBasicInfo(
                    baseName: "sus2",
                    baseNameAddition: [.A5],
                    cnName: "挂二增五",
                    enName: "suspended 2 augmented 5",
                    intervals: [.M2, .A5],
                    basicType: .triadSus2)
          case .sus4:
               return ChordBasicInfo(
                    baseName: "sus4",
                    cnName: "挂四",
                    enName: "suspended 4",
                    intervals: [.P4, .P5],
                    basicType: .triadSus4)
          case .sus4FlatFive:
               return ChordBasicInfo(
                    baseName: "sus4",
                    baseNameAddition: [.d5],
                    cnName: "挂四减五",
                    enName: "suspended 4 diminished 5",
                    intervals: [.P4, .d5],
                    basicType: .triadSus4)
          case .sus4SharpFive:
               return ChordBasicInfo(
                    baseName: "sus4",
                    baseNameAddition: [.A5],
                    cnName: "挂四增五",
                    enName: "suspended 4 augmented 5",
                    intervals: [.P4, .A5],
                    basicType: .triadSus4)
          case .major7:
               return ChordBasicInfo(
                    baseName: "M7",
                    shortName: "△",
                    cnName: "大七",
                    enName: "major 7th",
                    intervals: [.M3, .P5, .M7],
                    basicType: .seventh,
                    isDiatonic: true)
          case .dominant7:
               return ChordBasicInfo(
                    baseName: "7",
                    cnName: "属七",
                    enName: "dominant 7th",
                    intervals: [.M3, .P5, .m7],
                    basicType: .seventh,
                    isDiatonic: true)
          case .majorDoubleFlat7:
               return ChordBasicInfo(
                    baseName: "M",
                    baseNameAddition: [.d7],
                    cnName: "大三加重减七",
                    enName: "major triad double flat 7th",
                    intervals: [.M3, .P5, .d7],
                    basicType: .seventh)
          case .major7Flat5:
               return ChordBasicInfo(
                    baseName: "M7",
                    baseNameAddition: [.d5],
                    cnName: "大七减五",
                    enName: "major 7th flat 5th",
                    intervals: [.M3, .d5, .M7],
                    basicType: .seventh)
          case .dominant7Flat5:
               return ChordBasicInfo(
                    baseName: "7",
                    baseNameAddition: [.d5],
                    cnName: "属七减五",
                    enName: "dominant 7th flat 5th",
                    intervals: [.M3, .d5, .m7],
                    basicType: .seventh)
          case .majorFlat5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "M",
                    baseNameAddition: [.d5, .d7],
                    cnName: "大三减五重减七",
                    enName: "major flat 5th double flat 7th",
                    intervals: [.M3, .d5, .d7],
                    basicType: .seventh)
          case .major7Sharp5:
               return ChordBasicInfo(
                    baseName: "M7",
                    baseNameAddition: [.A5],
                    shortName: "△",
                    cnName: "大七增五",
                    enName: "major 7th sharp 5th",
                    intervals: [.M3, .A5, .M7],
                    basicType: .seventh)
          case .dominant7Sharp5:
               return ChordBasicInfo(
                    baseName: "7",
                    baseNameAddition: [.A5],
                    cnName: "属七增五",
                    enName: "dominant 7th sharp 5th",
                    intervals: [.M3, .A5, .m7],
                    basicType: .seventh)
          case .majorSharp5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "M",
                    baseNameAddition: [.A5, .d7],
                    cnName: "大三增五重减七",
                    enName: "major sharp 5th double flat 7th",
                    intervals: [.M3, .A5, .d7],
                    basicType: .seventh)
          case .minorMajor7:
               return ChordBasicInfo(
                    baseName: "mM7",
                    cnName: "小大七",
                    enName: "minor major 7th",
                    intervals: [.m3, .P5, .M7],
                    basicType: .seventh)
          case .minor7:
               return ChordBasicInfo(
                    baseName: "m7",
                    shortName: "-7",
                    cnName: "小七",
                    enName: "minor 7th",
                    intervals: [.m3, .P5, .m7],
                    basicType: .seventh,
                    isDiatonic: true)
          case .minorDoubleFlat7:
               return ChordBasicInfo(
                    baseName: "m",
                    baseNameAddition: [.d7],
                    cnName: "小三加重减七",
                    enName: "minor triad double flat 7th",
                    intervals: [.m3, .P5, .d7],
                    basicType: .seventh)
          case .minorMajor7Flat5:
               return ChordBasicInfo(
                    baseName: "mM7",
                    baseNameAddition: [.d5],
                    cnName: "小大七减五",
                    enName: "minor major 7th flat 5th",
                    intervals: [.m3, .d5, .M7],
                    basicType: .seventh)
          case .halfDiminished7:
               return ChordBasicInfo(
                    baseName: "m7",
                    baseNameAddition: [.d5],
                    shortName: "ø7",
                    cnName: "半减七",
                    enName: "half-diminished 7th",
                    intervals: [.m3, .d5, .m7],
                    basicType: .seventh,
                    isDiatonic: true)
          case .diminished7:
               return ChordBasicInfo(
                    baseName: "dim7",
                    shortName: "°7",
                    cnName: "减七",
                    enName: "diminished 7th",
                    intervals: [.m3, .d5, .d7],
                    basicType: .seventh)
          case .minorMajor7Sharp5:
               return ChordBasicInfo(
                    baseName: "mM7",
                    baseNameAddition: [.A5],
                    cnName: "小大七增五",
                    enName: "minor major 7th sharp 5th",
                    intervals: [.m3, .A5, .M7],
                    basicType: .seventh)
          case .minor7Sharp5:
               return ChordBasicInfo(
                    baseName: "m7",
                    baseNameAddition: [.A5],
                    cnName: "小七增五",
                    enName: "minor 7th sharp 5th",
                    intervals: [.m3, .A5, .m7],
                    basicType: .seventh)
          case .minorSharp5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "m",
                    baseNameAddition: [.A5, .d7],
                    cnName: "小三增五重减七",
                    enName: "minor sharp 5th double flat 7th",
                    intervals: [.m3, .A5, .d7],
                    basicType: .seventh)
          case .major7Sus2:
               return ChordBasicInfo(
                    baseName: "M7sus2",
                    shortName: "△sus2",
                    cnName: "大七挂二",
                    enName: "major 7th suspended 2nd",
                    intervals: [.M2, .P5, .M7],
                    basicType: .seventhSus2)
          case .dominant7Sus2:
               return ChordBasicInfo(
                    baseName: "7sus2",
                    cnName: "属七挂二",
                    enName: "dominant 7th suspended 2nd",
                    intervals: [.M2, .P5, .m7],
                    basicType: .seventhSus2)
          case .sus2DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "sus2",
                    baseNameAddition: [.d7],
                    cnName: "重减七挂二",
                    enName: "suspended 2nd double flat 7th",
                    intervals: [.M2, .P5, .d7],
                    basicType: .seventhSus2)
          case .major7Sus2Flat5:
               return ChordBasicInfo(
                    baseName: "M7sus2",
                    baseNameAddition: [.d5],
                    shortName: "△sus2",
                    cnName: "大七挂二减五",
                    enName: "major 7th suspended 2nd flat 5th",
                    intervals: [.M2, .d5, .M7],
                    basicType: .seventhSus2)
          case .dominant7Sus2Flat5:
               return ChordBasicInfo(
                    baseName: "7sus2",
                    baseNameAddition: [.d5],
                    cnName: "属七挂二减五",
                    enName: "dominant 7th suspended 2nd flat 5th",
                    intervals: [.M2, .d5, .m7],
                    basicType: .seventhSus2)
          case .sus2Flat5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "sus2",
                    baseNameAddition: [.d5, .d7],
                    cnName: "减七挂二减五",
                    enName: "suspended 2nd flat 5th double flat 7th",
                    intervals: [.M2, .d5, .d7],
                    basicType: .seventhSus2)
          case .major7Sus2Sharp5:
               return ChordBasicInfo(
                    baseName: "M7sus2",
                    baseNameAddition: [.A5],
                    shortName: "△sus2",
                    cnName: "大七挂二增五",
                    enName: "major 7th suspended 2nd sharp 5th",
                    intervals: [.M2, .A5, .M7],
                    basicType: .seventhSus2)
          case .dominant7Sus2Sharp5:
               return ChordBasicInfo(
                    baseName: "7sus2",
                    baseNameAddition: [.A5],
                    cnName: "属七挂二增五",
                    enName: "dominant 7th suspended 2nd sharp 5th",
                    intervals: [.M2, .A5, .m7],
                    basicType: .seventhSus2)
          case .sus2Sharp5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "sus2",
                    baseNameAddition: [.A5, .d7],
                    cnName: "减七挂二增五",
                    enName: "suspended 2nd sharp 5th double flat 7th",
                    intervals: [.M2, .A5, .d7],
                    basicType: .seventhSus2)
          case .major7Sus4:
               return ChordBasicInfo(
                    baseName: "M7sus4",
                    shortName: "△sus4",
                    cnName: "大七挂四",
                    enName: "major 7th suspended 4th",
                    intervals: [.P4, .P5, .M7],
                    basicType: .seventhSus4)
          case .dominant7Sus4:
               return ChordBasicInfo(
                    baseName: "7sus4",
                    cnName: "属七挂四",
                    enName: "dominant 7th suspended 4th",
                    intervals: [.P4, .P5, .m7],
                    basicType: .seventhSus4)
          case .sus4DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "sus4",
                    baseNameAddition: [.d7],
                    cnName: "重减七挂四",
                    enName: "suspended 4th double flat 7th",
                    intervals: [.P4, .P5, .d7],
                    basicType: .seventhSus4)
          case .major7Sus4Flat5:
               return ChordBasicInfo(
                    baseName: "M7sus4",
                    baseNameAddition: [.d5],
                    shortName: "△sus4",
                    cnName: "大七挂四减五",
                    enName: "major 7th suspended 4th flat 5th",
                    intervals: [.P4, .d5, .M7],
                    basicType: .seventhSus4)
          case .dominant7Sus4Flat5:
               return ChordBasicInfo(
                    baseName: "7sus4",
                    baseNameAddition: [.d5],
                    cnName: "属七挂四减五",
                    enName: "dominant 7th suspended 4th flat 5th",
                    intervals: [.P4, .d5, .m7],
                    basicType: .seventhSus4)
          case .sus4Flat5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "sus4",
                    baseNameAddition: [.d5, .d7],
                    cnName: "减七挂四减五",
                    enName: "suspended 4th flat 5th double flat 7th",
                    intervals: [.P4, .d5, .d7],
                    basicType: .seventhSus4)
          case .major7Sus4Sharp5:
               return ChordBasicInfo(
                    baseName: "M7sus4",
                    baseNameAddition: [.A5],
                    shortName: "△sus4",
                    cnName: "大七挂四增五",
                    enName: "major 7th suspended 4th sharp 5th",
                    intervals: [.P4, .A5, .M7],
                    basicType: .seventhSus4)
          case .dominant7Sus4Sharp5:
               return ChordBasicInfo(
                    baseName: "7sus4",
                    baseNameAddition: [.A5],
                    cnName: "属七挂四增五",
                    enName: "dominant 7th suspended 4th sharp 5th",
                    intervals: [.P4, .A5, .m7],
                    basicType: .seventhSus4)
          case .sus4Sharp5DoubleFlat7:
               return ChordBasicInfo(
                    baseName: "sus4",
                    baseNameAddition: [.A5, .d7],
                    cnName: "减七挂四增五",
                    enName: "suspended 4th sharp 5th double flat 7th",
                    intervals: [.P4, .A5, .d7],
                    basicType: .seventhSus4)
          case .major6:
               return ChordBasicInfo(
                    baseName: "6",
                    cnName: "大六",
                    enName: "major 6th",
                    intervals: [.M3, .P5, .M6],
                    basicType: .sixth)
          case .augmented6:
               return ChordBasicInfo(
                    baseName: "aug6",
                    shortName: "+6",
                    cnName: "增六",
                    enName: "augmented 6th",
                    intervals: [.M3, .A5, .M6],
                    basicType: .sixth)
          case .major6Flat5:
               return ChordBasicInfo(
                    baseName: "6",
                    baseNameAddition: [.d5],
                    cnName: "大六减五",
                    enName: "major 6th flat 5th",
                    intervals: [.M3, .d5, .M6],
                    basicType: .sixth)
          case .minor6:
               return ChordBasicInfo(
                    baseName: "m6",
                    shortName: "-6",
                    cnName: "小六",
                    enName: "minor 6th",
                    intervals: [.m3, .P5, .M6],
                    basicType: .sixth)
          case .minor6Sharp5:
               return ChordBasicInfo(
                    baseName: "m6",
                    baseNameAddition: [.A5],
                    cnName: "小六增五",
                    enName: "minor 6th sharp 5th",
                    intervals: [.m3, .A5, .M6],
                    basicType: .sixth)
          case .diminished6:
               return ChordBasicInfo(
                    baseName: "dim6",
                    shortName: "°6",
                    cnName: "减六",
                    enName: "diminished 6th",
                    intervals: [.m3, .d5, .M6],
                    basicType: .sixth)
          case .major6Sus2:
               return ChordBasicInfo(
                    baseName: "6sus2",
                    cnName: "大六挂二",
                    enName: "major 6th suspended 2nd",
                    intervals: [.M2, .P5, .M6],
                    basicType: .sixthSus2)
          case .major6Sus2Sharp5:
               return ChordBasicInfo(
                    baseName: "6sus2",
                    baseNameAddition: [.A5],
                    cnName: "大六挂二增五",
                    enName: "major 6th suspended 2nd sharp 5th",
                    intervals: [.M2, .A5, .M6],
                    basicType: .sixthSus2)
          case .major6Sus2Flat5:
               return ChordBasicInfo(
                    baseName: "6sus2",
                    baseNameAddition: [.d5],
                    cnName: "大六挂二减五",
                    enName: "major 6th suspended 2nd flat 5th",
                    intervals: [.M2, .d5, .M6],
                    basicType: .sixthSus2)
          case .major6Sus4:
               return ChordBasicInfo(
                    baseName: "6sus4",
                    cnName: "大六挂四",
                    enName: "major 6th suspended 4th",
                    intervals: [.P4, .P5, .M6],
                    basicType: .sixthSus4)
          case .major6Sus4Sharp5:
               return ChordBasicInfo(
                    baseName: "6sus4",
                    baseNameAddition: [.A5],
                    cnName: "大六挂四增五",
                    enName: "major 6th suspended 4th sharp 5th",
                    intervals: [.P4, .A5, .M6],
                    basicType: .sixthSus4)
          case .major6Sus4Flat5:
               return ChordBasicInfo(
                    baseName: "6sus4",
                    baseNameAddition: [.d5],
                    cnName: "大六挂四减五",
                    enName: "major 6th suspended 4th flat 5th",
                    intervals: [.P4, .d5, .M6],
                    basicType: .sixthSus4)
          }
     }
}
