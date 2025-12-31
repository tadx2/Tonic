//
//  Chord.swift
//  fantachord
//
//  Created by 小汤汤 on 2025/4/22.
//


public struct ChordBasicInfo: Codable, Hashable, Sendable {
    var DNA: [Int?]
    var sysName: String
    var handName: String
    var firstClass: String
    public var secondClass: String
    var priority: Int
    public var cnNameString: String
    public var enNameString: String
}

// priority: 5 属于调内和弦 dim和弦
// priority: 4 属于替代性质的，但不属于常用调内和弦，如比较常用,sus2,sus4和弦，6和弦，aug和弦
// priority: 3 不常用的sus2,sus4和弦
// priority: 2 含（b5/#5）的和弦，一般不会这样去标记。这样标记可能会让
// priority: 1 含（bb7）的和弦

let ChordBasicInfoList: [ChordBasicInfo] = [
    
    //
    // 3th chord
    // 3th chord basic
    //
    
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 7, nil, nil],
        sysName: "M",
        handName: "",
        firstClass: "3th_chord",
        secondClass: "3th_basic",
        priority: 5,
        cnNameString: "大三",
        enNameString: "major triad"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 8, nil, nil],
        sysName: "aug",
        handName: "+",
        firstClass: "3th_chord",
        secondClass: "3th_basic",
        priority: 4,
        cnNameString: "增三",
        enNameString: "augmented triad"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 6, nil, nil],
        sysName: "M(♭5)",
        handName: "M(♭5)",
        firstClass: "3th_chord",
        secondClass: "3th_basic",
        priority: 2,
        cnNameString: "大三减五",
        enNameString: "major triad flat five"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 7, nil, nil],
        sysName: "m",
        handName: "-",
        firstClass: "3th_chord",
        secondClass: "3th_basic",
        priority: 5,
        cnNameString: "小三",
        enNameString: "minor triad"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 8, nil, nil],
        sysName: "m(♯5)",
        handName: "m+",
        firstClass: "3th_chord",
        secondClass: "3th_basic",
        priority: 2,
        cnNameString: "小三增五",
        enNameString: "minor augmented triad"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 6, nil, nil],
        sysName: "dim",
        handName: "°",
        firstClass: "3th_chord",
        secondClass: "3th_basic",
        priority: 5,
        cnNameString: "减三",
        enNameString: "diminished triad"
    ),
    
    //
    // 3th chord
    // 3th chord sus2
    //
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 7, nil, nil],
        sysName: "sus2",
        handName: "sus2",
        firstClass: "3th_chord",
        secondClass: "3th_sus2",
        priority: 4,
        cnNameString: "挂二",
        enNameString: "suspended 2 chord"
    ),
    
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 6, nil, nil],
        sysName: "sus2(♭5)",
        handName: "sus2(♭5)",
        firstClass: "3th_chord",
        secondClass: "3th_sus2",
        priority: 2,
        cnNameString: "挂二减五",
        enNameString: "suspended 2 diminished 5 chord"
    ),
    
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 8, nil, nil],
        sysName: "sus2(♯5)",
        handName: "sus2(♯5)",
        firstClass: "3th_chord",
        secondClass: "3th_sus2",
        priority: 2,
        cnNameString: "挂二增五",
        enNameString: "suspended 2 augmented 5 chord"
    ),
    
    //
    // 3th chord
    // 3th chord sus4
    //
    
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 7, nil, nil],
        sysName: "sus4",
        handName: "sus4",
        firstClass: "3th_chord",
        secondClass: "3th_sus4",
        priority: 4,
        cnNameString: "挂四",
        enNameString: "suspended 4 chord"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 6, nil, nil],
        sysName: "sus4(♭5)",
        handName: "sus4(♭5)",
        firstClass: "3th_chord",
        secondClass: "3th_sus4",
        priority: 2,
        cnNameString: "挂四减五",
        enNameString: "suspended 4 diminished 5 chord"
    ),
    
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 8, nil, nil],
        sysName: "sus4(♯5)",
        handName: "sus4(♯5)",
        firstClass: "3th_chord",
        secondClass: "3th_sus4",
        priority: 2,
        cnNameString: "挂四增五",
        enNameString: "suspended 4 augmented 5 chord"
    ),
    
    //
    // 7th chord
    // 7th chord
    //
    
    // 7-1-1
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 7, nil, 11],
        sysName: "M7",
        handName: "△",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 5,
        cnNameString: "大七",
        enNameString: "major 7th chord"
    ),
    
    // 7-1-2
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 7, nil, 10],
        sysName: "7",
        handName: "7",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 5,
        cnNameString: "属七",
        enNameString: "dominant 7th chord"
    ),
    
    // 7-1-3
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 7, nil, 9],
        sysName: "M(𝄫7)",
        handName: "M(𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 1,
        cnNameString: "大三加重减七",
        enNameString: "major triad double flat 7th chord"
    ),
    
    // 7-1-4
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 6, nil, 11],
        sysName: "M7(♭5)",
        handName: "△(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "大七减五",
        enNameString: "major 7th flat 5th chord"
    ),
    
    // 7-1-5
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 6, nil, 10],
        sysName: "7(♭5)",
        handName: "7(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "属七减五",
        enNameString: "dominant 7th flat 5th chord"
    ),
    
    // 7-1-6
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 6, nil, 9],
        sysName: "M(♭5 𝄫7)",
        handName: "M(♭5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 1,
        cnNameString: "大三减五重减七",
        enNameString: "major flat 5th double flat 7th chord"
    ),
    
    // 7-1-7
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 8, nil, 11],
        sysName: "M7(♯5)",
        handName: "△(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "大七增五",
        enNameString: "major 7th sharp 5th chord"
    ),
    
    // 7-1-8
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 8, nil, 10],
        sysName: "7(♯5)",
        handName: "7(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "属七增五",
        enNameString: "dominant 7th sharp 5th chord"
    ),
    
    // 7-1-9
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 8, nil, 9],
        sysName: "M(♯5 𝄫7)",
        handName: "M(♯5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 1,
        cnNameString: "大三增五重减七",
        enNameString: "major sharp 5th double flat 7th chord"
    ),
    
    // 7-1-10
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 7, nil, 11],
        sysName: "mM7",
        handName: "mM7",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 4,
        cnNameString: "小大七",
        enNameString: "minor major 7th chord"
    ),
    
    // 7-1-11
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 7, nil, 10],
        sysName: "m7",
        handName: "-7",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 5,
        cnNameString: "小七",
        enNameString: "minor 7th chord"
    ),
    
    // 7-1-12
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 7, nil, 9],
        sysName: "m(𝄫7)",
        handName: "-(𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 1,
        cnNameString: "小三加重减七",
        enNameString: "minor triad double flat 7th chord"
    ),
    
    // 7-1-13
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 6, nil, 11],
        sysName: "mM7(♭5)",
        handName: "mM7(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "小大七减五",
        enNameString: "minor major 7th flat 5th chord"
    ),
    
    // 7-1-14
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 6, nil, 10],
        sysName: "m7(♭5)",
        handName: "ø7",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "半减七",
        enNameString: "half-diminished 7th chord"
    ),
    
    // 7-1-15
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 6, nil, 9],
        sysName: "dim7",
        handName: "°7",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 5,
        cnNameString: "减七",
        enNameString: "diminished 7th chord"
    ),
    
    // 7-1-16
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 8, nil, 11],
        sysName: "mM7(♯5)",
        handName: "mM7(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "小大七增五",
        enNameString: "minor major 7th sharp 5th chord"
    ),
    
    // 7-1-17
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 8, nil, 10],
        sysName: "m7(♯5)",
        handName: "-7(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 2,
        cnNameString: "小七增五",
        enNameString: "minor 7th sharp 5th chord"
    ),
    
    // 7-1-18
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 8, nil, 9],
        sysName: "m(♯5 𝄫7)",
        handName: "-(♯5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_basic",
        priority: 1,
        cnNameString: "小三增五重减七",
        enNameString: "minor sharp 5th double flat 7th chord"
    ),
    
    //
    // 7th chord
    // 7th sus2 chord
    //
    
    // 7-2-1
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 7, nil, 11],
        sysName: "M7sus2",
        handName: "△sus2",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 4,
        cnNameString: "大七挂二",
        enNameString: "major 7th suspended 2nd chord"
    ),
    
    // 7-2-2
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 7, nil, 10],
        sysName: "7sus2",
        handName: "7sus2",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 4,
        cnNameString: "属七挂二",
        enNameString: "dominant 7th suspended 2nd chord"
    ),
    
    // 7-2-3
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 7, nil, 9],
        sysName: "sus2(𝄫7)",
        handName: "sus2(𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 1,
        cnNameString: "重减七挂二",
        enNameString: "suspended 2nd double flat 7th chord"
    ),
    
    // 7-2-4
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 6, nil, 11],
        sysName: "M7sus2(♭5)",
        handName: "△sus2(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 2,
        cnNameString: "大七挂二减五",
        enNameString: "major 7th suspended 2nd flat 5th chord"
    ),
    
    // 7-2-5
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 6, nil, 10],
        sysName: "7sus2(♭5)",
        handName: "7sus2(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 2,
        cnNameString: "属七挂二减五",
        enNameString: "dominant 7th suspended 2nd flat 5th chord"
    ),
    
    // 7-2-6
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 6, nil, 9],
        sysName: "sus2(♭5 𝄫7)",
        handName: "sus2(♭5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 1,
        cnNameString: "减七挂二减五",
        enNameString: "suspended 2nd flat 5th double flat 7th chord"
    ),
    
    // 7-2-7
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 8, nil, 11],
        sysName: "M7sus2(♯5)",
        handName: "△sus2(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 2,
        cnNameString: "大七挂二增五",
        enNameString: "major 7th suspended 2nd sharp 5th chord"
    ),
    
    // 7-2-8
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 8, nil, 10],
        sysName: "7sus2(♯5)",
        handName: "7sus2(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 2,
        cnNameString: "属七挂二增五",
        enNameString: "dominant 7th suspended 2nd sharp 5th chord"
    ),
    
    // 7-2-9
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 8, nil, 9],
        sysName: "sus2(♯5 𝄫7)",
        handName: "sus2(♯5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_sus2",
        priority: 1,
        cnNameString: "减七挂二增五",
        enNameString: "suspended 2nd sharp 5th double flat 7th chord"
    ),
    
    //
    // 7th chord
    // 7th sus4 chord
    //
    
    // 7-3-1
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 7, nil, 11],
        sysName: "M7sus4",
        handName: "△sus4",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 4,
        cnNameString: "大七挂四",
        enNameString: "major 7th suspended 4th chord"
    ),
    
    // 7-3-2
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 7, nil, 10],
        sysName: "7sus4",
        handName: "7sus4",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 4,
        cnNameString: "属七挂四",
        enNameString: "dominant 7th suspended 4th chord"
    ),

    // 7-3-3
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 7, nil, 9],
        sysName: "sus4(𝄫7)",
        handName: "sus4(𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 1,
        cnNameString: "重减七挂四",
        enNameString: "suspended 4th double flat 7th chord"
    ),

    // 7-3-4
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 6, nil, 11],
        sysName: "M7sus4(♭5)",
        handName: "△sus4(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 2,
        cnNameString: "大七挂四减五",
        enNameString: "major 7th suspended 4th flat 5th chord"
    ),

    // 7-3-5
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 6, nil, 10],
        sysName: "7sus4(♭5)",
        handName: "7sus4(♭5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 2,
        cnNameString: "属七挂四减五",
        enNameString: "dominant 7th suspended 4th flat 5th chord"
    ),

    // 7-3-6
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 6, nil, 9],
        sysName: "sus4(♭5 𝄫7)",
        handName: "sus4(♭5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 1,
        cnNameString: "减七挂四减五",
        enNameString: "suspended 4th flat 5th double flat 7th chord"
    ),

    // 7-3-7
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 8, nil, 11],
        sysName: "M7sus4(♯5)",
        handName: "△sus4(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 2,
        cnNameString: "大七挂四增五",
        enNameString: "major 7th suspended 4th sharp 5th chord"
    ),
    
    // 7-3-8
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 8, nil, 10],
        sysName: "7sus4(♯5)",
        handName: "7sus4(♯5)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 2,
        cnNameString: "属七挂四增五",
        enNameString: "dominant 7th suspended 4th sharp 5th chord"
    ),
    
    // 7-3-9
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 8, nil, 9],
        sysName: "sus4(♯5 𝄫7)",
        handName: "sus4(♯5 𝄫7)",
        firstClass: "7th_chord",
        secondClass: "7th_sus4",
        priority: 1,
        cnNameString: "减七挂四增五",
        enNameString: "suspended 4th sharp 5th double flat 7th chord"
    ),
    
    //
    // 6th chord
    // 6th basic chord
    //
    
    // 6basic
    // 6-1-1
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 7, 9, nil],
        sysName: "6",
        handName: "6",
        firstClass: "6th_chord",
        secondClass: "6th_basic",
        priority: 4,
        cnNameString: "大六",
        enNameString: "major 6th chord"
    ),
    
    // 6-1-2
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 8, 9, nil],
        sysName: "aug6",
        handName: "+6",
        firstClass: "6th_chord",
        secondClass: "6th_basic",
        priority: 3,
        cnNameString: "增六",
        enNameString: "augmented 6th chord"
    ),
    
    // 6-1-3
    ChordBasicInfo(
        DNA: [0, nil, 4, nil, 6, 9, nil],
        sysName: "6(♭5)",
        handName: "6(♭5)",
        firstClass: "6th_chord",
        secondClass: "6th_basic",
        priority: 2,
        cnNameString: "大六减五",
        enNameString: "major 6th flat 5th chord"
    ),
    
    // 6-1-4
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 7, 9, nil],
        sysName: "m6",
        handName: "-6",
        firstClass: "6th_chord",
        secondClass: "6th_basic",
        priority: 3,
        cnNameString: "小六",
        enNameString: "minor 6th chord"
    ),
    
    // 6-1-5
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 8, 9, nil],
        sysName: "m6(♯5)",
        handName: "-6(♯5)",
        firstClass: "6th_chord",
        secondClass: "6th_basic",
        priority: 2,
        cnNameString: "小六增五",
        enNameString: "minor 6th sharp 5th chord"
    ),
    
    // 6-1-6
    ChordBasicInfo(
        DNA: [0, nil, 3, nil, 6, 9, nil],
        sysName: "dim6",
        handName: "°6",
        firstClass: "6th_chord",
        secondClass: "6th_basic",
        priority: 3,
        cnNameString: "减六",
        enNameString: "diminished 6th chord"
    ),
    
    // 6sus2
    // 6-2-1
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 7, 9, nil],
        sysName: "6sus2",
        handName: "6sus2",
        firstClass: "6th_chord",
        secondClass: "6th_sus2",
        priority: 3, // 虽然是sus2和弦，但是和7sus2相比较，6sus2的优先级要小
        cnNameString: "大六挂二",
        enNameString: "major 6th suspended 2nd chord"
    ),
    
    // 6-2-2
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 8, 9, nil],
        sysName: "6sus2(♯5)",
        handName: "6sus2(♯5)",
        firstClass: "6th_chord",
        secondClass: "6th_sus2",
        priority: 2, // 比普通的（#5优先级还要小）
        cnNameString: "大六挂二增五",
        enNameString: "major 6th suspended 2nd sharp 5th chord"
    ),
    
    // 6-2-3
    ChordBasicInfo(
        DNA: [0, 2, nil, nil, 6, 9, nil],
        sysName: "6sus2(♭5)",
        handName: "6sus2(♭5)",
        firstClass: "6th_chord",
        secondClass: "6th_sus2",
        priority: 2,
        cnNameString: "大六挂二减五",
        enNameString: "major 6th suspended 2nd flat 5th chord"
    ),
    
    // 6sus4
    // 6-4-1
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 7, 9, nil],
        sysName: "6sus4",
        handName: "6sus4",
        firstClass: "6th_chord",
        secondClass: "6th_sus4",
        priority: 3,
        cnNameString: "大六挂四",
        enNameString: "major 6th suspended 4th chord"
    ),
    
    // 6-4-2
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 8, 9, nil],
        sysName: "6sus4(♯5)",
        handName: "6sus4(♯5)",
        firstClass: "6th_chord",
        secondClass: "6th_sus4",
        priority: 2,
        cnNameString: "大六挂四增五",
        enNameString: "major 6th suspended 4th sharp 5th chord"
    ),
    
    // 6-4-3
    ChordBasicInfo(
        DNA: [0, nil, nil, 5, 6, 9, nil],
        sysName: "6sus4(♭5)",
        handName: "6sus4(♭5)",
        firstClass: "6th_chord",
        secondClass: "6th_sus4",
        priority: 2,
        cnNameString: "大六挂四减五",
        enNameString: "major 6th suspended 4th flat 5th chord"
    ),
]
