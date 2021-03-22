//
//  GameScreen.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 20/03/21.
//

import SwiftUI

struct GameScreen: View {
    @ObservedObject var games = ApiService()

    var body: some View {
        NavigationView {
            if games.isLoading {
                VStack {
                    LoadingIndicator()
                    Text("Please wait...")
                }
                .padding()
                .background(Color.black)
                .cornerRadius(25)
                .navigationTitle("Game Catalog")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AboutScreen()) {
                            Button(action: { }, label: {
                                Image(systemName: "person.circle")
                                    .font(.largeTitle)
                            })
                        }
                    }
                }
            } else {
                List {
                    ForEach(games.gameList, id: \.ids) { game in
                        NavigationLink(
                            destination: DetailScreen(game: game)) {
                            GameCardView(game: game)
                                .padding(.horizontal)
                                .padding(.top)
                        }
                        .listRowInsets(EdgeInsets())
                    }
                }
                .navigationBarTitle("Game Catalog")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AboutScreen()) {
                            Button(action: { }, label: {
                                Image(systemName: "person.circle")
                                    .font(.largeTitle)
                            })
                        }
                    }
                }
            }
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
