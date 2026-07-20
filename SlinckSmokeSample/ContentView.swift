import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "iphone")
                .font(.system(size: 56, weight: .medium))
                .foregroundStyle(.blue)

            Text("Hello, iOS")
                .font(.largeTitle.bold())
                .accessibilityIdentifier("smoke.title")

            Text("Edit this screen, then run it remotely.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .accessibilityIdentifier("smoke.subtitle")
        }
        .padding(32)
    }
}

#Preview {
    ContentView()
}
