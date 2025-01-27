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
                    title: "İlk Buton",
                    description: "Bu buton önemli bir işlev görür"
                ),
                ShowcaseItem(
                    anchor: button2Anchor!,
                    title: "İkinci Buton",
                    description: "Bu da başka bir önemli buton"
                ),
            ],
            onFinish: {
                print("Showcase tamamlandı!")
            }
        )
    }

    private var demoContent: some View {
        VStack(spacing: 20) {
            Button("İlk Buton") {
                // action
            }
            .anchorPreference(key: AnchorPreferenceKey.self, value: .bounds) { anchor in
                button1Anchor = anchor
                return anchor
            }

            Button("İkinci Buton") {
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
