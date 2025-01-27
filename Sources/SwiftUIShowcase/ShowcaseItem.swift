import SwiftUI

public struct ShowcaseItem {
    public let anchor: Anchor<CGRect>
    public let title: String
    public let description: String

    // Özelleştirilebilir stiller
    public var titleFont: Font = .headline
    public var titleColor: Color = .white
    public var descriptionFont: Font = .subheadline
    public var descriptionColor: Color = .white
    public var backgroundPromptColor: Color = .orange
    public var targetHolderColor: Color = .white
    public var targetHolderRadius: CGFloat = 44

    public init(
        anchor: Anchor<CGRect>,
        title: String,
        description: String,
        titleFont: Font = .headline,
        titleColor: Color = .white,
        descriptionFont: Font = .subheadline,
        descriptionColor: Color = .white,
        backgroundPromptColor: Color = .orange,
        targetHolderColor: Color = .white,
        targetHolderRadius: CGFloat = 44
    ) {
        self.anchor = anchor
        self.title = title
        self.description = description
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.descriptionFont = descriptionFont
        self.descriptionColor = descriptionColor
        self.backgroundPromptColor = backgroundPromptColor
        self.targetHolderColor = targetHolderColor
        self.targetHolderRadius = targetHolderRadius
    }
}
