//
//  ImageUrl.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 28/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageUrl: View {
    @State var imageUrl: String
    
    var body: some View {
        WebImage(url: URL(string: imageUrl))
            .resizable()
            .indicator(Indicator.progress)
            .transition(.fade(duration: 0.8))
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width - 30, height: 250)
    }
}

struct ImageUrl_Previews: PreviewProvider {
    static var previews: some View {
        ImageUrl(imageUrl: "")
    }
}
