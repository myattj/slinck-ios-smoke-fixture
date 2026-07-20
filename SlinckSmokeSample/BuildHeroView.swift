import SwiftUI

struct BuildHeroView: View {
    let status: SmokeStatus

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(status.title)
                .font(.subheadline.bold())
                .foregroundStyle(DemoPalette.electricBlue)
                .textCase(.uppercase)
                .tracking(1.2)
                .accessibilityIdentifier("smoke.title")

            Text("Build here.\nRun anywhere.")
                .font(.largeTitle.bold())
                .foregroundStyle(DemoPalette.primaryText(for: colorScheme))
                .accessibilityAddTraits(.isHeader)

            Text("A provider-neutral iOS runtime, connected to a real Apple silicon Mac in AWS.")
                .font(.headline)
                .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("smoke.subtitle")

            ConnectionPathView()
        }
    }
}
