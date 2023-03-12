# Coder
Code everything into Data and String! 🏗

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/Coder", exact: .init(0, 0, 2))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
import Coder

struct CodablePage {
    let text: String
}

extension CodablePage: Codable {}
    
let coder = Coder()
let object = CodablePage(text: "Text")
let encodedObject: Data? = coder.encode(object, type: .json)
let decodedObject: CodablePage? = coder.decode(encodedObject, type: .json)
// object.text == decodedObject?.text
```

For details see the Example app.

## Tests

The library is well-tested with practically 100% coverage (96.9%).
