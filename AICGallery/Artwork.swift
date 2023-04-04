//
//  Artwork.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

// MARK: - Structs

struct Response: Codable {
    let data: [Artwork]
}

struct Artwork: Codable {
    let id: Int
    let title: String
    let artistTitle: String?
    let artistDisplay: String?
    let dateDisplay: String?
    let mediumDisplay: String?
    let imageId: String?            // Used to populate imageURL for AsyncImage
    let thumbnail: Thumbnail?       // Used to retrieve alt text
    let departmentTitle: String?    // Used for testing genre search
    
    var altText: String {
        thumbnail?.altText ?? "Alt text unavailable."
    }
    
    var imageURL: URL {
        // Returns URL for AsyncImage. Artwork structs without an imageId are
        // filtered out in ArtworkGalleryView but have a Placeholder() by default.
        URL(string: "https://www.artic.edu/iiif/2/\(imageId ?? "66c4dafb-2f53-f5ac-b676-32cafbe5b6bd")/full/843,/0/default.jpg")!
    }
    
    // JSONDecoder().convertFromSnakeCase used to eliminate need for CodingKey
}

// Alt text nested inside thumbnail in API response
struct Thumbnail: Codable {
    let altText: String?
}

// MARK: Functions

func getArtworks(for genre: String?, limit: Int, completion: @escaping ([Artwork]) -> Void) {
    let url = URL(string: "https://api.artic.edu/api/v1/artworks/search")!
    
    var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = [
        URLQueryItem(name: "q", value: genre),
        URLQueryItem(name: "limit", value: String(limit)),
        URLQueryItem(name: "fields", value: [
            "id",
            "title",
            "artist_title",
            "artist_display",
            "date_display",
            "medium_display",
            "image_id",
            "thumbnail",
            "department_title"].joined(separator: ","))
    ]
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: urlComponents.url!) { data, response, error in
        guard let data = data else {
            print("Error: no data received.")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(Response.self, from: data)
            completion(response.data)
        } catch let error {
            print("Error: \(error.localizedDescription).")
            completion([])
            return
        }
    }
    task.resume()
}
