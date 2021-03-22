//
//  Genre.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import Foundation

struct Genre: Codable {
    let ids: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case ids = "id"
        case name
    }
}
