//
//  ContentView.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 18/03/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            GameScreen()
                .tabItem {
                    Label("Game", systemImage: "gamecontroller")
                }
            
            FavoriteScreen()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
