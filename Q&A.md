# Tonic 项目 Q&A

## Q: Note 已经符合 Identifiable 了， 为什么还要 Hashable？

### A:
`Identifiable` 和 `Hashable` 在 Swift 中解决的是完全不同的问题，特别是在 `Note` 结构体中，它们甚至是有意“冲突”的：

**简而言之：**
*   **`Identifiable` (配合 UUID)**：是为了让 **UI (SwiftUI)** 认为它们是**不同**的实例（即使音高一样）。
*   **`Hashable` (自定义实现)**：是为了让 **数据逻辑 (Set/Dictionary)** 认为它们是**相同**的值（只要音符属性一样）。

---

### 1. `Identifiable` 是为了 UI (唯一性)
在 `Note.swift` 中定义了 `let id = UUID()`。
这意味着每次你创建一个 `Note`，哪怕它们都是 "C4"，它们也是两个完全不同的对象。
*   **场景**：如果你在 SwiftUI 的 `List` 或 `ForEach` 中显示 5 个 "C4" 音符，你需要 `Identifiable` 来告诉界面这是 5 个不同的视图（Row），而不是同一个东西重复 5 次，这样系统才能正确处理动画和状态。

### 2. `Hashable` 是为了 逻辑 (去重与集合)
在代码第 125 行（`normalize` 方法）使用了 `Set(notes)`。
*   **场景**：在乐理计算中，两个 "C4" 通常被视为同一个音符。
*   **关键点**：如果不手动实现 `Hashable` 并忽略 `id`，Swift 会自动合成 `Hashable`（包含 `id`）。那么 `Set([Note(.C), Note(.C)])` 会因为 `id` 不同而保留两个 C，导致**去重失败**。
*   **当前实现**：手动实现了 `hash(into:)` 和 `==`，只比较 `letter`、`accidental` 和 `octave`。这确保了在数据处理层面，所有的 "C4" 都是相等的。

### 总结
你需要同时拥有它们，因为你需要两种不同的行为：
1.  **在界面上**：它们是独立的个体（动画、列表渲染需要）。
2.  **在乐理上**：它们是同一个值（和弦计算、音阶去重需要）。

---

## Q: 为什么需要让类型符合 Sendable 协议？

### A:
从 Swift 6 开始，编译器引入了**严格的并发安全检查**。当你的类型被用作 `static let` 常量时，编译器需要确保这些常量可以安全地在不同的并发上下文（线程、Task）中访问。

**简而言之：**
*   **`Sendable` 协议**：标记一个类型可以**安全地跨并发域传递**，不会造成数据竞争。
*   **为什么需要它**：防止在多线程环境中出现数据竞争和未定义行为。

---

### 1. 问题场景
在 `KeySignature`、`Note`、`NoteInterval` 等结构体中，我们定义了大量的静态常量：

```swift
static let cMajor = KeySignature(letter: .C, accidentalCount: 0, ...)
static let NoteCircleDefault: [Note] = [Note(letter: .C), ...]
static let P1 = NoteInterval(degree: 1, semitones: 0)
```

这些常量会在整个应用程序中被多个地方访问，可能在不同的线程或 Task 中。如果类型不是 `Sendable` 的，编译器会报错：

```
error: static property 'cMajor' is not concurrency-safe because
non-'Sendable' type 'KeySignature' may have shared mutable state
```

### 2. 什么是 Sendable？
`Sendable` 是一个标记协议（marker protocol），表示一个类型的实例可以安全地从一个并发域发送到另一个并发域。

**符合 Sendable 的类型通常满足以下条件之一：**
1. **值类型（struct/enum）且所有属性都是 Sendable 的**
   - 例如：`Int`、`String`、`Bool` 都是 Sendable 的
   - 如果一个 struct 的所有属性都是 Sendable，那么这个 struct 也应该是 Sendable

2. **不可变的引用类型（final class with immutable properties）**

3. **内部实现了适当的同步机制**

### 3. 为什么我们的类型需要 Sendable？

在 Tonic 项目中，以下类型都需要符合 `Sendable`：

