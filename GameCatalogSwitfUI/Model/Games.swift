//
//  Games.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import Foundation

struct Games: Codable {
    let count: Int
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case count
        case games = "results"
    }
}
