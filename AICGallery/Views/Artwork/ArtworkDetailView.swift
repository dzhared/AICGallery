//
//  ArtworkDetailView.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    let artwork: Artwork
    var webURL: URL {
        URL(string: "https://www.artic.edu/artworks/\(artwork.id)/")!
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Image
                AsyncImage(url: artwork.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .accessibilityLabel(artwork.altText)
                } placeholder: {
                    ProgressView()
                }
                
                // Placard
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            Text(artwork.title)
                                .headlineSerif
                            Text(artwork.dateDisplay ?? "Unknown Date")
                                .subheadlineSerif
                            Text(artwork.mediumDisplay ?? "Unknown Medium")
                                .subheadlineSerif
                            Text(artwork.artistDisplay ?? "Anonymous")
                                .headlineSerif
                        }
                        Group {
                            Divider()
                            Text(artwork.altText)
                                .bodySerif
                        }
                        Group {
                            Divider()
                            Text("The data in this response is licensed under a Creative Commons Zero (CC0) 1.0 designation and the Terms and Conditions of artic.edu.")
                                .footnoteSerif
                        }
                    }
                    .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                LinkButton(text: "See on artic.edu", url: webURL)
            }
            .padding()
        }
    }
}

struct ArtworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkDetailView(artwork: Artwork.example)
    }
}
