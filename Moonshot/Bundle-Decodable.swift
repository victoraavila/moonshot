//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Víctor Ávila on 07/02/24.
//

import Foundation

// We will make an extension of Bundle to do it all in one centralized place
// String(contentsOf:) and Data(contentsOf:) work pretty much similarly. Give it an URL and it will either return the value or throw an error.
// But now, we get a Data back instead of a String.

// We use an Extension here because we'll load that JSON into our Content View.
// Anything that we can do to make the Views small and focused is a good thing
extension Bundle {
//    func decode(_ file: String) -> [String: Astronaut] {
//    func decode<T>(_ file: String) -> T {
    func decode<T: Codable>(_ file: String) -> T {
        // We use the 3 fatalErrors following because there is nothing to do if we commited the error of not inserting the JSON into the Bundle
        guard let url = self.url(forResource: file, withExtension: nil) else { // Extension is nil because the filename already has it
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // We found the file in the Bundle.
        // Next step is to try to load it out.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // Decode the data into our dictionary of String and Astronauts
        let decoder = JSONDecoder()
        
        // We are going to use a custom DateFormatter() in order to format the dates in DD-MM-YYYY instead of YYYY-MM-DD
        // It is important to set a timezone (we aren't in this case). Otherwise, the user's timezone will be used when parsing dates.
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd" // mm would mean "minutes"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else { // .self here is to pass in the type Astronaut
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}

// Generics allow us to write code that works with a vast array of different types at the same time
// In this example, we can extend the functionality of Bundle.decode() to also support returning Missions
// To make a method generic, we give it placeholders <T> for certain types ("some type of data is being used here")
// Now, everywhere in the method we can use <T> to refer to [string: Astronaut] or the array of Missions... whatever type we are trying to call this method with.
// T is a placeholder for whatever kind of type we ask this thing to decode.
// If we say "decode our dictionary of Astronauts", T will be it behind the scenes.
// If we say [T], we would be returning [[String: Astronaut]]
// We just have to constraint that T can be any type at all, as long as it conforms to Codable.
// Behind the scenes, Codable is not a protocol. It is a typealias for stuff that are Decodable & Encodable at the same time.
