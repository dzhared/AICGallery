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
        
        let thumbnail = Thumbnail(altText: "Abstract painting composed of small vertical dabs of multiple shades of blue with a small area of similar...")
        
        ArtworkDetailView(artwork: Artwork(id: 129884,
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
