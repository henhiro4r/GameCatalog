//
//  GameCardView.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import SwiftUI

struct GameCardView: View {
    @State var game: Game
    
    var body: some View {
        VStack(alignment: .center) {
            ImageUrl(imageUrl: game.backgroundImage)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(game.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text(String(game.rating))
                        if game.rating <= 4 {
                            Image(systemName: "star.leadinghalf.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                    }
                }
                
                Spacer(minLength: 0)
                
                Text(game.releaseDateShort)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.primary.opacity(0.1))
                    .clipShape(Capsule())
            }
            .padding()
        }
        .frame(height: 330)
        .background(Color.white.opacity(0.1))
        .cornerRadius(25)
    }
    
    struct GameCardView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                GameCardView(game: Game.example)
            }
        }
    }
}
