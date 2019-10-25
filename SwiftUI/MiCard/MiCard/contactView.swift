//
//  contactView.swift
//  MiCard
//
//  Created by Slimn Srarena on 24/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import SwiftUI

struct contactView: View {
    
    let infoText: String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(Color.green)
                Text(infoText)
                    .foregroundColor(Color("infoColor"))
            })
            .padding(.all)
    }
}


struct contactView_Previews: PreviewProvider {
    static var previews: some View {
        contactView(infoText: "Hello World", imageName: "phone.fill" )
            .previewLayout(.sizeThatFits)
    }
}
