//
//  File.swift
//  Tonic
//
//  Created by 小汤汤 on 1/5/26.
//

import Foundation

public struct ChordBasicInfo {

     public var basicName: String
     public var basicNameAddition: [Interval]  // 基础和弦中需要特别说明的音
     public var shortName: String
     public var cnName: String
     public var enName: String
     public var intervals: Set<Interval>
     public var isDiatonic: Bool
     public var basicType: Set<BasicType>

     public init(
          basicName: String, basicNameAddition: [Interval] = [],
          shortName: String = "",
          cnName: String = "",
          enName: String = "",
          intervals: Set<Interval>,
          basicType: Set<BasicType>,
          isDiatonic: Bool = false
     ) {
          self.basicName = basicName
          self.basicNameAddition = basicNameAddition
          self.shortName = (shortName != "") ? shortName : basicName
          self.intervals = intervals
          self.cnName = cnName
          self.enName = enName
          self.basicType = basicType
          self.isDiatonic = isDiatonic
     }

}

extension ChordBasicInfo {
     public enum BasicType: CaseIterable, CustomStringConvertible {

          case major, minor, dominant, halfDim
          case triad, seventh, sixth, sus2, sus4
          case aug, dim, flat5, sharp5, doubleFlat7

          public var description: String {
               switch self {
               case .triad:
                    return "Triad"
               case .seventh:
                    return "Seventh"
               case .sixth:
                    return "Sixth"
               case .sus2:
                    return "Sus2"
               case .sus4:
                    return "Sus4"
               case .major:
                    return "MAJ"
               case .aug:
                    return "Aug"
               case .minor:
                    return "MIN"
               case .dim:
                    return "Dim"
               case .halfDim:
                    return "Half-Dim"
               case .flat5:
                    return "Flat 5"
               case .sharp5:
                    return "Sharp 5"
               case .doubleFlat7:
                    return "bb7"
               case .dominant:
                    return "Dominant"
               }
          }

          /// 返回与当前 BasicType 互斥的类型集合
          /// 互斥意味着在所有 ChordTypeBasic 中，这两个类型不可能同时出现
          public var exclusiveTypes: Set<BasicType> {
               return Self.exclusiveTypesCache[self] ?? []
          }

          /// 给定已选择的 BasicType 集合，返回所有可能与之共存的 BasicType
          /// 即：在 ChordTypeBasic.allCases 中存在至少一个和弦类型包含所有 selectedTypes + candidateType
          public static func compatibleTypes(with selectedTypes: Set<BasicType>) -> Set<BasicType> {
               guard !selectedTypes.isEmpty else {
                    // 如果没有选择，返回所有在任何和弦中出现过的类型
                    return Set(
                         allCases.filter { type in
                              ChordTypeBasic.allCases.contains { $0.info.basicType.contains(type) }
                         })
               }

               var compatible: Set<BasicType> = []
               for candidateType in allCases {
                    if selectedTypes.contains(candidateType) {
                         compatible.insert(candidateType)
                         continue
                    }
                    let testSet = selectedTypes.union([candidateType])
                    // 检查是否存在任何 ChordTypeBasic 包含 testSet 中的所有类型
                    let exists = ChordTypeBasic.allCases.contains { chordType in
                         testSet.allSatisfy { chordType.info.basicType.contains($0) }
                    }
                    if exists {
                         compatible.insert(candidateType)
                    }
               }
               return compatible
          }

          /// 预计算的互斥类型缓存
          nonisolated(unsafe) private static let exclusiveTypesCache: [BasicType: Set<BasicType>] =
               {
                    var cache: [BasicType: Set<BasicType>] = [:]
                    let allChordBasicTypes = ChordTypeBasic.allCases.map { $0.info.basicType }

                    for type in allCases {
                         var exclusives: Set<BasicType> = []
                         for otherType in allCases where otherType != type {
                              // 检查是否存在任何和弦同时包含 type 和 otherType
                              let coexists = allChordBasicTypes.contains { basicTypes in
                                   basicTypes.contains(type) && basicTypes.contains(otherType)
                              }
                              if !coexists {
                                   exclusives.insert(otherType)
                              }
                         }
                         cache[type] = exclusives
                    }
                    return cache
               }()
     }
}

