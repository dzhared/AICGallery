//
//  SearchSheetView.swift
//  AICGallery
//
//  Created by Jared on 5/19/23.
//

import SwiftUI

struct SearchSheetView: View {
    
    @Binding var searchText: String
    @Environment(\.dismiss) var dismiss
    @State private var selectedGenre: Genre = .architectureAndDesign
    @State private var showingGenre = true
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Search", text: $searchText)
                Group {
                    Toggle("Select a genre", isOn: $showingGenre)
                    if showingGenre {
                        withAnimation(.easeInOut) {
                            Picker("Genre", selection: $selectedGenre) {
                                ForEach(Genre.allCases, id: \.self) { genre in
                                    Text(genre.rawValue)
                                }
                            }
                        }
                    }
                }
                Button("Search") { dismiss() }
            }
        }
    }
}

struct SearchSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView(searchText: .constant("Preview Text"))
    }
}
