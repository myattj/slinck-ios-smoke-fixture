import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isPulsing = false
    @State private var isConfirmed = false

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 96, height: 96)
                .foregroundStyle(.green)
                .scaleEffect(isPulsing ? 1.08 : 1.0)
                .accessibilityHidden(true)
                .onAppear {
                    guard !reduceMotion else { return }
                    withAnimation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true)) {
                        isPulsing = true
                    }
                }

            Text("Built on AWS")
                .font(.largeTitle.bold())
                .accessibilityIdentifier("smoke.title")

            Text(isConfirmed ? "Confirmed by agent" : "Remote build verified")
                .font(.headline)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("smoke.subtitle")

            // The one control on this screen. A remote agent can find it by
            // ref, tap it, and prove it drove the app by re-reading the label
            // above — which a screenshot alone can never establish.
            Button("Confirm") {
                isConfirmed = true
            }
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("smoke.confirm")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