extension ChordBasicInfo {
     // 把 basicName 与 basicNameAddition 组成一个新的名字
     // 例如 basicName: "M", basicNameAddition: [.d5],
     // 返回 M(b5)
     // 注意，basicNameAddition 有，在basicName后面添加一个数字音名（Interval.descriptionNumber）. 有就加括号，没有就不要加。
     public var basicNameFull: String {
          if basicNameAddition.isEmpty {
               return basicName
          }
          let additions = basicNameAddition.map { $0.descriptionNumber }.joined()
          return "\(basicName)(\(additions))"
     }
}

// 7音以下所有排列组合
public enum ChordTypeBasic: CaseIterable, ChordType {

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
     case minor7
     case dominant7
     case halfDiminished7
     case diminished7
     case major7Flat5
     case minorMajor7
     case majorDoubleFlat7
     case dominant7Flat5
     case majorFlat5DoubleFlat7
     case major7Sharp5
     case dominant7Sharp5
     case majorSharp5DoubleFlat7
     case minorDoubleFlat7
     case minorMajor7Flat5
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
                    basicName: "M",
                    shortName: "△",
                    cnName: "大三",
                    enName: "major triad",
                    intervals: [.M3, .P5],
                    basicType: [.triad, .major],
                    isDiatonic: true)
          case .augmentedTriad:
               return ChordBasicInfo(
                    basicName: "aug",
                    shortName: "+",
                    cnName: "增三",
                    enName: "augmented triad",
                    intervals: [.M3, .A5],
                    basicType: [.triad, .aug, .sharp5])
          case .majorFlatFiveTriad:
               return ChordBasicInfo(
                    basicName: "M",
                    basicNameAddition: [.d5],
                    shortName: "△",
                    cnName: "大三减五",
                    enName: "major triad flat five",
                    intervals: [.M3, .d5],
                    basicType: [.triad, .major, .flat5])
          case .minorTriad:
               return ChordBasicInfo(
                    basicName: "m",
                    shortName: "-",
                    cnName: "小三",
                    enName: "minor triad",
                    intervals: [.m3, .P5],
                    basicType: [.triad, .minor],
                    isDiatonic: true)
          case .minorAugmentedTriad:
               return ChordBasicInfo(
                    basicName: "m",
                    basicNameAddition: [.A5],
                    shortName: "-",
                    cnName: "小三增五",
                    enName: "minor augmented triad",
                    intervals: [.m3, .A5],
                    basicType: [.triad, .minor, .sharp5])
          case .diminishedTriad:
               return ChordBasicInfo(
                    basicName: "dim",
                    shortName: "°",
                    cnName: "减三",
                    enName: "diminished triad",
                    intervals: [.m3, .d5],
                    basicType: [.triad, .dim, .flat5],
                    isDiatonic: true)
          case .sus2:
               return ChordBasicInfo(
                    basicName: "sus2",
                    cnName: "挂二",
                    enName: "suspended 2",
                    intervals: [.M2, .P5],
                    basicType: [.triad, .sus2])
          case .sus2FlatFive:
               return ChordBasicInfo(
                    basicName: "sus2",
                    basicNameAddition: [.d5],
                    cnName: "挂二减五",
                    enName: "suspended 2 diminished 5",
                    intervals: [.M2, .d5],
                    basicType: [.triad, .sus2, .flat5])
          case .sus2SharpFive:
               return ChordBasicInfo(
                    basicName: "sus2",
                    basicNameAddition: [.A5],
                    cnName: "挂二增五",
                    enName: "suspended 2 augmented 5",
                    intervals: [.M2, .A5],
                    basicType: [.triad, .sus2, .sharp5])
          case .sus4:
               return ChordBasicInfo(
                    basicName: "sus4",
                    cnName: "挂四",
                    enName: "suspended 4",
                    intervals: [.P4, .P5],
                    basicType: [.triad, .sus4])
          case .sus4FlatFive:
               return ChordBasicInfo(
                    basicName: "sus4",
                    basicNameAddition: [.d5],
                    cnName: "挂四减五",
                    enName: "suspended 4 diminished 5",
                    intervals: [.P4, .d5],
                    basicType: [.triad, .sus4, .flat5])
          case .sus4SharpFive:
               return ChordBasicInfo(
                    basicName: "sus4",
                    basicNameAddition: [.A5],
                    cnName: "挂四增五",
                    enName: "suspended 4 augmented 5",
                    intervals: [.P4, .A5],
                    basicType: [.triad, .sus4, .sharp5])
          case .major7:
               return ChordBasicInfo(
                    basicName: "M7",
                    shortName: "△7",
                    cnName: "大七",
                    enName: "major 7th",
                    intervals: [.M3, .P5, .M7],
                    basicType: [.seventh, .major],
                    isDiatonic: true)
          case .dominant7:
               return ChordBasicInfo(
                    basicName: "7",
                    cnName: "属七",
                    enName: "dominant 7th",
                    intervals: [.M3, .P5, .m7],
                    basicType: [.seventh, .dominant],
                    isDiatonic: true)
          case .majorDoubleFlat7:
               return ChordBasicInfo(
                    basicName: "M",
                    basicNameAddition: [.d7],
                    shortName: "△",
                    cnName: "大三加重减七",
                    enName: "major triad double flat 7th",
                    intervals: [.M3, .P5, .d7],
                    basicType: [.seventh, .major, .doubleFlat7])
          case .major7Flat5:
               return ChordBasicInfo(
                    basicName: "M7",
                    basicNameAddition: [.d5],
                    shortName: "△7",
                    cnName: "大七减五",
                    enName: "major 7th flat 5th",
                    intervals: [.M3, .d5, .M7],
                    basicType: [.seventh, .major, .flat5])
          case .dominant7Flat5:
               return ChordBasicInfo(
                    basicName: "7",
                    basicNameAddition: [.d5],
                    cnName: "属七减五",
                    enName: "dominant 7th flat 5th",
                    intervals: [.M3, .d5, .m7],
                    basicType: [.seventh, .dominant, .flat5])
          case .majorFlat5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "M",
                    basicNameAddition: [.d5, .d7],
                    shortName: "△",
                    cnName: "大三减五重减七",
                    enName: "major flat 5th double flat 7th",
                    intervals: [.M3, .d5, .d7],
                    basicType: [.seventh, .major, .flat5, .doubleFlat7])
          case .major7Sharp5:
               return ChordBasicInfo(
                    basicName: "M7",
                    basicNameAddition: [.A5],
                    shortName: "△7",
                    cnName: "大七增五",
                    enName: "major 7th sharp 5th",
                    intervals: [.M3, .A5, .M7],
                    basicType: [.seventh, .aug, .sharp5])
          case .dominant7Sharp5:
               return ChordBasicInfo(
                    basicName: "7",
                    basicNameAddition: [.A5],
                    cnName: "属七增五",
                    enName: "dominant 7th sharp 5th",
                    intervals: [.M3, .A5, .m7],
                    basicType: [.seventh, .aug, .dominant, .sharp5])
          case .majorSharp5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "M",
                    basicNameAddition: [.A5, .d7],
                    shortName: "△",
                    cnName: "大三增五重减七",
                    enName: "major sharp 5th double flat 7th",
                    intervals: [.M3, .A5, .d7],
                    basicType: [.seventh, .aug, .sharp5, .doubleFlat7])
          case .minorMajor7:
               return ChordBasicInfo(
                    basicName: "mM7",
                    shortName: "-△7",
                    cnName: "小大七",
                    enName: "minor major 7th",
                    intervals: [.m3, .P5, .M7],
                    basicType: [.seventh, .minor])
          case .minor7:
               return ChordBasicInfo(
                    basicName: "m7",
                    shortName: "-7",
                    cnName: "小七",
                    enName: "minor 7th",
                    intervals: [.m3, .P5, .m7],
                    basicType: [.seventh, .minor],
                    isDiatonic: true)
          case .minorDoubleFlat7:
               return ChordBasicInfo(
                    basicName: "m",
                    basicNameAddition: [.d7],
                    shortName: "-",
                    cnName: "小三加重减七",
                    enName: "minor triad double flat 7th",
                    intervals: [.m3, .P5, .d7],
                    basicType: [.seventh, .minor, .doubleFlat7])
          case .minorMajor7Flat5:
               return ChordBasicInfo(
                    basicName: "mM7",
                    basicNameAddition: [.d5],
                    shortName: "-△7",
                    cnName: "小大七减五",
                    enName: "minor major 7th flat 5th",
                    intervals: [.m3, .d5, .M7],
                    basicType: [.seventh, .minor, .flat5])
          case .halfDiminished7:
               return ChordBasicInfo(
                    basicName: "m7",
                    basicNameAddition: [.d5],
                    shortName: "ø7",
                    cnName: "半减七",
                    enName: "half-diminished 7th",
                    intervals: [.m3, .d5, .m7],
                    basicType: [.seventh, .halfDim, .flat5],
                    isDiatonic: true)
          case .diminished7:
               return ChordBasicInfo(
                    basicName: "dim7",
                    shortName: "°7",
                    cnName: "减七",
                    enName: "diminished 7th",
                    intervals: [.m3, .d5, .d7],
                    basicType: [.seventh, .dim, .flat5, .doubleFlat7])
          case .minorMajor7Sharp5:
               return ChordBasicInfo(
                    basicName: "mM7",
                    basicNameAddition: [.A5],
                    shortName: "-△7",
                    cnName: "小大七增五",
                    enName: "minor major 7th sharp 5th",
                    intervals: [.m3, .A5, .M7],
                    basicType: [.seventh, .minor, .sharp5])
          case .minor7Sharp5:
               return ChordBasicInfo(
                    basicName: "m7",
                    basicNameAddition: [.A5],
                    shortName: "-7",
                    cnName: "小七增五",
                    enName: "minor 7th sharp 5th",
                    intervals: [.m3, .A5, .m7],
                    basicType: [.seventh, .minor, .sharp5])
          case .minorSharp5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "m",
                    basicNameAddition: [.A5, .d7],
                    shortName: "-",
                    cnName: "小三增五重减七",
                    enName: "minor sharp 5th double flat 7th",
                    intervals: [.m3, .A5, .d7],
                    basicType: [.seventh, .minor, .sharp5, .doubleFlat7])
          case .major7Sus2:
               return ChordBasicInfo(
                    basicName: "M7sus2",
                    shortName: "△7sus2",
                    cnName: "大七挂二",
                    enName: "major 7th suspended 2nd",
                    intervals: [.M2, .P5, .M7],
                    basicType: [.seventh, .sus2])
          case .dominant7Sus2:
               return ChordBasicInfo(
                    basicName: "7sus2",
                    cnName: "属七挂二",
                    enName: "dominant 7th suspended 2nd",
                    intervals: [.M2, .P5, .m7],
                    basicType: [.seventh, .sus2, .dominant])
          case .sus2DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "sus2",
                    basicNameAddition: [.d7],
                    cnName: "重减七挂二",
                    enName: "suspended 2nd double flat 7th",
                    intervals: [.M2, .P5, .d7],
                    basicType: [.seventh, .sus2, .doubleFlat7])
          case .major7Sus2Flat5:
               return ChordBasicInfo(
                    basicName: "M7sus2",
                    basicNameAddition: [.d5],
                    shortName: "△7sus2",
                    cnName: "大七挂二减五",
                    enName: "major 7th suspended 2nd flat 5th",
                    intervals: [.M2, .d5, .M7],
                    basicType: [.seventh, .sus2, .flat5])
          case .dominant7Sus2Flat5:
               return ChordBasicInfo(
                    basicName: "7sus2",
                    basicNameAddition: [.d5],
                    cnName: "属七挂二减五",
                    enName: "dominant 7th suspended 2nd flat 5th",
                    intervals: [.M2, .d5, .m7],
                    basicType: [.seventh, .sus2, .dominant, .flat5])
          case .sus2Flat5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "sus2",
                    basicNameAddition: [.d5, .d7],
                    cnName: "减七挂二减五",
                    enName: "suspended 2nd flat 5th double flat 7th",
                    intervals: [.M2, .d5, .d7],
                    basicType: [.seventh, .sus2, .flat5, .doubleFlat7])
          case .major7Sus2Sharp5:
               return ChordBasicInfo(
                    basicName: "M7sus2",
                    basicNameAddition: [.A5],
                    shortName: "△7sus2",
                    cnName: "大七挂二增五",
                    enName: "major 7th suspended 2nd sharp 5th",
                    intervals: [.M2, .A5, .M7],
                    basicType: [.seventh, .sus2, .sharp5])
          case .dominant7Sus2Sharp5:
               return ChordBasicInfo(
                    basicName: "7sus2",
                    basicNameAddition: [.A5],
                    cnName: "属七挂二增五",
                    enName: "dominant 7th suspended 2nd sharp 5th",
                    intervals: [.M2, .A5, .m7],
                    basicType: [.seventh, .sus2, .dominant, .sharp5])
          case .sus2Sharp5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "sus2",
                    basicNameAddition: [.A5, .d7],
                    cnName: "减七挂二增五",
                    enName: "suspended 2nd sharp 5th double flat 7th",
                    intervals: [.M2, .A5, .d7],
                    basicType: [.seventh, .sus2, .sharp5, .doubleFlat7])
          case .major7Sus4:
               return ChordBasicInfo(
                    basicName: "M7sus4",
                    shortName: "△7sus4",
                    cnName: "大七挂四",
                    enName: "major 7th suspended 4th",
                    intervals: [.P4, .P5, .M7],
                    basicType: [.seventh, .sus4])
          case .dominant7Sus4:
               return ChordBasicInfo(
                    basicName: "7sus4",
                    cnName: "属七挂四",
                    enName: "dominant 7th suspended 4th",
                    intervals: [.P4, .P5, .m7],
                    basicType: [.seventh, .sus4, .dominant])
          case .sus4DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "sus4",
                    basicNameAddition: [.d7],
                    cnName: "重减七挂四",
                    enName: "suspended 4th double flat 7th",
                    intervals: [.P4, .P5, .d7],
                    basicType: [.seventh, .sus4, .doubleFlat7])
          case .major7Sus4Flat5:
               return ChordBasicInfo(
                    basicName: "M7sus4",
                    basicNameAddition: [.d5],
                    shortName: "△7sus4",
                    cnName: "大七挂四减五",
                    enName: "major 7th suspended 4th flat 5th",
                    intervals: [.P4, .d5, .M7],
                    basicType: [.seventh, .sus4, .flat5])
          case .dominant7Sus4Flat5:
               return ChordBasicInfo(
                    basicName: "7sus4",
                    basicNameAddition: [.d5],
                    cnName: "属七挂四减五",
                    enName: "dominant 7th suspended 4th flat 5th",
                    intervals: [.P4, .d5, .m7],
                    basicType: [.seventh, .sus4, .dominant, .flat5])
          case .sus4Flat5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "sus4",
                    basicNameAddition: [.d5, .d7],
                    cnName: "减七挂四减五",
                    enName: "suspended 4th flat 5th double flat 7th",
                    intervals: [.P4, .d5, .d7],
                    basicType: [.seventh, .sus4, .flat5, .doubleFlat7])
          case .major7Sus4Sharp5:
               return ChordBasicInfo(
                    basicName: "M7sus4",
                    basicNameAddition: [.A5],
                    shortName: "△7sus4",
                    cnName: "大七挂四增五",
                    enName: "major 7th suspended 4th sharp 5th",
                    intervals: [.P4, .A5, .M7],
                    basicType: [.seventh, .sus4, .sharp5])
          case .dominant7Sus4Sharp5:
               return ChordBasicInfo(
                    basicName: "7sus4",
                    basicNameAddition: [.A5],
                    cnName: "属七挂四增五",
                    enName: "dominant 7th suspended 4th sharp 5th",
                    intervals: [.P4, .A5, .m7],
                    basicType: [.seventh, .sus4, .dominant, .sharp5])
          case .sus4Sharp5DoubleFlat7:
               return ChordBasicInfo(
                    basicName: "sus4",
                    basicNameAddition: [.A5, .d7],
                    cnName: "减七挂四增五",
                    enName: "suspended 4th sharp 5th double flat 7th",
                    intervals: [.P4, .A5, .d7],
                    basicType: [.seventh, .sus4, .sharp5, .doubleFlat7])
          case .major6:
               return ChordBasicInfo(
                    basicName: "6",
                    cnName: "大六",
                    enName: "major 6th",
                    intervals: [.M3, .P5, .M6],
                    basicType: [.sixth, .major])
          case .augmented6:
               return ChordBasicInfo(
                    basicName: "aug6",
                    shortName: "+6",
                    cnName: "增六",
                    enName: "augmented 6th",
                    intervals: [.M3, .A5, .M6],
                    basicType: [.sixth, .aug, .sharp5])
          case .major6Flat5:
               return ChordBasicInfo(
                    basicName: "6",
                    basicNameAddition: [.d5],
                    cnName: "大六减五",
                    enName: "major 6th flat 5th",
                    intervals: [.M3, .d5, .M6],
                    basicType: [.sixth, .major, .flat5])
          case .minor6:
               return ChordBasicInfo(
                    basicName: "m6",
                    shortName: "-6",
                    cnName: "小六",
                    enName: "minor 6th",
                    intervals: [.m3, .P5, .M6],
                    basicType: [.sixth, .minor])
          case .minor6Sharp5:
               return ChordBasicInfo(
                    basicName: "m6",
                    basicNameAddition: [.A5],
                    shortName: "-6",
                    cnName: "小六增五",
                    enName: "minor 6th sharp 5th",
                    intervals: [.m3, .A5, .M6],
                    basicType: [.sixth, .minor, .sharp5])
          case .diminished6:
               return ChordBasicInfo(
                    basicName: "dim6",
                    shortName: "°6",
                    cnName: "减六",
                    enName: "diminished 6th",
                    intervals: [.m3, .d5, .M6],
                    basicType: [.sixth, .dim, .flat5])
          case .major6Sus2:
               return ChordBasicInfo(
                    basicName: "6sus2",
                    cnName: "大六挂二",
                    enName: "major 6th suspended 2nd",
                    intervals: [.M2, .P5, .M6],
                    basicType: [.sixth, .sus2])
          case .major6Sus2Sharp5:
               return ChordBasicInfo(
                    basicName: "6sus2",
                    basicNameAddition: [.A5],
                    cnName: "大六挂二增五",
                    enName: "major 6th suspended 2nd sharp 5th",
                    intervals: [.M2, .A5, .M6],
                    basicType: [.sixth, .sus2, .sharp5])
          case .major6Sus2Flat5:
               return ChordBasicInfo(
                    basicName: "6sus2",
                    basicNameAddition: [.d5],
                    cnName: "大六挂二减五",
                    enName: "major 6th suspended 2nd flat 5th",
                    intervals: [.M2, .d5, .M6],
                    basicType: [.sixth, .sus2, .flat5])
          case .major6Sus4:
               return ChordBasicInfo(
                    basicName: "6sus4",
                    cnName: "大六挂四",
                    enName: "major 6th suspended 4th",
                    intervals: [.P4, .P5, .M6],
                    basicType: [.sixth, .sus4])
          case .major6Sus4Sharp5:
               return ChordBasicInfo(
                    basicName: "6sus4",
                    basicNameAddition: [.A5],
                    cnName: "大六挂四增五",
                    enName: "major 6th suspended 4th sharp 5th",
                    intervals: [.P4, .A5, .M6],
                    basicType: [.sixth, .sus4, .sharp5])
          case .major6Sus4Flat5:
               return ChordBasicInfo(
                    basicName: "6sus4",
                    basicNameAddition: [.d5],
                    cnName: "大六挂四减五",
                    enName: "major 6th suspended 4th flat 5th",
                    intervals: [.P4, .d5, .M6],
                    basicType: [.sixth, .sus4, .flat5])
          }
     }
}

