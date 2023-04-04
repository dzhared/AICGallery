//
//  Text+Extension.swift
//  AICGallery
//
//  Created by Jared on 4/2/23.
//

import SwiftUI

extension Text {
    var largeTitleSerif: some View {
        self.font(.system(.largeTitle, design: .serif))
    }
    
    var titleSerif: some View {
        self.font(.system(.title, design: .serif))
    }
    
    var title2Serif: some View {
        self.font(.system(.title2, design: .serif))
    }
    
    var title3Serif: some View {
        self.font(.system(.title3, design: .serif))
    }
    
    var headlineSerif: some View {
        self.font(.system(.headline, design: .serif))
    }
    
    var subheadlineSerif: some View {
        self.font(.system(.subheadline, design: .serif))
    }
    
    var bodySerif: some View {
        self.font(.system(.body, design: .serif))
    }
    
    var calloutSerif: some View {
        self.font(.system(.callout, design: .serif))
    }
    
    var captionSerif: some View {
        self.font(.system(.caption, design: .serif))
    }
    
    var caption2Serif: some View {
        self.font(.system(.caption2, design: .serif))
    }
    
    var footnoteSerif: some View {
        self.font(.system(.footnote, design: .serif))
    }
}
