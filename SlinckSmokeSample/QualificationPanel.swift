import SwiftUI

struct QualificationPanel: View {
    @Binding var input: String
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Label("Automation surface", systemImage: "terminal")
                .font(.headline)
                .foregroundStyle(DemoPalette.primaryText(for: colorScheme))

            Text("Stable controls below keep simulator interaction and accessibility capture deterministic.")
                .font(.subheadline)
                .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))

            TextField("Qualification input", text: $input)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.horizontal, 14)
                .frame(minHeight: DemoMetrics.controlHeight)
                .background(DemoPalette.elevatedSurface(for: colorScheme))
                .clipShape(.rect(cornerRadius: DemoMetrics.compactRadius))
                .overlay {
                    RoundedRectangle(cornerRadius: DemoMetrics.compactRadius)
                        .stroke(DemoPalette.border(for: colorScheme), lineWidth: 1)
                }
                .accessibilityIdentifier("qualification.input")

            ForEach(1...20, id: \.self) { row in
                Label("Qualification row \(row)", systemImage: "checkmark.circle")
                    .font(.subheadline)
                    .foregroundStyle(DemoPalette.secondaryText(for: colorScheme))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(DemoMetrics.cardInset)
        .background(DemoPalette.surface(for: colorScheme))
        .clipShape(.rect(cornerRadius: DemoMetrics.cardRadius))
        .overlay {
            RoundedRectangle(cornerRadius: DemoMetrics.cardRadius)
                .stroke(DemoPalette.border(for: colorScheme), lineWidth: 1)
        }
    }
}
