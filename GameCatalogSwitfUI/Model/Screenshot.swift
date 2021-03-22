//
//  Screenshot.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import Foundation

struct Screenshot: Codable {
    let ids: Int
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case ids = "id"
        case image
    }
}
