//
//  ContentView.swift
//  MiCard
//
//  Created by Slimn Srarena on 24/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red:0.09, green:0.63, blue:0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("noon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                
                Text("Noon Studio")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Text("Software Engineer")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                
                Divider()
                
                contactView(infoText:"+66 612 345 678", imageName: "phone.fill")
                
                contactView(infoText:"noon@studio.io", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


