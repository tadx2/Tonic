# ChordRaw 测试套件

ChordRaw 结构的通用测试套件，包含和弦构成音、音程、音名等相关测试。

## 如何运行 ChordRaw 测试

### 运行所有 ChordRaw 测试
```bash
swift test --filter "ChordRaw"
```

### 运行特定测试文件

#### 运行 getNoteName 相关测试
```bash
swift test --filter "ChordRawTests_getNoteName"
```

这将运行所有 `getNoteName` 方法的测试，包括：
- 三和弦测试（大三、小三、减三）
- 七和弦测试（大七、小七、属七、减七、半减七）
- 九和弦测试（大九、小九、属九等）
- 十三和弦测试
- Sus 和弦测试
- 复杂和弦测试

### 运行特定测试用例

#### 测试特定和弦类型
```bash
# 测试所有三和弦
swift test --filter "Triad"

# 测试所有七和弦
swift test --filter "7th"

# 测试所有九和弦
swift test --filter "9th"

# 测试十三和弦
swift test --filter "13th"

# 测试 Sus 和弦
swift test --filter "Sus"
```

#### 测试单个和弦类型
```bash
# 测试大三和弦
swift test --filter "testGetNoteName_MajorTriad"

# 测试小七和弦
swift test --filter "testGetNoteName_Minor7th"

# 测试属九和弦
swift test --filter "testGetNoteName_Dominant9th"

# 测试大十三和弦
swift test --filter "testGetNoteName_Major13th"
```

### 快速参考表

| 命令 | 说明 |
|------|------|
| `swift test --filter "ChordRaw"` | 所有 ChordRaw 相关测试 |
| `swift test --filter "ChordRawTests_getNoteName"` | 所有 getNoteName 测试 |
| `swift test --filter "Triad"` | 所有三和弦测试 |
| `swift test --filter "7th"` | 所有七和弦测试 |
| `swift test --filter "9th"` | 所有九和弦测试 |
| `swift test --filter "testGetNoteName_MajorTriad"` | 大三和弦测试 |

## 测试文件结构

所有 ChordRaw 测试文件都位于 `Tests/TonicTests/ChordRawTests/` 目录下：
- `ChordRawTests_getNoteName.swift` - getNoteName 方法的全面测试

## 测试覆盖范围

### ChordRawTests_getNoteName.swift
测试 `getNoteName(by:)` 方法，验证和弦各音级的音名是否正确：

#### 三和弦 (Triads)
- 大三和弦 (Major): C E G
- 小三和弦 (Minor): C E♭ G
- 减三和弦 (Diminished): C E♭ G♭

#### 七和弦 (Seventh Chords)
- 大七和弦 (Major 7th): C E G B
- 小七和弦 (Minor 7th): C E♭ G B♭
- 属七和弦 (Dominant 7th): C E G B♭
- 减七和弦 (Diminished 7th): C E♭ G♭ B♭♭
- 半减七和弦 (Half Diminished): C E♭ G♭ B♭

#### 九和弦 (Ninth Chords)
- 大九和弦 (Major 9th): C E G B D
- 小九和弦 (Minor 9th): C E♭ G B♭ D
- 属九和弦 (Dominant 9th): C E G B♭ D
- 小七降五降九 (m7♭5♭9): C E♭ G♭ B♭ D♭
- 减降九 (dim♭9): C E♭ G♭ B♭♭ D♭
- 小七降九 (m7♭9): C E♭ G B♭ D♭

#### 十三和弦 (Thirteenth Chords)
- 大十三和弦 (Major 13th): C E G B D F A

#### Sus 和弦
- Sus2: C D G

#### 复杂和弦
- 7♯9♭13: C E G B♭ D♯ A♭
- M7sus4♭5: C F G♭ B
- m9♭13: C E♭ G B♭ D A♭
- m9♯11♭13: C E♭ G B♭ D F♯ A♭
- m9♭5♯11♭13: C E♭ G♭ B♭ D F♯ A♭
- M♭9♯11♭13: C E♭ G D♭ F♯ A♭

#### 不同根音
测试不同根音的和弦（D Major, F Minor, A♭ Major 7 等）

## Swift Testing 框架说明

本项目使用 Swift Testing 框架（而非 XCTest）。主要特点：
- 使用 `@Test` 注解标记测试方法
- 使用 `@Suite` 注解标记测试套件
- 使用 `#expect()` 进行断言（而非 XCTAssert）
- 支持更灵活的测试过滤和组织

## 相关资源

- [Swift Testing 文档](https://developer.apple.com/documentation/testing)
- [ChordRaw 源代码](../../../Sources/Tonic/src/ChordRaw.swift)
