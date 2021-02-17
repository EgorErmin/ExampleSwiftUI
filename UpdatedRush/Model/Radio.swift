//
//  Landmark.swift
//  UpdatedRush
//
//  Created by EgorErmin on 16.02.2021.
//

import SwiftUI

struct Radio: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var location: String
    var rating: Int
    var views: Int
    var tags: [Tag]

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    struct Tag: Hashable, Codable {
        var name: String
    }
}
