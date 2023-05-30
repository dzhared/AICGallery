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
            if dataManager.favorites.isEmpty {
                Text("No favorites. Add an artwork to your favorites, and you'll see it here.")
                    .title2Serif
                    .padding(.horizontal)
            } else {
                List(dataManager.favorites, id: \.id) { artwork in
                    NavigationLink(destination: ArtworkDetailView(artwork: artwork)) {
                        Text(artwork.title)
                            .bodySerif
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
