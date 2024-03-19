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
        NavigationStack {
            List {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
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
                    .alignmentGuide(.listRowSeparatorLeading) { d in
                        d[.leading]
                    } // To stop beginning the row separator along the text. Take all row in consideration instead.
                    .listSectionSeparator(.hidden, edges: .top) // To remove the section separator between the Navigation Title and first row
                    .listRowBackground(Color.darkBackground)
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity)
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
    
    return MissionsListView(missions: missions, astronauts: astronauts)
}
