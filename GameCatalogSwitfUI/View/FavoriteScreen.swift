//
//  FavoriteScreen.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 23/03/21.
//

import SwiftUI

struct FavoriteScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

struct FavoriteScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteScreen()
    }
}
