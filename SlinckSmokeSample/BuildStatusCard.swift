import SwiftUI

struct BuildStatusCard: View {
    let status: SmokeStatus

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: DemoMetrics.cardInset) {
            HStack(alignment: .top, spacing: 14) {
                Image(systemName: "macmini.fill")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(Color.white)
                    .frame(width: 48, height: 48)
                    .background {
                        LinearGradient(
                            colors: [DemoPalette.violet, DemoPalette.electricBlue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                    .clipShape(.rect(cornerRadius: DemoMetrics.compactRadius))
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Remote build machine")
                        .font(.headline)
                        .foregroundStyle(DemoPalette.primaryText(for: colorScheme))

                    Text("Apple silicon · Xcode · iOS Simulator")
                        .font(.subheadline)
                        .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                }

                Spacer(minLength: 0)

                Label("RUNNING", systemImage: "circle.fill")
                    .font(.footnote.bold())
                    .foregroundStyle(DemoPalette.success)
                    .labelStyle(.titleAndIcon)
            }

            Divider()
                .overlay(DemoPalette.border(for: colorScheme))

            Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 14) {
                GridRow {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(DemoPalette.success)
                        .accessibilityHidden(true)
                    Text("Source accepted")
                        .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                    Text("COMMIT")
                        .font(.footnote.bold())
                        .foregroundStyle(DemoPalette.primaryText(for: colorScheme))
                        .gridColumnAlignment(.trailing)
                }

                GridRow {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(DemoPalette.success)
                        .accessibilityHidden(true)
                    Text(status.buildLabel)
                        .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                        .accessibilityIdentifier("smoke.status.build")
                    Text("XCODE")
                        .font(.footnote.bold())
                        .foregroundStyle(DemoPalette.primaryText(for: colorScheme))
                }

                GridRow {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(DemoPalette.success)
                        .accessibilityHidden(true)
                    Text(status.artifactLabel)
                        .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                        .accessibilityIdentifier("smoke.status.artifacts")
                    Text("DURABLE")
                        .font(.footnote.bold())
                        .foregroundStyle(DemoPalette.primaryText(for: colorScheme))
                }
            }
            .font(.subheadline)

            Label("com.slinck.IOSSmokeSample", systemImage: "app.dashed")
                .font(.footnote.monospaced())
                .foregroundStyle(DemoPalette.accent)
                .accessibilityLabel("App bundle com dot slinck dot I O S Smoke Sample")
        }
        .padding(DemoMetrics.cardInset)
        .background {
            LinearGradient(
                colors: [
                    DemoPalette.surface(for: colorScheme),
                    DemoPalette.elevatedSurface(for: colorScheme)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        .clipShape(.rect(cornerRadius: DemoMetrics.cardRadius))
        .overlay {
            RoundedRectangle(cornerRadius: DemoMetrics.cardRadius)
                .stroke(DemoPalette.border(for: colorScheme), lineWidth: 1)
        }
        .shadow(
            color: DemoPalette.electricBlue.opacity(colorScheme == .dark ? 0.10 : 0.08),
            radius: 22,
            y: 12
        )
    }
}
