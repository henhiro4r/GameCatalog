//
//  GameCardView.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 19/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameCardView: View {
    @State var game: Game
    
    var body: some View {
        VStack(alignment: .center) {
            WebImage(url: URL(string: game.backgroundImage))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
            
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
                
                Text("\(formatDate(releaseDate: game.releaseDate))")
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
    
    private func formatDate(releaseDate: String) -> String {
        let fromString = DateFormatter()
        fromString.dateFormat = "yyyy-MM-dd"
        
        let toDate = DateFormatter()
        toDate.dateFormat = "MMM dd, yyyy"
        
        if let date = fromString.date(from: releaseDate) {
            return toDate.string(from: date)
        } else {
            print("There was an error decoding the string")
            return ""
        }
    }
}
