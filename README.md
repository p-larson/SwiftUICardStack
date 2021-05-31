# 🗂 SwiftUICardStack

<img src="https://github.com/p-larson/SwiftUICardStack/blob/main/Example/SwiftUICardStack-Example/Demo%20Film/Simulator%20Screen%20Recording%20-%20iPhone%2012%20-%202021-05-28%20at%2019.37.27.gif" align="right"></img>

<img src="https://github.com/p-larson/SwiftUICardStack/blob/main/Example/SwiftUICardStack-Example/Demo%20Film/Simulator%20Screen%20Recording%20-%20iPhone%2012%20-%202021-05-28%20at%2019.37.49.gif" align="right"></img>
 
Create an *easy to peek* SwiftUI View to showcase your own data, catalog, images, or anything you'd like.

## Contents

- [🔭 Supported Platforms](#supported-platforms)
- [📦 Package](#package)
- [🔨 Example](#usage)
- [🧨 Extra](#extra)

## Supported Platforms 

You can use the `CardStack` SwiftUI view in the following platforms:

- macOS 10.12+ 🖥
- iOS 14.0+ 📱
- tvOS 14.0+ 📺 

## Package

### For your XCode Package

File > Swift Packages > Add Package Dependency: [https://github.com/p-larson/SwiftUICardStack](url)

Select `main` branch then click `done`.

### For Swift Packages

Add a dependency in your `Package.swift`


```swift 
.package(url: "https://github.com/p-larson/SwiftUICardStack", branch: "main")
```

## Usage 

### Simple example

```swift
CardStack(
    items: cards,
    selection: $selectedCard,
    builder: CardView.init(model:)
)
.sheet(item: $selectedCard) { card in
    VStack {
        Text(card.name)
        Text(card.description)
        Text(card.id)
        Text(card.someMoreDetailedInformation())
    }
}
```

See Full Example Usage @ [SwiftUICardStack/Example](/Example/SwiftUICardStack-Example) 

## Extra

### My Favorite Line of Code from the Package 💕

Line 17 of [Sources/SwiftUICardStack/CardStackSource.swift](/Sources/SwiftUICardStack/CardStackSource.swift)

```swift
private(set) lazy var views: Array<AnyView> = items.map(builder).map(\.eraseToAnyView)
```

**Why this is my favorite** 

*I use the power of KeyPaths to type erase the data set in a short and sweet one liner!*

See [View#eraseToAnyView](/Sources/SwiftUICardStack/Common.swift)

### License

Open Source 😎
