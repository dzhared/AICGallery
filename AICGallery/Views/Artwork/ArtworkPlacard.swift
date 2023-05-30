//
//  ArtworkPlacard.swift
//  vGallery
//
//  Created by Jared on 5/27/23.
//

import SwiftUI

struct ArtworkPlacard: View {
    
    let artwork: Artwork
    
    var body: some View {
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
                .accessibilityHidden(true)
            }
            .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct ArtworkPlacard_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkPlacard(artwork: Artwork.example)
    }
}
