//
//  SearchResultsView.swift
//  AICGallery
//
//  Created by Jared on 5/19/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    @State private var showingSearchView = false
    @State private var searchText: String = ""
    @State private var searchedArtworks = [Artwork]()
    let genre: Genre? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                // "Featured" page also uses ArtworkGalleryView instead of making redundant view
                Text(searchText)
                    .titleSerif
                    .multilineTextAlignment(.center)
                ForEach(searchedArtworks, id: \.id) { artwork in
                    if artwork.imageId != nil {
                        ArtworkBadge(artwork: artwork)
                    }
                }
                
                // Manually load images if first attempt fails
                if searchedArtworks.isEmpty {
                    Button {
                        showingSearchView = true
                    } label: {
                        Text("Tap to search.")
                            .headlineSerif
                            .padding()
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
        }
        .onAppear {
            if searchedArtworks.isEmpty {
                showingSearchView = true
            }
        }
        .sheet(isPresented: $showingSearchView, onDismiss: {
            if !searchText.isEmpty {
                getArtworks(for: searchText, limit: 20) { artworks in
                    searchedArtworks = artworks
                }
            }
        }) {
            SearchSheetView(searchText: $searchText)
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}
