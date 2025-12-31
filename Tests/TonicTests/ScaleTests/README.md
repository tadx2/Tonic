Scale 结构的通用测试套件

## 如何运行 Scale 测试

### 运行所有 Scale 测试
```bash
swift test --filter "ScaleTests"
```

### 常用的过滤示例

#### 测试特定音阶类型
```bash
# 测试所有大调相关的音阶（Major Scale 和 Major Blues Scale）
swift test --filter "ScaleTests_Major"
# 结果: 98 tests (Major: 49 + MajorBlues: 49)

# 测试所有小调相关的音阶
swift test --filter "Minor"
# 包括: Natural Minor, Harmonic Minor, Melodic Minor, Pentatonic Minor
# 结果: 196 tests (4种 × 49)

# 测试所有五声音阶
swift test --filter "Pentatonic"
# 结果: 98 tests (PentatonicMajor: 49 + PentatonicMinor: 49)

# 测试所有布鲁斯音阶
swift test --filter "Blues"
# 结果: 98 tests (Blues: 49 + MajorBlues: 49)

# 测试所有调式音阶（Modes）
swift test --filter "Dorian\|Phrygian\|Lydian\|Mixolydian\|Locrian"
# 结果: 245 tests (5种 × 49)

# 测试特殊音阶
swift test --filter "Chromatic\|WholeTone\|Diminished"
# 结果: 147 tests (Chromatic: 49 + WholeTone: 49 + Diminished: 49)
```

#### 测试单个音阶类型
```bash
swift test --filter "ScaleTests_Major"           # 自然大调 (49 tests)
swift test --filter "ScaleTests_NaturalMinor"    # 自然小调 (49 tests)
swift test --filter "ScaleTests_HarmonicMinor"   # 和声小调 (49 tests)
swift test --filter "ScaleTests_MelodicMinor"    # 旋律小调 (49 tests)
swift test --filter "ScaleTests_Dorian"          # 多利亚调式 (49 tests)
swift test --filter "ScaleTests_Phrygian"        # 弗里几亚调式 (49 tests)
swift test --filter "ScaleTests_Lydian"          # 利底亚调式 (49 tests)
swift test --filter "ScaleTests_Mixolydian"      # 混合利底亚调式 (49 tests)
swift test --filter "ScaleTests_Locrian"         # 洛克里亚调式 (49 tests)
swift test --filter "ScaleTests_PentatonicMajor" # 大调五声音阶 (49 tests)
swift test --filter "ScaleTests_PentatonicMinor" # 小调五声音阶 (49 tests)
swift test --filter "ScaleTests_Blues"           # 布鲁斯音阶 (49 tests)
swift test --filter "ScaleTests_MajorBlues"      # 大调布鲁斯音阶 (49 tests)
swift test --filter "ScaleTests_WholeTone"       # 全音阶 (49 tests)
swift test --filter "ScaleTests_Diminished"      # 减音阶 (49 tests)
swift test --filter "ScaleTests_WholeDiminished" # 全减音阶 (49 tests)
swift test --filter "ScaleTests_Chromatic"       # 半音阶 (49 tests)
```

#### 快速参考表
| 命令 | 测试数量 | 说明 |
|------|---------|------|
| `swift test --filter "ScaleTests"` | 843 | 所有 Scale 相关测试 |
| `swift test --filter "ScaleTests_Major"` | 49 | 自然大调 |
| `swift test --filter "Minor"` | 196 | 所有小调音阶 (4种) |
| `swift test --filter "Pentatonic"` | 98 | 五声音阶 (2种) |
| `swift test --filter "Blues"` | 98 | 布鲁斯音阶 (2种) |

## 测试文件结构
所有 Scale 测试文件都位于 `Tests/TonicTests/ScaleTests/` 目录下：
- ScaleTests.swift - 通用测试（初始化、属性、边界情况等）
- ScaleTests_*.swift - 各种音阶类型的全面测试（每种 49 个测试用例）

## 测试覆盖范围
每个音阶类型测试文件包含 49 个测试用例：
- 7 个字母音名: C, D, E, F, G, A, B
- 7 种变化音: 自然音(0), 升号(#), 降号(♭), 重升(##), 重降(♭♭), 三升(###), 三降(♭♭♭)
- 每个测试验证音阶的所有音符的 letter、accidental 和 pitch
