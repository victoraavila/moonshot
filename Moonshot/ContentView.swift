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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                MissionsGridView(missions: missions, astronauts: astronauts)
//                LazyVGrid(columns: columns) {
//                    ForEach(missions) { mission in
//                        NavigationLink {
////                            Text("Detail view") // Initial placeholder when we didn't have a MissionView
//                            // We are gonna pass the exact mission with all the astronauts of the JSON every time
//                            MissionView(mission: mission, astronauts: astronauts)
//                        } label: {
//                            VStack {
//                                Image(mission.image)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100) // Keeping the correct aspect ratio of the badges no matter what size they are
//                                    .padding() // To keep the images spaced in the center of every box
//                                
//                                VStack {
//                                    Text(mission.displayName)
//                                        .font(.headline)
//                                        .foregroundStyle(.white)
//                                    
//                                    Text(mission.formattedLaunchDate)
//                                        .font(.caption)
//                                        .foregroundStyle(.gray)
//                                }
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//                                .background(.lightBackground)
//                            }
//                            // Drawing a box around the grid
//                            .clipShape(.rect(cornerRadius: 10))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.lightBackground)
//                            )
//                        }
//                    }
//                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            // We can tell SwiftUI our View prefers to be in Dark Mode always, so the title will be white no matter what
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
