import SwiftUI

struct ConnectionPathView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        let layout = dynamicTypeSize.isAccessibilitySize
            ? AnyLayout(VStackLayout(alignment: .leading, spacing: 10))
            : AnyLayout(HStackLayout(spacing: 8))

        layout {
            Label("Local Codex", systemImage: "chevron.left.forwardslash.chevron.right")
            Image(systemName: dynamicTypeSize.isAccessibilitySize ? "arrow.down" : "arrow.right")
                .accessibilityHidden(true)
            Label("Slinck", systemImage: "shield.lefthalf.filled")
            Image(systemName: dynamicTypeSize.isAccessibilitySize ? "arrow.down" : "arrow.right")
                .accessibilityHidden(true)
            Label("AWS Mac", systemImage: "macmini")
        }
        .font(.footnote.bold())
        .foregroundStyle(DemoPalette.primaryText(for: colorScheme))
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DemoPalette.surface(for: colorScheme))
        .clipShape(.rect(cornerRadius: DemoMetrics.compactRadius))
        .overlay {
            RoundedRectangle(cornerRadius: DemoMetrics.compactRadius)
                .stroke(DemoPalette.border(for: colorScheme), lineWidth: 1)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Local Codex connects through Slinck to an AWS Mac")
    }
}
