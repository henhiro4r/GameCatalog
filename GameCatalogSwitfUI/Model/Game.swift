//
//  Game.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import Foundation

struct Game: Codable {
    let ids: Int
    let title: String
    let releaseDate: String
    let backgroundImage: String
    let rating: Double
    let playtime: Int
    let genres: [Genre]
    let screenshots: [Screenshot]
    
    enum CodingKeys: String, CodingKey {
        case ids = "id"
        case title = "name"
        case releaseDate = "released"
        case backgroundImage = "background_image"
        case rating
        case playtime
        case genres
        case screenshots = "short_screenshots"
    }
}
