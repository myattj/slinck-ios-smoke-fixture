import SwiftUI

struct ContentView: View {
    private let status = SmokeStatus.sample
    @State private var qualificationInput = ""
    @State private var demoPingCount = 0

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

                Text("Remote interaction ready")
                    .font(.headline)
                    .accessibilityIdentifier("demo.ping.title")

                Button("Send Demo Ping", systemImage: "paperplane", action: sendDemoPing)
                    .buttonStyle(.bordered)
                    .accessibilityIdentifier("demo.ping.button")

                Text(demoPingStatus)
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier("demo.ping.status")

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

    private var demoPingStatus: String {
        demoPingCount == 0 ? "No pings sent" : "Pings sent: \(demoPingCount)"
    }

    private func sendDemoPing() {
        demoPingCount += 1
    }
}

#Preview {
    ContentView()
}
