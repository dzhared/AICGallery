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
    @State private var numberResults = 30.0
    @State private var selectedGenre: Genre = .architectureAndDesign
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Search", text: $searchText)
                HStack(spacing: 20) {
                    Text("Results:")
                    Slider(value: $numberResults, in: 5...50, step: 5)
                    Text("\(numberResults.formatted())")
                }
                
                Button("Search") { dismiss() }
            }
        }
    }
}

struct SearchSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView(searchText: .constant(""))
    }
}
