//
//  DetailScreen.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 21/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailScreen: View {
    @State var game: Game
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: game.backgroundImage))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(game.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(game.genres
                                .map { $0.name }
                                .joined(separator: " | "))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    
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
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.primary.opacity(0.1))
                    .clipShape(Capsule())
                }
                .padding()
                .background(Color.white.opacity(0.1))
                
                Text("Screenshots")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(game.screenshots, id: \.ids) { screenshot in
                            WebImage(url: URL(string: screenshot.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 200)
                                .cornerRadius(25)
                                .padding()
                        }
                    }
                }.frame(height: 200)
                
                HStack {
                    Text("Release Date: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                    
                    Text(formatDate(releaseDate: game.releaseDate))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                }
                
                HStack {
                    Text("Playtime: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                    
                    Text("\(game.playtime)")
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                    
                    Image(systemName: "clock.fill")
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formatDate(releaseDate: String) -> String {
        let fromString = DateFormatter()
        fromString.dateFormat = "yyyy-MM-dd"
        
        let toDate = DateFormatter()
        toDate.dateFormat = "MMMM dd, yyyy"
        
        if let date = fromString.date(from: releaseDate) {
            return toDate.string(from: date)
        } else {
            print("There was an error decoding the string")
            return ""
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailScreen(game: Game.example)
        }
    }
}
