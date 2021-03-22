//
//  ApiService.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import Foundation
import SwiftUI
import Combine

class ApiService: ObservableObject {
    
    let apiKey = "35e4257703374bdd855336a86d8899ba"
    let pageSize = 20
    
    @Published var gameList = [Game]()
    @Published var isLoading = true
    
    init() {
        loadGames()
    }
    
    func loadGames() {
        guard let url = URL(string: "https://api.rawg.io/api/games?key=\(apiKey)&page_size=\(pageSize)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("\(error?.localizedDescription ?? "")")
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let games = try JSONDecoder().decode(Games.self, from: data)
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.gameList = games.games
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
}
