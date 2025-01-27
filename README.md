# SwiftUIShowcase

A SwiftUI implementation of MaterialShowcase for feature discovery and onboarding.

## Installation

### CocoaPods

Add the following line to your Podfile:

```ruby
pod 'SwiftUIShowcase'
```

Then run `pod install`.

## Usage

```swift
import SwiftUIShowcase

struct ContentView: View {
@State private var currentShowcaseIndex: Int?
var body: some View {
ShowcaseView(
content: YourContent(),
currentShowcaseIndex: $currentShowcaseIndex,
showcaseItems: [
ShowcaseItem(
title: "Title",
description: "Description",
anchor: yourAnchor
)
]
) {
// Showcase finished
}
}
}
```
