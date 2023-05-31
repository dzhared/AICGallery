//
//  InfoView.swift
//  AICGallery
//
//  Created by Jared on 4/1/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            Text("About")
                .title2Serif
                .padding(.top, 7)
            ScrollView {
                Divider()
                Text(infoViewText)
                    .bodySerif
                LinkButton(text: "Creative Commons", url: URL(string: "https://creativecommons.org/publicdomain/zero/1.0/")!)
                LinkButton(text: "AIC Terms & Conditions", url: URL(string: "https://www.artic.edu/terms")!)
            }
            .padding(.horizontal)
            .multilineTextAlignment(.leading)
        }
    }
}

private let infoViewText = """
This app is designed to search for artwork from the Art Institute of Chicago's public API. All works are part of AIC's collections and are retrieved directly from the API.\n\nThe data in all responses is licensed under a Creative Commons Zero (CC0) 1.0 designation and the Terms and Conditions of artic.edu.\n\nI am in no way affiliated with the Art Institute of Chicago.\n\nPlease see the following pages for additional information on licensing.\n
"""

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
