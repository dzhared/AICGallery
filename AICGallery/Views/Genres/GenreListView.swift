//
//  GenreListView.swift
//  AICGallery
//
//  Created by Jared on 4/1/23.
//

import SwiftUI

struct GenreListView: View {
    var body: some View {
        VStack {
            Text("All Genres")
                .title2Serif
            ScrollView {
                VStack {
                    ForEach(Genre.allCases, id: \.self) { genre in
                        GenreBadge(genre: genre.rawValue)
                    }
                }
            }
        }
    }
}

struct GenreListView_Previews: PreviewProvider {
    static var previews: some View {
        GenreListView()
    }
}
