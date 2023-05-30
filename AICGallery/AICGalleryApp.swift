//
//  AICGalleryApp.swift
//  AICGallery
//
//  Created by Jared on 3/30/23.
//

import SwiftUI

@main
struct AICGalleryApp: App {
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(dataManager)
        }
    }
}
