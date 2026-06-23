# 🎵 Tonic

**Tonic** is a Swift music-theory toolkit for iOS apps. It models notes, intervals, modes, chords, chord names, and chord symbols with a practical API for music creation, education, practice, and harmony tools. 🎹✨

## ✨ Features

- 🎼 Notes with spelling, accidentals, octaves, and MIDI-style pitch values
- 🧭 Interval arithmetic: `.M3`, `.P5`, `.m7`, `.A11`, and more
- 🎹 Chord construction from roots, intervals, and optional bass notes
- 🪄 Chord name rendering such as `CM7`, `C△9`, and `D-11`
- 🌈 Modal scales for major, minor, church modes, harmonic minor, and melodic minor families
- 🏗️ Diatonic triads and seventh chords
- 🧾 Structured chord-symbol data
- 🧪 Tests powered by Swift Testing

## 📦 Requirements

- Swift 6.1+
- iOS 17+
- Swift Package Manager

## 🚀 Installation

Add Tonic with Swift Package Manager:

```swift
dependencies: [
    .package(path: "../Tonic")
]
```

Then add the library product:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "Tonic", package: "Tonic")
    ]
)
```

## ⚡ Quick Start

```swift
import Tonic

let c4 = Note.C4
let e4 = c4 + .M3
let g4 = c4 + .P5

let chord = Chord(root: c4, intervals: [.M3, .P5, .M7, .M9])
let name = ChordName(chord: chord)
    .getChordNameString(isMergeTension: true, isShort: true)

print(e4.nameWithOctave) // E4
print(g4.nameWithOctave) // G4
print(name)              // C△9
```

## 🌈 Modal Example

```swift
let dMajor = ModalScale(.D4, mode: ModeTypeMain.majorNatural.mode)
let notes = dMajor.getNoteSequence(from: 1, count: 7)

print(notes.map(\.nameWithOctave))
// ["D4", "E4", "F♯4", "G4", "A4", "B4", "C♯5"]
```

## 🏗️ Diatonic Harmony

```swift
let harmony = ChordDiatonic(
    tonic: .C4,
    modeType: ModeTypeMain.majorNatural,
    type: .seventh
)

let names = harmony.getDiatonicChordSequence().map {
    ChordName(chord: $0).getChordNameString(isMergeTension: true, isShort: true)
}

print(names)
// ["C△7", "D-7", "E-7", "F△7", "G7", "A-7", "Bdim7"]
```

## 🧩 Project Layout

```text
Sources/Tonic/        Core music-theory library
Tests/TonicTests/     Test suites
Tofu/                 Optional SwiftUI companion package
Q&A.md                Project notes
```

## 🧪 Tests

```bash
swift test
```

Run a focused suite:

```bash
swift test --filter ChordNameTests
swift test --filter ModalScaleTests
```

## 📄 License

Tonic is available under the MIT License. See [LICENSE](LICENSE).
