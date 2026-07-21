import SwiftUI

struct ContentView: View {
    private let status = SmokeStatus.sample
    @State private var qualificationInput = ""

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

                Text("This sample is ready to build and test remotely through Slinck.")
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier("smoke.remote.message")

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

                Button("View build status", systemImage: "arrow.triangle.2.circlepath", action: {})
                    .buttonStyle(.borderedProminent)
                    .accessibilityIdentifier("smoke.build-status.button")

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
