import SwiftUI

struct ContentView: View {
    private let status = SmokeStatus.sample
    @State private var qualificationInput = ""
    @State private var isBuildNoteVisible = false

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
                    Text("Remote-ready, from commit to simulator.")
                        .font(.title3.bold())

                    Button(
                        isBuildNoteVisible ? "Hide build note" : "Show build note",
                        systemImage: isBuildNoteVisible ? "chevron.up" : "chevron.down",
                        action: toggleBuildNote
                    )
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .accessibilityIdentifier("smoke.build-note.button")

                    Text(isBuildNoteVisible
                        ? "Built, installed, and launched through the governed Slinck workflow."
                        : "Reveal how this demo reaches the simulator.")
                        .foregroundStyle(.secondary)
                        .accessibilityIdentifier("smoke.build-note.text")
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.blue.quaternary, in: RoundedRectangle(cornerRadius: 12))

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

    private func toggleBuildNote() {
        isBuildNoteVisible.toggle()
    }
}

#Preview {
    ContentView()
}
