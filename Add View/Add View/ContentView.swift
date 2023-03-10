//
//  ContentView.swift
//  Add View
//
//  Created by Aashish Bansal on 04/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack{
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "note.text")
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "doc")
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "photo")
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "mic.fill")
                
                // Plus Sign
                Image(systemName: "plus")
                    .font(.system(size: 40, weight: isAnimating ? .regular:.semibold, design: .rounded))
                    .foregroundColor(isAnimating ? Color.white:Color.black)
                    .rotationEffect(isAnimating ? .degrees(45):.degrees(0))
                    .scaleEffect(isAnimating ? 3:1)
                    .opacity(isAnimating ? 0.5:1)
                    .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1))
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            } // end of Inner ZStack
        } // end of Outer ZStack
    } // end of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
