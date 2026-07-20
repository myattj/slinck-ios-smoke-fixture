import SwiftUI

struct DemoBackground: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            DemoPalette.canvas(for: colorScheme)

            Circle()
                .fill(DemoPalette.electricBlue.opacity(colorScheme == .dark ? 0.18 : 0.12))
                .frame(width: 340, height: 340)
                .blur(radius: 55)
                .offset(x: 150, y: -280)

            Circle()
                .fill(DemoPalette.violet.opacity(colorScheme == .dark ? 0.14 : 0.09))
                .frame(width: 280, height: 280)
                .blur(radius: 65)
                .offset(x: -170, y: 260)
        }
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }
}
