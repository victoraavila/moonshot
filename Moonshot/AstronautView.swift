//
//  AstronautView.swift
//  Moonshot
//
//  Created by Víctor Ávila on 11/02/24.
//

import SwiftUI

struct AstronautView: View {
    // This is going to have a single Astronaut property to load
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .accessibilityHidden(true)
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!) // Use ! to force, because it is Preview code only
        .preferredColorScheme(.dark)
}
