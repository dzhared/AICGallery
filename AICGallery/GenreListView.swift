//
//  GenreListView.swift
//  AICGallery
//
//  Created by Jared on 4/1/23.
//

import SwiftUI

struct GenreListView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("All Genres")
                    .font(.system(.title, design: .serif))
                ForEach(Genres.allCases, id: \.self) { genre in
                    GenreBadge(genre: genre.rawValue)
                }
            }
        }
    }
}

enum Genres: String, CaseIterable {
    case architectureAndDesign = "Architecture and Design"
    case artsOfAfrica = "Arts of Africa"
    case artsOfTheAmericas = "Arts of the Americas"
    case artsOfAsia = "Arts of Asia"
    case contemporaryArt = "Contemporary Art"
    case modernArt = "Modern Art"
    case paintingAndSculptureOfEurope = "Painting and Sculpture of Europe"
    case photographyAndMedia = "Photography and Media"
    case printsAndDrawings = "Prints and Drawings"
}

struct GenreListView_Previews: PreviewProvider {
    static var previews: some View {
        GenreListView()
    }
}
