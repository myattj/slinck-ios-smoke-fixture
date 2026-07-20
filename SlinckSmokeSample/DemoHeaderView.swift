import SwiftUI

struct DemoHeaderView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        let layout = dynamicTypeSize.isAccessibilitySize
            ? AnyLayout(VStackLayout(alignment: .leading, spacing: 12))
            : AnyLayout(HStackLayout(spacing: 12))

        layout {
            Label {
                VStack(alignment: .leading, spacing: 2) {
                    Text("SLINCK")
                        .font(.headline)
                        .bold()
                        .tracking(1.4)

                    Text("CLOUD iOS SESSION")
                        .font(.footnote)
                        .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                }
            } icon: {
                Image(systemName: "point.3.connected.trianglepath.dotted")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.white)
                    .frame(width: 44, height: 44)
                    .background {
                        LinearGradient(
                            colors: [DemoPalette.electricBlue, DemoPalette.violet],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                    .clipShape(.rect(cornerRadius: 13))
                    .accessibilityHidden(true)
            }
            .foregroundStyle(DemoPalette.primaryText(for: colorScheme))

            Spacer(minLength: 0)

            Label("LIVE", systemImage: "dot.radiowaves.left.and.right")
                .font(.subheadline.bold())
                .foregroundStyle(DemoPalette.success)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(DemoPalette.surface(for: colorScheme))
                .clipShape(.capsule)
                .overlay {
                    Capsule()
                        .stroke(DemoPalette.success.opacity(0.35), lineWidth: 1)
                }
                .accessibilityLabel("Live cloud session")
        }
    }
}
