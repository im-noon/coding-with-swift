//
//  DetailView.swift
//  HAX0R News
//
//  Created by Slimn Srarena on 25/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "www")
    }
}