//public enum ChordTypeAdvance: CaseIterable, ChordType {
//     case majorSixNinth
//     case major9
//     case dominant9
//     case minor9
//     case major11
//     case dominant11
//     case minor11
//     case major13
//     case dominant13
//     case minor13
//     case major7Sharp11
//     case dominant7Sharp11
//     case dominant7Flat9
//     case dominant7Sharp9
//
//     public var info: ChordBasicInfo {
//          switch self {
//          case .majorSixNinth:
//               return ChordBasicInfo(
//                    basicName: "69",
//                    cnName: "六九",
//                    enName: "six nine",
//                    intervals: [.M3, .P5, .M6, .M9],
//                    basicType: .sixth)
//          case .major9:
//               return ChordBasicInfo(
//                    basicName: "M9",
//                    cnName: "大九",
//                    enName: "major 9th",
//                    intervals: [.M3, .P5, .M7, .M9],
//                    basicType: .seventh)
//          case .dominant9:
//               return ChordBasicInfo(
//                    basicName: "9",
//                    cnName: "属九",
//                    enName: "dominant 9th",
//                    intervals: [.M3, .P5, .m7, .M9],
//                    basicType: .seventh)
//          case .minor9:
//               return ChordBasicInfo(
//                    basicName: "m9",
//                    cnName: "小九",
//                    enName: "minor 9th",
//                    intervals: [.m3, .P5, .m7, .M9],
//                    basicType: .seventh)
//          case .major11:
//               return ChordBasicInfo(
//                    basicName: "M11",
//                    cnName: "大十一",
//                    enName: "major 11th",
//                    intervals: [.M3, .P5, .M7, .M9, .P11],
//                    basicType: .seventh)
//          case .dominant11:
//               return ChordBasicInfo(
//                    basicName: "11",
//                    cnName: "属十一",
//                    enName: "dominant 11th",
//                    intervals: [.M3, .P5, .m7, .M9, .P11],
//                    basicType: .seventh)
//          case .minor11:
//               return ChordBasicInfo(
//                    basicName: "m11",
//                    cnName: "小十一",
//                    enName: "minor 11th",
//                    intervals: [.m3, .P5, .m7, .M9, .P11],
//                    basicType: .seventh)
//          case .major13:
//               return ChordBasicInfo(
//                    basicName: "M13",
//                    cnName: "大十三",
//                    enName: "major 13th",
//                    intervals: [.M3, .P5, .M7, .M9, .M13],
//                    basicType: .seventh)
//          case .dominant13:
//               return ChordBasicInfo(
//                    basicName: "13",
//                    cnName: "属十三",
//                    enName: "dominant 13th",
//                    intervals: [.M3, .P5, .m7, .M9, .M13],
//                    basicType: .seventh)
//          case .minor13:
//               return ChordBasicInfo(
//                    basicName: "m13",
//                    cnName: "小十三",
//                    enName: "minor 13th",
//                    intervals: [.m3, .P5, .m7, .M9, .M13],
//                    basicType: .seventh)
//          case .major7Sharp11:
//               return ChordBasicInfo(
//                    basicName: "M7",
//                    basicNameAddition: [.A11],
//                    cnName: "大七升十一",
//                    enName: "major 7th sharp 11th",
//                    intervals: [.M3, .P5, .M7, .A11],
//                    basicType: .seventh)
//          case .dominant7Sharp11:
//               return ChordBasicInfo(
//                    basicName: "7",
//                    basicNameAddition: [.A11],
//                    cnName: "属七升十一",
//                    enName: "dominant 7th sharp 11th",
//                    intervals: [.M3, .P5, .m7, .A11],
//                    basicType: .seventh)
//          case .dominant7Flat9:
//               return ChordBasicInfo(
//                    basicName: "7",
//                    basicNameAddition: [.m9],
//                    cnName: "属七降九",
//                    enName: "dominant 7th flat 9th",
//                    intervals: [.M3, .P5, .m7, .m9],
//                    basicType: .seventh)
//          case .dominant7Sharp9:
//               return ChordBasicInfo(
//                    basicName: "7",
//                    basicNameAddition: [.A9],
//                    cnName: "属七升九",
//                    enName: "dominant 7th sharp 9th",
//                    intervals: [.M3, .P5, .m7, .A9],
//                    basicType: .seventh)
//          }
//     }
//}

public protocol ChordType {
     var info: ChordBasicInfo { get }
}
