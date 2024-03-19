//
//  Mission.swift
//  Moonshot
//
//  Created by Víctor Ávila on 07/02/24.
//

import Foundation

// Each crew on missions.json will be a separate struct

// All but one missions have a launch date. How do we store something that might be a String, but might be null? With Optionals.
// If we mark some value as Optional, Swift will automatically skip it if the value is missing from the input JSON.
struct Mission: Codable, Identifiable, Hashable {
    // This CrewRole struct will be used exclusively to store data about Missions
    // This is a nested struct.
    // Instead of calling CrewRole, call Mission.CrewRole
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
//    let launchDate: String? // Since we used a DateFormatter(), we can say this is a Date? instead
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    // We will use computed properties here to avoid using string interpolation when selecting the assets to be plotted.
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    
    // Give us a formatted launchDate, please, that converts the Optional Date into a neatly formatted String or sends back "N/A"
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
