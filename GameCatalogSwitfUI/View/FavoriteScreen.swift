//
//  FavoriteScreen.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 23/03/21.
//

import SwiftUI

struct FavoriteScreen: View {
    //    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavoriteGame.entity(), sortDescriptors: []) var favorites: FetchedResults<FavoriteGame>
    
    var body: some View {
        NavigationView {
            if favorites.isEmpty {
                EmptyState()
                    .navigationBarTitle("Favorite Games")
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
                    ForEach(favorites, id: \.id) { game in
                        Text(game.title ?? "Unknown")
                            //                    NavigationLink(
                            //                        destination: DetailScreen(game: game)) {
                            //                        GameCardView(game: game)
                            //                            .padding(.horizontal)
                            //                            .padding(.top)
                            //                    }
                            .listRowInsets(EdgeInsets())
                    }
                }
                .navigationBarTitle("Favorite Games")
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

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
