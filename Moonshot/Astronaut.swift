//
//  Astronaut.swift
//  Moonshot
//
//  Created by Víctor Ávila on 07/02/24.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    // We can create instances of this struct straight out of the JSON (because of the Codable protocol)
    // Any kind of loop that loads dynamic data can use the id of this thing directly (because of the Identifiable protocol)
    // The following are the 3 fields of the JSON
    let id: String
    let name: String
    let description: String
}

// We want to convert astronauts.json into a dictionary of Astronaut instances
// We will use the Bundle class to find the location of our file
// Then, load that into a data instance and decode that into a dictionary of Astronauts

