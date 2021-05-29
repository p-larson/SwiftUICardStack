# SwiftUICardStack

A nifty way to organize & navigate a collection of views.

## Package

### For your XCode Package

File > Swift Packages > Add Package Dependency: [https://github.com/p-larson/SwiftUICardStack](url)

Select `main` branch then click `done`.

### For Swift Packages

Add a dependency in your `Package.swift`


```swift 
.package(url: "https://github.com/p-larson/SwiftUICardStack", branch: "main")
```

## Basic Usage

### Simple example

```swift
CardStack(items: data) { item in
    ZStack {
        Capsule()
            .fill(Color.white)
        Text(item.description)
    }
}
```


### More Advanced Example

```swift
import SwiftUICardStack

// Data Model
struct DataModel {
    let name, description, id: String
    
    func fetchMoreDetailedInformation() -> String {
        ...
    }
}

// Data Model View
struct DataModelView: View {
    ...
}

let dataModels: [DataModel] = ...

@State var detailItem: DataModel? = nil
...
// A quick vinyl style stack for quickly picking items.
CardStack(
    // Data
    items: mock,
    // Triggered when User gestures a detail inspection of a item.
    selection: $selected,
    // View representation for Data.
    builder: DataModelView.init(model:)
)
// Example of using a sheet for a detail sheet.
.sheet(item: $detailItem) { item in
    // A detailed description of the selected item
    VStack {
        Text(model.name)
        Text(model.description)
        Text(model.id)
        Text(model.someMoreDetailedInformation())
    }
}

```

### See Full Example Usage @ [SwiftUICardStack/Example](/Example/SwiftUICardStack-Example)
