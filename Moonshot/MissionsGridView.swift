import SwiftUI

struct MissionsGridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        ScrollView(.vertical) {
            NavigationStack {
                LazyVGrid(columns: columns) {
                    ForEach(Array(missions.enumerated()), id: \.element.id) { index, mission in
                        NavigationLink(value: mission) {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
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
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel("Mission: \(mission.displayName), Launch Date: \(mission.formattedLaunchDate)")
                            .accessibilityHint("Double tap to view mission details")
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
    
    return NavigationStack {
        MissionsGridView(missions: missions, astronauts: astronauts)
    }
}
