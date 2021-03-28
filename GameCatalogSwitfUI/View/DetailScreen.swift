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
    @State private var showAlertDialog = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: game.backgroundImage))
                    .resizable()
                    .indicator(Indicator.progress)
                    .transition(.fade(duration: 0.8))
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(game.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(game.genreJoined)
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
                                .indicator(Indicator.progress)
                                .transition(.fade(duration: 0.8))
                                .scaledToFill()
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
                    
                    Text(game.releaseDateLong)
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
        .navigationBarItems(
            trailing:
                Button(action: {
                    self.showAlertDialog = true
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
        )
        .alert(isPresented: $showAlertDialog) {
            Alert(title: Text("Are you sure want to " +
                                "delete \(game.title) from favorite?"),
                  primaryButton: .cancel(Text("Cancel")),
                  secondaryButton: .destructive(Text("Delete"),
                                                action: { }))
        }
    }
    
    struct DetailScreen_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                DetailScreen(game: Game.example)
            }
        }
    }
}
