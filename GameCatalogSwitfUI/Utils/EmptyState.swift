//
//  EmptyState.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 28/03/21.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack {
            Image("empty")
                .resizable()
                .scaledToFit()
                .padding()
            Text("No Collection")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