| 类型 | 原因 |
|------|------|
| `KeySignature` | 包含静态常量如 `.cMajor`、`.dMajor` 等，会被多线程访问 |
| `Note` | 包含静态常量如 `.NoteCircleDefault`，且是值类型，所有属性都是 Sendable 的 |
| `NoteInterval` | 包含大量静态常量如 `.P1`、`.M3` 等音程定义 |
| `Letter` | 是枚举类型，被 `Note` 和 `KeySignature` 使用 |
| `KeySignatureType` | 是枚举类型，被 `KeySignature` 使用 |

**这些都是纯值类型（struct/enum），没有引用类型属性，也没有可变状态**，因此符合 Sendable 是安全且合理的。

### 4. 实际影响

添加 `Sendable` 后：

```swift
// 修改前
public struct Note: Identifiable { ... }

// 修改后
public struct Note: Identifiable, Sendable { ... }
```

这样做的好处：
1. ✅ **编译时安全**：编译器会检查并发访问的安全性
2. ✅ **明确语义**：告诉使用者这个类型可以安全地跨线程传递
3. ✅ **避免运行时错误**：防止潜在的数据竞争问题
4. ✅ **Swift 6 兼容**：符合现代 Swift 的并发模型

### 5. 注意事项

对于包含 `id = UUID()` 的 `Note` 类型，虽然每次创建会生成新的 UUID，但由于：
- `UUID` 本身是 `Sendable` 的
- `id` 是 `let` 常量（初始化后不可变）
- 整个 `Note` 是值类型

因此 `Note` 符合 Sendable 是完全安全的。

### 总结
**Sendable 是 Swift 现代并发模型的核心组成部分**，它让编译器能够在编译时检查并发安全性，避免运行时的数据竞争问题。对于像 Tonic 这样的音乐理论库，所有核心数据结构都应该是 Sendable 的，这样它们可以安全地在并发环境中使用（例如在 SwiftUI 的异步视图更新、后台音频处理等场景）。

---

## Q: 如何撤销上一次 Commit，但保留所有更改（并保持在 Staged 状态）？

### A:

**情况 1：这不是仓库的第一次提交（绝大多数情况）**
使用以下命令：
```bash
git reset --soft HEAD~1
```
*   **解释**：这将回退到上一个版本，但把当前提交的文件保留在“暂存区（Staged）”。你可以修改后重新提交。

**情况 2：这是仓库的第一次提交（Initial Commit）**
如果你运行上面的命令报错 `fatal: ambiguous argument 'HEAD~1'...`，说明这是项目的第一个 Commit。此时没有“上一个版本”可以回退。
使用以下命令：
```bash
git update-ref -d HEAD
```
*   **解释**：这会删除由于提交而生成的 HEAD 引用（即“删除”这次提交记录），但**保留所有文件和暂存状态**。现在你的状态就像是刚 `git add` 完所有文件，但还没运行第一次 `git commit` 的时候。

---

### 详细解释 `git reset --soft HEAD~1`：

1.  **`git reset`**: 这是 Git 中用于回退版本的核心命令。
2.  **`--soft`**: 这个参数非常关键。它告诉 Git：
    *   **回退分支指针**：将当前分支指向上一个提交（HEAD~1）。
    *   **保留暂存区 (Staging Area)**：**原本已提交的所有更改都会回到“待提交（Staged）”状态。**
    *   **保留工作目录**：你本地还没来得及暂存或提交的其他更改（Unstaged changes）会保持原样，完全不受影响。
3.  **`HEAD~1`**: 表示当前提交的前一个位置。

### 适用场景：
*   **修正提交信息**：运行该命令后，直接再次执行 `git commit -m "正确的提交信息"` 即可。（或者直接用 `git commit --amend`）
*   **补充遗漏文件**：回退后，把漏掉的文件 `git add`，然后再次提交。
*   **合并提交**：如果你想把当前的更改和上一次提交合并成一个大提交。

### 区分其他模式：
*   `git reset --mixed HEAD~1` (默认模式): 更改会保留，但会回到 **Unstaged** 状态（你需要重新 `git add`）。
*   `git reset --hard HEAD~1`: **极度危险！** 会彻底删除上一个提交的所有更改，且不可恢复。

