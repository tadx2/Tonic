////
////  File.swift
////  Tonic
////
////  Created by 小汤汤 on 3/5/26.
////
//
//
//public typealias ChordSymbolPartAddition = [ChordSymbolNumber]
//
//extension ChordSymbolPartAddition {
//    
//    public func displayString(mode: DisplayMode) -> String {
//        var contents = self.map { $0.displayString }.joined(separator: " ")
//        guard !contents.isEmpty else { return "" }
//        
//        switch mode {
//        case .parentheses:
//            return "(\(contents))"
//        case .add:
//            return " add \(contents)"
//        }
//        
//    }
//    
//    public static func normalizeAdditon(
//        _ addition: ChordSymbolPartAddition
//    ) -> ChordSymbolPartAddition {
//
//        // 删除相同的元素，保证 ChordSymbolPartAddition 里面的元素唯一
//        var seen: Set<ChordSymbolNumber> = []
//        let unique = addition.filter { seen.insert($0).inserted }
//        return unique.sorted(by: { $0.number?.rawValue ?? 0 < $1.number?.rawValue ?? 0 })
//    }
//    
//    public enum DisplayMode: CaseIterable, CustomStringConvertible {
//        case parentheses, add
//        
//        public var description: String{
//            switch self {
//            case .parentheses:
//                "parentheses"
//            case .add:
//                "add"
//            }
//        }
//
//    }
//}
