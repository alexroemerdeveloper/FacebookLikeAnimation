//
//  ContentView.swift
//  FacebookLikeAnimation
//
//  Created by Alexander Römer on 11.01.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var x: Int   = 0
    @State private var finish   = false
    @State private var txt      = ""
    
    var body: some View {
        VStack{
            HStack(spacing: 8){
                Image("Like").resizable().frame(width: 50, height: 50).offset(y: (self.x == 1 && !self.finish) ? -55 : 0)
                Image("Love").resizable().frame(width: 50, height: 55).offset(y: (self.x == 2 && !self.finish) ? -55 : 0)
                Image("Haha").resizable().frame(width: 50, height: 50).offset(y: (self.x == 3 && !self.finish) ? -55 : 0)
                Image("Wow").resizable().frame(width: 50, height: 50).offset(y: (self.x == 4 && !self.finish) ? -55 : 0)
                Image("Sad").resizable().frame(width: 50, height: 50).offset(y: (self.x == 5 && !self.finish) ? -55 : 0)
                Image("Angry").resizable().frame(width: 50, height: 50).offset(y: (self.x == 6 && !self.finish) ? -55 : 0)
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 25).fill(Color("Color")))
            .overlay(Longgesture(x: $x, finish: $finish, txt: $txt))
            .animation(.spring())
        
            Text(txt).fontWeight(.heavy).padding(.top,15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
