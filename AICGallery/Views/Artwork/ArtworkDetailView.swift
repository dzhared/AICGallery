//
//  ArtworkDetailView.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var isFavorite: Bool = false
    @State var artwork: Artwork
    
    private var webURL: URL {
        URL(string: "https://www.artic.edu/artworks/\(artwork.id)/")!
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Artwork with placeholder as needed
                    AsyncImage(url: artwork.imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .accessibilityLabel(artwork.altText)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    // Adds or removes artwork from favorites in DataManager
                    FavoriteButton(artwork: $artwork, isFavorite: $isFavorite)
                }
                
                // Placard with artwork details
                ArtworkPlacard(artwork: artwork)
                
                // Button to view more information online
                LinkButton(text: "See on artic.edu", url: webURL)
            }
            .padding()
        }
        .onAppear {
            updateFavoriteStatus()
        }
    }
    
    private func updateFavoriteStatus() {
        isFavorite = dataManager.favorites.contains(artwork)
    }
    
    private func toggleFavorite() {
        dataManager.toggle(artwork)
        updateFavoriteStatus()
    }
}

struct ArtworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkDetailView(artwork: Artwork.example)
            .environmentObject(DataManager())
    }
}
