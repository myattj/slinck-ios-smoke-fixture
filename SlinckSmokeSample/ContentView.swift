import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var isPulsing = false

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

            Text("Built remotely")
                .font(.largeTitle.bold())
                .accessibilityIdentifier("smoke.title")

            Text("Claude → Slinck → AWS Mac")
                .font(.headline)
                .foregroundStyle(.secondary)
                .accessibilityIdentifier("smoke.subtitle")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
