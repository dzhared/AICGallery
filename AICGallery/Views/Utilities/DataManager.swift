//
//  DataManager.swift
//  vGallery
//
//  Created by Jared on 5/27/23.
//

import Foundation

class DataManager: ObservableObject {
    
    @Published var favorites = [Artwork]()
    
    private let fileName = "favorites.json"
    private var filePath: URL {
        FileManager.documentsDirectory.appendingPathComponent(fileName)
    }
    
    init() {
        load()
    }
    
    private func load() {
        do {
            // Attempt to decode and return favorites as array of Artwork structs
            let data = try Data(contentsOf: filePath)
            let decoded = try JSONDecoder().decode([Artwork].self, from: data)
            favorites = decoded
        } catch {
            // Return empty array if load fails
            print("Error when loading favorites: \(error.localizedDescription)")
            favorites = []
        }
    }
    
    private func save() {
        do {
            // Attempt to encode and write favorites as array of Artwork structs
            let encoded = try JSONEncoder().encode(favorites)
            try encoded.write(to: filePath, options: [.atomic, .completeFileProtection])
        } catch {
            // Do nothing
            print("Failed to save favorites: \(error.localizedDescription)")
        }
    }
    
    func add(_ newArtwork: Artwork) {
        // Escape if artwork is already in favorites
        guard !favorites.contains(newArtwork) else {
            print("Already in favorites.")
            return
        }
        
        // Add and save new favorite
        favorites.append(newArtwork)
        save()
    }
    
    func remove(_ artwork: Artwork) {
        // Attempt to find index of existing favorite, then remove and save if found
        if let index = favorites.firstIndex(where: { $0.id == artwork.id }) {
            favorites.remove(at: index)
            save()
        } else {
            print("Failed to remove \(artwork.title) from favorites.")
        }
    }
    
    func toggle(_ artwork: Artwork) {
        if favorites.contains(artwork) {
            remove(artwork)
            print("Removed \"\(artwork.title)\" from favorites.")
        } else {
            add(artwork)
            print("Added \"\(artwork.title)\" to favorites.")
        }
        
        save()
    }
}


