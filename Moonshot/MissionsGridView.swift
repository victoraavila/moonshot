//
//  MissionsGridView.swift
//  Moonshot
//
//  Created by Víctor Ávila on 12/02/24.
//

import SwiftUI

struct MissionsGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    // We'll use a property to make an adaptive column layout so we have a certain number of rows and columns depending on our screen size.
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            NavigationStack {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink(value: mission) {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100) // Keeping the correct aspect ratio of the badges no matter what size they are
                                    .padding() // To keep the images spaced in the center of every box
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            // Drawing a box around the grid
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .navigationDestination(for: Mission.self) { mission in
                    MissionView(mission: mission, astronauts: astronauts)
                }
            }
        }
    }
    
    init(missions: [Mission], astronauts: [String: Astronaut]) {
        self.missions = missions
        self.astronauts = astronauts
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return NavigationStack { // This NavigationStack is only for preview purposes. It doesn't affect on anything.
        MissionsGridView(missions: missions, astronauts: astronauts)
    }
}
