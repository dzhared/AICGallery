//
//  FavoritesView.swift
//  vGallery
//
//  Created by Jared on 5/27/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Favorites")
                    .title2Serif
                    .padding(.top, 7)
                if dataManager.favorites.isEmpty {
                    ScrollView {
                        Text("No favorites. Add an artwork to your favorites, and you'll see it here.")
                            .title2Serif
                            .padding(.horizontal)
                    }
                } else {
                    List(dataManager.favorites, id: \.id) { artwork in
                        NavigationLink(destination: ArtworkDetailView(artwork: artwork)) {
                            VStack(alignment: .leading) {
                                Text(artwork.title)
                                    .bodySerif
                                    .lineLimit(3)
                                    .truncationMode(.tail)
                                Text(artwork.artistTitle ?? "Anonymous")
                                    .captionSerif
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 3)
                        }
                    }
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(DataManager())
    }
}
