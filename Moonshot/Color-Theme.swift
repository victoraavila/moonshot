//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Víctor Ávila on 08/02/24.
//

import SwiftUI

// How to share custom colors easily?
// We can add them directly on the Assets Catalog or do it as pure Swift code.
// We could store them as an extension of the Color type;
// OR we could store them as an extension of the ShapeStyle (which is also responsible for colors, gradients, materials, etc.)
// We can define that this extension will only be applied when working with colors:
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
