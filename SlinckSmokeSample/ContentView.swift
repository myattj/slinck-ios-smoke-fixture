import SwiftUI

struct ContentView: View {
    private let status = SmokeStatus.sample
    @State private var qualificationInput = ""
    @State private var isRemoteValidationQueued = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .accessibilityHidden(true)

                    Text(status.title)
                        .accessibilityIdentifier("smoke.title")
                }
                .font(.largeTitle.bold())

                Text("Ready for a governed Slinck build")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier("smoke.subtitle")

                VStack(alignment: .leading, spacing: 10) {
                    Text(status.buildLabel)
                        .font(.title3.bold())
                        .accessibilityIdentifier("smoke.status.build")

                    Text(status.artifactLabel)
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("smoke.status.artifacts")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))

                Button("Ready", systemImage: "checkmark", action: {})
                    .buttonStyle(.borderedProminent)
                    .accessibilityIdentifier("smoke.ready.button")

                VStack(alignment: .leading, spacing: 10) {
                    Text("Remote validation will build the app, run XCTest, and verify its launch screen.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("smoke.validation.message")

                    Button(
                        isRemoteValidationQueued ? "Validation queued" : "Queue remote validation",
                        systemImage: "cloud.fill"
                    ) {
                        isRemoteValidationQueued = true
                    }
                    .buttonStyle(.bordered)
                    .accessibilityIdentifier("smoke.validation.button")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))

                TextField("Qualification input", text: $qualificationInput)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("qualification.input")

                ForEach(1...20, id: \.self) { row in
                    Text("Qualification row \(row)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("qualification.scroll")
    }
}

#Preview {
    ContentView()
}
