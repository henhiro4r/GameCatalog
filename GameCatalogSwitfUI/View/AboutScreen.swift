//
//  AboutScreen.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 21/03/21.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("henry")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .padding(.vertical)
                .cornerRadius(20)
            
            HStack {
                Text("Henry")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("David Lie")
                    .font(.largeTitle)
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
