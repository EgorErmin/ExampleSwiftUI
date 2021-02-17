//
//  Section.swift
//  UpdatedRush
//
//  Created by EgorErmin on 17.02.2021.
//

import SwiftUI

struct Section: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var radios: [LocalRadio]

    struct LocalRadio: Hashable, Codable {
        var name: String
        var imageName: String
    }
}
