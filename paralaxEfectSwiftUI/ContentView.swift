//
//  ContentView.swift
//  paralaxEfectSwiftUI
//
//  Created by Danilo Requena on 07/07/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            GeometryReader{reader in
                if reader.frame(in: .global).minY > -550 {
                    Image("main")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                    // Add parallax effect
                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + 550 : 550)
                }
            }
            .frame(height: 550)
            
            VStack(alignment: .leading, spacing: 15){
                Text("Steve Jobs")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                
                HStack(spacing: 15){
                    ForEach(1...6, id: \.self) {_ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                    }
                }
                Text("Algumas cenas talvez nnao sejam apropriadas para crianças")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                
                Text(plot)
                    .padding(.top,10)
                    .foregroundColor(.white)
                
                HStack {
                    Button(action: {}, label: {
                        Text("Bookmark")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    
                    Button(action: {}, label: {
                        Text("Like")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                .padding(.top, 25)
                
                
            }
            .padding(.top, 25)
            .padding(.horizontal)
            .background(Color.black)
            .cornerRadius(20)
            .offset(y: -35)
        })
            .edgesIgnoringSafeArea(.all)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

var plot = "Três momentos importantes da vida do inventor, empresário e magnata Steve Jobs: os bastidores do lançamento do computador Macintosh, em 1984; da empresa NeXT, doze anos depois e do iPod, no ano de 2001."

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
