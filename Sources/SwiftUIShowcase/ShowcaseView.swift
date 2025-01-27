import SwiftUI

public struct ShowcaseView<Content: View>: View {
    private let content: Content
    @Binding public var currentShowcaseIndex: Int?
    public let showcaseItems: [ShowcaseItem]
    public let onFinish: () -> Void

    // MaterialShowcase'den alınan animasyon sabitleri
    private let aniComeDuration: Double = 0.5
    private let aniGoOutDuration: Double = 0.5
    private let aniTargetHolderScale: CGFloat = 2.2
    private let targetPadding: CGFloat = 20

    // State değişkenleri
    @State private var backgroundScale: CGFloat = 0.1
    @State private var backgroundOpacity: Double = 0
    @State private var targetHolderScale: CGFloat = 0.1
    @State private var targetRippleScale: CGFloat = 1.0
    @State private var targetRippleOpacity: Double = 0
    @State private var textOpacity: Double = 0

    public init(
        content: Content,
        currentShowcaseIndex: Binding<Int?>,
        showcaseItems: [ShowcaseItem],
        onFinish: @escaping () -> Void
    ) {
        self.content = content
        self._currentShowcaseIndex = currentShowcaseIndex
        self.showcaseItems = showcaseItems
        self.onFinish = onFinish
    }

    public var body: some View {
        content  // Ana content en altta
            .overlay {
                if let index = currentShowcaseIndex,
                    index < showcaseItems.count
                {
                    Color.clear  // Gesture'ları yakalamak için saydam bir view
                        .ignoresSafeArea()
                        .overlay {
                            showcaseOverlay(for: showcaseItems[index])
                        }
                }
            }
    }

    private func showcaseOverlay(for item: ShowcaseItem) -> some View {
        GeometryReader { geometry in
            let rect = geometry[item.anchor]
            let backgroundRadius: CGFloat = max(300, rect.width * 3)
            let maskPadding: CGFloat = 5

            ZStack {
                // Karartılmış arka plan ve turuncu daire
                ZStack {
                    Color.black
                        .opacity(0.6)

                    Circle()
                        .fill(item.backgroundPromptColor.opacity(0.9))
                        .frame(width: backgroundRadius * 2, height: backgroundRadius * 2)
                        .scaleEffect(backgroundScale)
                        .opacity(backgroundOpacity)
                        .position(x: rect.midX, y: rect.midY)
                }
                .ignoresSafeArea()
                .mask {
                    Rectangle()
                        .fill(.white)
                        .ignoresSafeArea()
                        .overlay {
                            // Padding'li maske
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.black)
                                .frame(
                                    width: rect.width + (maskPadding * 2),
                                    height: rect.height + (maskPadding * 2)
                                )
                                .position(x: rect.midX, y: rect.midY)
                        }
                }

                // İçteki beyaz daire ve ripple efekti (maskenin arkasında)
                Circle()
                    .fill(item.targetHolderColor)
                    .frame(width: item.targetHolderRadius * 2, height: item.targetHolderRadius * 2)
                    .scaleEffect(targetHolderScale)
                    .position(x: rect.midX, y: rect.midY)

                Circle()
                    .stroke(item.targetHolderColor.opacity(0.5), lineWidth: 2)
                    .frame(
                        width: item.targetHolderRadius * 2.5, height: item.targetHolderRadius * 2.5
                    )
                    .scaleEffect(targetRippleScale)
                    .opacity(targetRippleOpacity)
                    .position(x: rect.midX, y: rect.midY)

                // Target view'ın kopyası (en üstte)
                GeometryReader { _ in
                    AnyView(content)
                        .allowsHitTesting(false)
                        .mask {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(
                                    width: rect.width + (maskPadding * 2),
                                    height: rect.height + (maskPadding * 2)
                                )
                                .position(x: rect.midX, y: rect.midY)
                        }
                }

                // Instruction texts
                VStack(spacing: 12) {
                    Text(item.title)
                        .font(item.titleFont)
                        .foregroundColor(item.titleColor)
                        .multilineTextAlignment(.center)

                    Text(item.description)
                        .font(item.descriptionFont)
                        .foregroundColor(item.descriptionColor)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 40)
                .position(
                    x: geometry.size.width / 2,
                    y: rect.maxY + 120
                )
                .opacity(textOpacity)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                animateOut {
                    if currentShowcaseIndex! < showcaseItems.count - 1 {
                        currentShowcaseIndex! += 1
                        animateIn()
                    } else {
                        currentShowcaseIndex = nil
                        onFinish()
                    }
                }
            }
            .onAppear {
                animateIn()
            }
        }
    }

    private func animateIn() {
        // Reset states
        backgroundScale = 0.1
        backgroundOpacity = 0
        targetHolderScale = 0.1
        targetRippleScale = 1.0
        targetRippleOpacity = 0
        textOpacity = 0

        // Animate in
        withAnimation(.easeOut(duration: aniComeDuration)) {
            backgroundScale = 1.0
            backgroundOpacity = 1
            targetHolderScale = 1.0
        }

        // Start ripple animation
        withAnimation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true)
        ) {
            targetRippleScale = 1.1
            targetRippleOpacity = 0.5
        }

        // Show text
        DispatchQueue.main.asyncAfter(deadline: .now() + aniComeDuration / 2) {
            withAnimation(.easeOut(duration: aniComeDuration / 2)) {
                textOpacity = 1
            }
        }
    }

    private func animateOut(completion: @escaping () -> Void) {
        withAnimation(.easeIn(duration: aniGoOutDuration)) {
            backgroundScale = 1.4
            backgroundOpacity = 0
            targetHolderScale = 0.4
            targetRippleOpacity = 0
            textOpacity = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + aniGoOutDuration) {
            completion()
        }
    }
}

public enum ShowcaseShape {
    case circle(radius: CGFloat)
    case rectangle(size: CGSize)
}
