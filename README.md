# SUEStyles

SwiftUI styled views

<p align="center">
<a href="LICENSE.md">
    <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
</a>
<a href="https://swift.org">
    <img src="https://img.shields.io/badge/swift-5.3-brightgreen.svg" alt="Swift 5.3">
</a>

SUE stands for *S*wift*U*I *E*xtras and is a collection of small SwiftUI libraries for various recurring use cases

## Gallery

### TabRow
```swift
TabRow(items, selected: $selected) { item in
    Label(item, systemImage: "circle")
}
```
![TabRow](Doc/TabRow.png)

### Tile
```swift
Tile("Test", hue: 0.23) {
    Text("Hello World")
}
```
![Tile](Doc/Tile.png)

## License

MIT license; see [LICENSE](LICENSE.md).
(c) 2020
