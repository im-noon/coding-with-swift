//
//  WebView.swift
//  HAX0R News
//
//  Created by Slimn Srarena on 25/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WebView.UIViewType, context:Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
