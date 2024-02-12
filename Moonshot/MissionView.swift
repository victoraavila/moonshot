//
//  MissionView.swift
//  Moonshot
//
//  Created by Víctor Ávila on 11/02/24.
//

import SwiftUI

// The mission badge, the mission description, and all the astronauts that were part of the crew (with their roles).
// We will have to match crew IDs with crew details from both JSONs.

struct MissionView: View {
    // Initially, it will only have a property to track whether the View is being viewed or not.
    let mission: Mission
    
    let astronauts: [String: Astronaut]
    
    var body: some View {
        // We will use a Container Relative Frame for the mission badge to set its width correctly
        // 1/2 of screen < badge width < 3/4 of screen works better than full screen.
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit() // To keep the original image aspect ratio
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6 // Take the parent width and multiply by 0.6 (to get 60% of it)
                    }
                
                VStack(alignment: .leading) { // We want the image to be centered, and the text to be in the leading edge
                    
                    // Adding a custom Divider with vertical and horizontal padding to better separate badge, launch date, description and astronauts
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Launch Date")
                        .font(.title.bold())
                        .padding(.bottom, 5) // So it stays 5 points away of the thing below it
                    
                    Text(mission.formattedLaunchDate)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5) // So it stays 5 points away of the thing below it
                    
                    Text(mission.description)
                    
                    // Adding a custom Divider with vertical and horizontal padding to better separate badge, description and astronauts
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    // Adding a title to the crew
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5) // To be distant from the photos
                }
                .padding(.horizontal) // So it stays away from the edges of the screen
                
                // The following ScrollView is not inside the above VStack to guarantee that it slides completely from edge to edge (the above VStack has horizontal padding)
                CrewView(mission: mission, astronauts: astronauts)
            }
            .padding(.bottom) // So it doesn't sit right next to the very edge of the bottom of the screen
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    // A custom initializer that accepts the Mission it represents, along with all the Astronauts, and then figure out the crew Array.
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.astronauts = astronauts
    }
}

#Preview {
    // Hopefully, our Bundle Extensions works here too
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[2], astronauts: astronauts) // We need to pass in a mission and an astronaut
    // This is just for the Preview. It is not changing the code.
    // We don't need to set this in our Main View, because the NavigationStack already does so. The whole stack will be set automatically from there.
        .preferredColorScheme(.dark)
}
