import SwiftUI

struct ContentView: View {
    private let status = SmokeStatus.sample
    @State private var qualificationInput = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text(status.title)
                    .font(.largeTitle.bold())
                    .accessibilityIdentifier("smoke.title")

                Text("Provider-agnostic iOS runtime fixture")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier("smoke.subtitle")

                VStack(alignment: .leading, spacing: 10) {
                    Text(status.buildLabel)
                        .font(.title3.weight(.semibold))
                        .accessibilityIdentifier("smoke.status.build")

                    Text(status.artifactLabel)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("smoke.status.artifacts")
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Button("Ready") {}
                    .buttonStyle(.borderedProminent)
                    .accessibilityIdentifier("smoke.ready.button")

                TextField("Qualification input", text: $qualificationInput)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("qualification.input")

                ForEach(1...20, id: \.self) { row in
                    Text("Qualification row \(row)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(.systemBackground))
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("qualification.scroll")
    }
}

#Preview {
    ContentView()
}
