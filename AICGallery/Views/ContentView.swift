//
//  ContentView.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                ArtworkGalleryView(genre: nil)
                    .tabItem {
                        Label("Featured", systemImage: "newspaper")
                    }
                    .accessibilityIdentifier("featuredGallery")
                
                GenreListView()
                    .tabItem {
                        Label("Genres", systemImage: "paintpalette")
                    }
                    .accessibilityIdentifier("genresButton")
                
                InfoView()
                    .tabItem {
                        Label("About", systemImage: "info.circle")
                    }
                    .accessibilityIdentifier("aboutButton")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
