import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isPulsing = false

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 96))
                .foregroundStyle(.green)
                .scaleEffect(reduceMotion ? 1 : (isPulsing ? 1.06 : 0.94))
                .animation(
                    reduceMotion ? nil : .easeInOut(duration: 1).repeatForever(autoreverses: true),
                    value: isPulsing
                )
                .accessibilityHidden(true)

            Text("Built remotely")
                .font(.largeTitle.bold())
                .accessibilityIdentifier("smoke.title")

            Text("Codex → Slinck → AWS Mac")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .accessibilityIdentifier("smoke.subtitle")
        }
        .padding(32)
        .onAppear {
            isPulsing = !reduceMotion
        }
        .onChange(of: reduceMotion) { _, shouldReduceMotion in
            isPulsing = !shouldReduceMotion
        }
    }
}

#Preview {
    ContentView()
}
