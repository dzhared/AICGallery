//
//  FavoriteButton.swift
//  vGallery
//
//  Created by Jared on 5/27/23.
//

import SwiftUI

struct FavoriteButton: View {
    
    @EnvironmentObject var dataManager: DataManager
    @Binding var artwork: Artwork
    @Binding var isFavorite: Bool
    
    var body: some View {
        Image(systemName: isFavorite ? "star.fill" : "star")
            .padding(10)
            .background(.thinMaterial)
            .clipShape(Circle())
            .padding()
            .onTapGesture {
                withAnimation(.easeOut(duration: 0.15)) {
                    isFavorite.toggle() // Toggle button's appearance
                }
                
                dataManager.toggle(artwork) // Add or remove from favorites accordingly
            }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(artwork: .constant(Artwork.example), isFavorite: .constant(true))
    }
}
