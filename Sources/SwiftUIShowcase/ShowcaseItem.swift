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
        configuration: Configuration = Configuration()
    ) {
        self.anchor = anchor
        self.title = title
        self.description = description
        self.titleFont = configuration.titleFont
        self.titleColor = configuration.titleColor
        self.descriptionFont = configuration.descriptionFont
        self.descriptionColor = configuration.descriptionColor
        self.backgroundPromptColor = configuration.backgroundPromptColor
        self.targetHolderColor = configuration.targetHolderColor
        self.targetHolderRadius = configuration.targetHolderRadius
    }
}

extension ShowcaseItem {
    public struct Configuration {
        public var titleFont: Font = .headline
        public var titleColor: Color = .white
        public var descriptionFont: Font = .subheadline
        public var descriptionColor: Color = .white
        public var backgroundPromptColor: Color = .orange
        public var targetHolderColor: Color = .white
        public var targetHolderRadius: CGFloat = 44

        public init() {}
    }
}
