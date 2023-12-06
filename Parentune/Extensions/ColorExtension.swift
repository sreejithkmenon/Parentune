//
//  ColorExtension.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

/// Extension of the `Color` structure in SwiftUI.
///
/// This extension provides an initializer to create a `Color` instance using a hex color code.
/// The hex code can be in 3 formats: RGB (12-bit), RGB (24-bit), and ARGB (32-bit).
extension Color {
    /// Initializes and returns a color object using the specified hexadecimal color code.
    ///
    /// - Parameter hex: A string representation of the hexadecimal color code.
    ///   It can be in 3 different formats:
    ///   - 3 characters: RGB (12-bit), e.g., "FFF"
    ///   - 6 characters: RGB (24-bit), e.g., "FF5733"
    ///   - 8 characters: ARGB (32-bit), e.g., "FF5733FF"
    ///
    /// The initializer first removes any non-alphanumeric characters from the input string.
    /// It then converts the hexadecimal string to an integer value, which is later used
    /// to extract individual color components.
    ///
    /// Assumptions:
    /// - The hex string, if not in the expected format, will default to black color (represented by "000000").
    /// - The alpha (opacity) value defaults to 255 (fully opaque) if not specified in the hex string.
    ///
    /// - Note: If the input hex string is not in one of the expected formats, the color will default to black.
    init(hex: String) {
        // Remove non-alphanumeric characters from the input string
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        // Convert the hexadecimal string to an integer value
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        // Declare variables to hold the alpha, red, green, and blue components of the color
        let a, r, g, b: UInt64
        
        // Extract individual color components based on the length of the hexadecimal string
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: // Default case to handle unexpected hex string formats
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        // Initialize the Color instance with the extracted color components
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
