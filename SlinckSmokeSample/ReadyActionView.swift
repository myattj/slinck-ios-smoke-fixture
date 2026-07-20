import SwiftUI

struct ReadyActionView: View {
    let isReady: Bool
    let action: () -> Void

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: action) {
                HStack(spacing: 10) {
                    Image(systemName: isReady ? "checkmark.seal.fill" : "record.circle")
                    Text(isReady ? "Recording ready" : "Ready for recording")
                    Spacer(minLength: 0)
                    Image(systemName: "arrow.up.right")
                        .accessibilityHidden(true)
                }
                .font(.headline)
                .foregroundStyle(Color.white)
                .padding(.horizontal, DemoMetrics.cardInset)
                .frame(maxWidth: .infinity, minHeight: DemoMetrics.controlHeight)
                .background {
                    LinearGradient(
                        colors: isReady
                            ? [DemoPalette.success, DemoPalette.accent]
                            : [DemoPalette.electricBlue, DemoPalette.violet],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                }
                .clipShape(.rect(cornerRadius: DemoMetrics.compactRadius))
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("smoke.ready.button")
            .accessibilityInputLabels(["Ready", "Record"])

            Text("Every command returns a structured result, trace, and durable artifact.")
                .font(.footnote)
                .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
        }
    }
}
