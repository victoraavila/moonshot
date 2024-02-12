//
//  MissionsListView.swift
//  Moonshot
//
//  Created by Víctor Ávila on 12/02/24.
//

import SwiftUI

struct MissionsListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            Section() {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100) // Keeping the correct aspect ratio of the badges no matter what size they are
                                .padding() // To keep the images spaced in the center of every box
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .listRowBackground(Color.darkBackground)
                }
            }
        }
        .listStyle(.plain)
//        .containerRelativeFrame(.vertical) { height, axis in
//            height * 1.2
//        }
        .frame(height: 2000) // To make sure it will ignore the safe area
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.container, edges: .bottom)
    }
    
    init(missions: [Mission], astronauts: [String: Astronaut]) {
        self.missions = missions
        self.astronauts = astronauts
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return MissionsListView(missions: missions, astronauts: astronauts)
}
