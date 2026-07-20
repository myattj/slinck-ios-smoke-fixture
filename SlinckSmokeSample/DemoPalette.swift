import SwiftUI

enum DemoPalette {
    static let accent = Color(red: 0.29, green: 0.91, blue: 0.78)
    static let electricBlue = Color(red: 0.28, green: 0.55, blue: 1.0)
    static let violet = Color(red: 0.49, green: 0.35, blue: 0.98)
    static let success = Color(red: 0.25, green: 0.80, blue: 0.50)

    static func canvas(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color(red: 0.025, green: 0.045, blue: 0.09)
            : Color(red: 0.93, green: 0.96, blue: 1.0)
    }

    static func surface(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color(red: 0.07, green: 0.10, blue: 0.17)
            : .white
    }

    static func elevatedSurface(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color(red: 0.10, green: 0.14, blue: 0.23)
            : Color(red: 0.97, green: 0.98, blue: 1.0)
    }

    static func border(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color.white.opacity(0.12)
            : Color(red: 0.10, green: 0.18, blue: 0.34).opacity(0.12)
    }

    static func primaryText(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? .white
            : Color(red: 0.055, green: 0.08, blue: 0.15)
    }

    static func secondaryText(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color.white.opacity(0.70)
            : Color(red: 0.20, green: 0.27, blue: 0.40)
    }
}
