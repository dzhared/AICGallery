//
//  ContentView.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        // Corrects bug of translucent tab bar background turning transparent
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        NavigationView {
            TabView {
                ArtworkGalleryView(genre: nil)
                    .tabItem {
                        Label("Featured", systemImage: "newspaper")
                    }
                    .accessibilityIdentifier("featuredGallery")
                
                SearchResultsView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
                GenreListView()
                    .tabItem {
                        Label("Genres", systemImage: "paintpalette")
                    }
                    .accessibilityIdentifier("genresButton")
                
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                
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
