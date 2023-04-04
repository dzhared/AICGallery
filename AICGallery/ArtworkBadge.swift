//
//  ArtworkBadge.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

struct ArtworkBadge: View {
    
    let artwork: Artwork
    
    var body: some View {
        NavigationLink(destination: ArtworkDetailView(artwork: artwork)) {
            VStack(alignment: .leading) {
                AsyncImage(url: artwork.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                }
                .accessibilityLabel(artwork.altText)
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(artwork.title)
                            .headlineSerif
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(artwork.artistTitle ?? "Anonymous")
                            .subheadlineSerif
                            .foregroundColor(.primary)
                    }
                    .multilineTextAlignment(.leading)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .offset(x: 0, y: -30)
            }
            .padding(.horizontal)
        }
    }
}

struct ArtworkBadge_Previews: PreviewProvider {
    static var previews: some View {
        
        let thumbnail = Thumbnail(altText: "Abstract painting composed of small vertical dabs of multiple shades of blue with a small area of similar...")
        
        ArtworkBadge(artwork: Artwork(id: 129884,
                                      title: "Starry Night and the Astronauts",
                                      artistTitle: "Alma Thomas",
                                      artistDisplay: "Alma Thomas\nAmerican, 1891–1978",
                                      dateDisplay: "1972",
                                      mediumDisplay: "Acrylic on canvas",
                                      imageId: "e966799b-97ee-1cc6-bd2f-a94b4b8bb8f9",
                                      thumbnail: thumbnail,
                                      departmentTitle: "Contemporary Art"))
    }
}
