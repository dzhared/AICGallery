//
//  GenreBadge.swift
//  AICGallery
//
//  Created by Jared on 3/31/23.
//

import SwiftUI

struct GenreBadge: View {
    
    @State var artworks = [Artwork]()
    let genre: String
    
    var body: some View {
        NavigationLink(destination: ArtworkGalleryView(genre: genre)) {
            ZStack(alignment: .bottomLeading) {
                // Representative image for genre
                Image(genre)
                    .resizable()
                    .scaledToFill()
                
                // Genre title
                Text(genre)
                    .headlineSerif
                    .lineLimit(2)
                    .foregroundColor(.primary)
                    .padding(10)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
        }
        .accessibilityIdentifier("genreBadge")
    }
}

struct GenreBadge_Previews: PreviewProvider {
    static var previews: some View {
        GenreBadge(genre: Genre.artsOfAsia.rawValue)
    }
}
