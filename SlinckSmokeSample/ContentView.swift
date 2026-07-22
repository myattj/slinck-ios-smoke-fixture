import SwiftUI

/// The qualification surface. This branch exists so the tool coverage the demo
/// path cannot reach — type_text needs a text field, swipe needs something that
/// scrolls — is exercised against a real app rather than left unproven. The
/// demo branch keeps its plain success screen; this one carries the controls.
struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isPulsing = false
    @State private var isConfirmed = false
    @State private var noteText = ""

    private let status = SmokeStatus.sample

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 72, height: 72)
                .foregroundStyle(.green)
                .scaleEffect(isPulsing ? 1.08 : 1.0)
                .accessibilityHidden(true)
                .onAppear {
                    guard !reduceMotion else { return }
                    withAnimation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true)) {
                        isPulsing = true
                    }
                }

            Text("Shipped from Slinck")
                .font(.title.bold())
                .accessibilityIdentifier("smoke.title")

            Text(isConfirmed ? "Confirmed by agent" : "Remote build verified")
                .font(.headline)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("smoke.subtitle")

            Button("Confirm") {
                isConfirmed = true
            }
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("smoke.confirm")

            // A field a remote agent can type into, and enough rows below it
            // that the scroll view actually scrolls on an iPhone screen — a
            // swipe against content that already fits proves nothing.
            TextField("Note", text: $noteText)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .accessibilityIdentifier("qualification.input")

            Text(noteText.isEmpty ? "No note" : noteText)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("qualification.note.echo")

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text(status.buildLabel)
                        .accessibilityIdentifier("smoke.status.build")
                    Text(status.artifactLabel)
                        .accessibilityIdentifier("smoke.status.artifacts")
                    ForEach(1...30, id: \.self) { index in
                        Text("Qualification row \(index)")
                            .accessibilityIdentifier("qualification.row.\(index)")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 4)
            }
            .accessibilityIdentifier("qualification.scroll")

            Button("Ready") {
                isConfirmed = true
            }
            .accessibilityIdentifier("smoke.ready.button")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
