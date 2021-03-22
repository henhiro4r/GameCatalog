//
//  LoadingIndicator.swift
//  GameCatalogSwitfUI
//
//  Created by Henry David Lie on 21/03/21.
//

import SwiftUI

struct LoadingIndicator: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<LoadingIndicator>) -> UIActivityIndicatorView {
        let loading = UIActivityIndicatorView(style: .large)
        loading.color = UIColor.white
        return loading
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingIndicator>) {
        uiView.startAnimating()
    }
}
