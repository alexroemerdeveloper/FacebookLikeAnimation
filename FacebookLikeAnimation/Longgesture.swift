//
//  Longgesture.swift
//  FacebookLikeAnimation
//
//  Created by Alexander Römer on 11.01.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct Longgesture: UIViewRepresentable {
    
    @Binding var x      : Int
    @Binding var finish : Bool
    @Binding var txt    : String
    
    private let view    = UIView()
    
    func makeCoordinator() -> Longgesture.Coordinator {
        return Longgesture.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<Longgesture>) -> UIView {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.long(gesture:))))
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Longgesture>) {}
    
    
    class Coordinator: NSObject{
        
        var parent: Longgesture
        
        init(parent1: Longgesture) {
            parent = parent1
        }
        
        @objc func long(gesture: UILongPressGestureRecognizer){
            
            if gesture.state == .began {
                self.parent.finish = false
                self.parent.x = 0
            }
            
            if gesture.state == .changed {
                
                let value = gesture.location(in: self.parent.view).x
                
                if value > 0 && value < 58 {
                    self.parent.x   = 1
                    self.parent.txt = "Like"
                } else if value > 58 && value < 108 {
                    self.parent.x   = 2
                    self.parent.txt = "Love"
                } else if value > 108 && value < 158 {
                    self.parent.x   = 3
                    self.parent.txt = "Haha"
                } else if value > 158 && value < 208 {
                    self.parent.x   = 4
                    self.parent.txt = "Wow"
                } else if value > 218 && value < 278 {
                    self.parent.x   = 5
                    self.parent.txt = "Sad"
                } else if value > 278 && value < 325 {
                    self.parent.x   = 6
                    self.parent.txt = "Angry"
                }
            }
            
            if gesture.state == .ended {
                self.parent.finish = true
            }
        }
    }
}
