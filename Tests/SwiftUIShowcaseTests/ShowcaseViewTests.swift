import SwiftUI
import XCTest

@testable import SwiftUIShowcase

final class ShowcaseViewTests: XCTestCase {
    func testShowcaseViewInitialization() {
        let content = Text("Test")
        let currentShowcaseIndex: Binding<Int?> = .constant(0)
        let showcaseItems = [
            ShowcaseItem(
                anchor: Anchor<CGRect>(value: .zero),
                title: "Test Title",
                description: "Test Description"
            )
        ]

        let showcaseView = ShowcaseView(
            content: content,
            currentShowcaseIndex: currentShowcaseIndex,
            showcaseItems: showcaseItems,
            onFinish: {}
        )

        XCTAssertNotNil(showcaseView)
        XCTAssertEqual(showcaseView.showcaseItems.count, 1)
        XCTAssertEqual(showcaseView.showcaseItems[0].title, "Test Title")
    }

    func testShowcaseItemCustomization() {
        let item = ShowcaseItem(
            anchor: Anchor<CGRect>(value: .zero),
            title: "Test",
            description: "Description",
            titleFont: .title,
            titleColor: .red,
            backgroundPromptColor: .blue
        )

        XCTAssertEqual(item.titleFont, .title)
        XCTAssertEqual(item.titleColor, .red)
        XCTAssertEqual(item.backgroundPromptColor, .blue)
    }
}
