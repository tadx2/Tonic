## 注意：

### Git
1. 正常情况下，不要主动运行 git命令
2. 每次修改过代码，需要运行 swift test

### Package Location
fantachord项目中引用了Tonic/KeyboardKit包

和包有关的所有代码不要在本项目中查找（不应该在fantachord/Tonic/中搜索），而应该在包的位置中查找代码
- /Users/xtt/Project/KeyboardKit
- /Users/xtt/Project/Tonic

## 当前项目计划 重构 

重构 /Users/xtt/Project/chord/fantachord/experiment/MultipleExampleVoicing.swift 
- presets 不应该这样写，因为 type 已经预设了，presets应该遍历 VoicingType，而不是重复的写
- ChordBasicInfo secondClass 与 vocing 中的 chordType 相对应，表示在这种和弦下可以用到哪些voicing，在view中要做筛选



 
