import SwiftUI

struct ContentView: View {
    private let status = SmokeStatus.sample
    @State private var qualificationInput = ""
    @State private var isRecordingReady = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        ZStack {
            DemoBackground()

            ScrollView {
                VStack(alignment: .leading, spacing: DemoMetrics.sectionSpacing) {
                    DemoHeaderView()
                    BuildHeroView(status: status)
                    BuildStatusCard(status: status)
                    ReadyActionView(
                        isReady: isRecordingReady,
                        action: markRecordingReady
                    )
                    QualificationPanel(input: $qualificationInput)
                }
                .frame(maxWidth: DemoMetrics.contentMaxWidth, alignment: .leading)
                .padding(.horizontal, DemoMetrics.pageInset)
                .padding(.vertical, DemoMetrics.pageInset)
                .frame(maxWidth: .infinity)
            }
            .scrollIndicators(.hidden)
            .accessibilityIdentifier("qualification.scroll")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .tint(DemoPalette.accent)
    }

    private func markRecordingReady() {
        if reduceMotion {
            isRecordingReady.toggle()
        } else {
            withAnimation(.easeInOut(duration: 0.2)) {
                isRecordingReady.toggle()
            }
        }
    }
}

#Preview("Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}
