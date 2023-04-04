//
//  LinkButton.swift
//  AICGallery
//
//  Created by Jared on 4/2/23.
//

import SwiftUI

struct LinkButton: View {
    
    let text: String
    let url: URL
    
    var body: some View {
        Link(destination: url) {
            Text(text)
                .bodySerif
            Image(systemName: "link")
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct LinkButton_Previews: PreviewProvider {
    static var previews: some View {
        LinkButton(text: "AIC Terms & Conditions", url: URL(string: "https://artic.edu/terms")!)
    }
}
