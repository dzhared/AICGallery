//
//  FileManager-DocumentsDirectory.swift
//  ArtSearch
//
//  Created by Jared on 4/13/23.
//

import SwiftUI

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
