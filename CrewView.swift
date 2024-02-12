//
//  CrewView.swift
//  Moonshot
//
//  Created by Víctor Ávila on 12/02/24.
//

import SwiftUI

struct CrewView: View {
    // The content from this struct will be shown in this View
//    struct CrewMember {
//        let role: String
//        let astronaut: Astronaut
//    }
    
    // Initially, it will only have a property to track whether the View is being viewed or not.
//    let mission: Mission
    
    // An array of fully resolved CrewMembers, i.e., role + Astronaut already merged from both JSONs
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // To not show the scrolling bar below the astronauts
            HStack {
                ForEach(crew, id: \.role) { crewMember in // The role is unique for each mission
                    NavigationLink {
//                                Text("Astronaut details") // Initial placeholder when we didn't have an AstronautView
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay( // To draw something over it
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
//                                            .foregroundStyle(.secondary)
                                    .foregroundStyle(.white.opacity(0.5)) // So it won't be displayed as a blue-ish link color.
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    // A custom initializer that accepts the Mission it represents, along with all the Astronauts, and then figure out the crew Array.
    init(crew: [MissionView.CrewMember]) {
        self.crew = crew
    }
}

#Preview {
    // Hopefully, our Bundle Extensions works here too
//    let missions: [Mission] = Bundle.main.decode("missions.json")
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    
//    return CrewView(crew: crew) // We need to pass in a mission and an astronaut
//    // This is just for the Preview. It is not changing the code.
//    // We don't need to set this in our Main View, because the NavigationStack already does so. The whole stack will be set automatically from there.
//        .preferredColorScheme(.dark)
    return Text("In development")
}
