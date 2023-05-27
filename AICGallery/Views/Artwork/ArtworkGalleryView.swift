//
//  ArtworkGalleryView.swift
//  AICGallery
//
//  Created by Jared on 4/1/23.
//

import SwiftUI

struct ArtworkGalleryView: View {
    
    @State private var retrievedArtworks = [Artwork]()
    let genre: String?
    let limit: Int = 20
    
    var body: some View {
        VStack {
            Text(genre ?? "Featured")
                .title2Serif
                .multilineTextAlignment(.center)
            ScrollView {
                VStack {
                    // "Featured" page also uses ArtworkGalleryView instead of making redundant view
                    ForEach(retrievedArtworks, id: \.id) { artwork in
                        if artwork.imageId != nil {
                            ArtworkBadge(artwork: artwork)
                        }
                    }
                    
                    // Manually load images if first attempt fails
                    if retrievedArtworks.isEmpty {
                        Button {
                            getArtworks(for: genre ?? nil, limit: limit) { artworks in
                                retrievedArtworks = artworks
                            }
                        } label: {
                            Text("Tap to load images.")
                                .headlineSerif
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                }
            }
            .onAppear {
                // Initially populate images and prevent redundant GET requests
                if retrievedArtworks.isEmpty {
                    getArtworks(for: genre ?? nil, limit: limit) { artworks in
                        retrievedArtworks = artworks
                    }
                }
            }
        }
    }
}

struct GenreGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkGalleryView(genre: Genre.artsOfAfrica.rawValue)
    }
}
