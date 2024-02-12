//
//  ContentView.swift
//  Moonshot
//
//  Created by Víctor Ávila on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    // Previously, Bundle.main.decode() always returned a [String: Astronaut] dictionary.
    // Now, it could return any Codable at all. We have to specify which type astronauts is by using a Type Annotation.
//    let astronauts = Bundle.main.decode("astronauts.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // After implementing Generics, we can finally run Bundle.main.decode() on missions.json
    
    // A variable that will be used in a Button to toggle between List shape and Grid shape
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
                Group {
                    if showingGrid {
                        ScrollView {
                            MissionsGridView(missions: missions, astronauts: astronauts)
                                .padding([.horizontal, .bottom])
                        }
                    } else {
                        MissionsListView(missions: missions, astronauts: astronauts)
                            .padding([.trailing])
                    }
                }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            // We can tell SwiftUI our View prefers to be in Dark Mode always, so the title will be white no matter what
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("List/Grid") {
                        showingGrid.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
