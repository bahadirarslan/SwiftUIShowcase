import SwiftUI
import SwiftUIShowcase

struct ContentView: View {
    @State private var currentShowcaseIndex: Int? = 0
    @State private var button1Anchor: Anchor<CGRect>? = nil
    @State private var button2Anchor: Anchor<CGRect>? = nil

    var body: some View {
        ShowcaseView(
            content: demoContent,
            currentShowcaseIndex: $currentShowcaseIndex,
            showcaseItems: [
                ShowcaseItem(
                    anchor: button1Anchor!,
                    title: "First Button",
                    description: "This is an important button",
                    configuration: {
                        var config = ShowcaseItem.Configuration()
                        config.backgroundPromptColor = .blue
                        return config
                    }()
                ),
                ShowcaseItem(
                    anchor: button2Anchor!,
                    title: "Second Button",
                    description: "This is another important button",
                    configuration: {
                        var config = ShowcaseItem.Configuration()
                        config.titleColor = .yellow
                        return config
                    }()
                ),
            ],
            onFinish: {
                print("Showcase completed!")
            }
        )
    }

    private var demoContent: some View {
        VStack(spacing: 20) {
            Button("First Button") {
                // action
            }
            .anchorPreference(key: AnchorPreferenceKey.self, value: .bounds) { anchor in
                button1Anchor = anchor
                return anchor
            }

            Button("Second Button") {
                // action
            }
            .anchorPreference(key: AnchorPreferenceKey.self, value: .bounds) { anchor in
                button2Anchor = anchor
                return anchor
            }
        }
    }
}

private struct AnchorPreferenceKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil

    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue()
    }
}
