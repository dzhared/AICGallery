//
//  SearchSheetView.swift
//  AICGallery
//
//  Created by Jared on 5/19/23.
//

import SwiftUI

struct SearchSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var searchText: String
    @Binding var numberResults: Double
    @State private var selectedGenre: Genre = .architectureAndDesign
    
    var body: some View {
        NavigationView {
            Form {
                ZStack(alignment: .trailing) {
                    TextField("Search", text: $searchText)
                    if !searchText.isEmpty {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                searchText = ""
                            }
                    }
                }
                HStack(spacing: 20) {
                    Text("Results:")
                    Slider(value: $numberResults, in: 5...50, step: 5)
                    Text("\(numberResults.formatted())")
                }
                
                Button("Search") { dismiss() }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

struct SearchSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView(searchText: .constant(""), numberResults: .constant(20))
    }
}
