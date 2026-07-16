import Foundation

struct SmokeStatus: Equatable {
    let title: String
    let buildLabel: String
    let artifactLabel: String

    static let sample = SmokeStatus(
        title: "Slinck Smoke Sample",
        buildLabel: "Build ready",
        artifactLabel: "Artifacts ready"
    )

    var accessibilitySummary: String {
        "\(title) \(buildLabel) \(artifactLabel)"
    }
}
