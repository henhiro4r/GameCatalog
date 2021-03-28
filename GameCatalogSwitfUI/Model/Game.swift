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
    let releaseDate: String?
    let backgroundImage: String
    let rating: Double
    let playtime: Int
    var genres: [Genre]?
    let screenshots: [Screenshot]
    
    var genreJoined: String {
        mapGenreToString()
    }
    
    var releaseDateShort: String {
        getDateString(format: "short")
    }
    
    var releaseDateLong: String {
        getDateString(format: "long")
    }
    
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
    
    private func mapGenreToString() -> String {
        if let genres = genres {
            return genres.map { $0.name }
                .joined(separator: " | ")
        } else {
            return "-"
        }
    }
    
    private func getDateString(format: String) -> String {
        if let releaseDate = releaseDate {
            let fromString = DateFormatter()
            fromString.dateFormat = "yyyy-MM-dd"
            
            let toDate = DateFormatter()
            
            if format == "short" {
                toDate.dateFormat = "MMM dd, yyyy"
            } else {
                toDate.dateFormat = "MMMM dd, yyyy"
            }
            
            if let date = fromString.date(from: releaseDate) {
                return toDate.string(from: date)
            } else {
                print("There was an error decoding the string")
                return ""
            }
        } else {
            return "-"
        }
    }
    
    #if DEBUG
    static let example = Game(ids: 3498, title: "Grand Theft Auto V",
                              releaseDate: "2013-09-17",
                              backgroundImage:
                                "https://media.rawg.io/media/games/84d/84da2ac3fdfc6507807a1808595afb12.jpg",
                              rating: 4.48, playtime: 69,
                              genres: [
                                Genre(ids: 4, name: "Action"),
                                Genre(ids: 3, name: "Adventure")
                              ], screenshots: [
                                    Screenshot(ids: 1, image:
                                                "https://media.rawg.io/media/"
                                                +
                                                "games/84d/84da2ac3fdfc6507807a1808595afb12.jpg"),
                                    Screenshot(ids: 2, image:
                                                "https://media.rawg.io/media/"
                                                +
                                                "games/84d/84da2ac3fdfc6507807a1808595afb12.jpg"),
                                    Screenshot(ids: 3, image:
                                                "https://media.rawg.io/media/"
                                                +
                                                "games/84d/84da2ac3fdfc6507807a1808595afb12.jpg")
                                ]
    )
    #endif
}
