//
//  ExpandingView.swift
//  Add View
//
//  Created by Aashish Bansal on 04/03/23.
//

import SwiftUI

struct ExpandingView: View {
    
    @Binding var expand: Bool
    var direction: ExpandDirection
    var symbolName: String
    
    var body: some View {
        ZStack{
            ZStack{
                Image(systemName: symbolName)
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundColor(Color.black)
                    .padding()
                    .scaleEffect(expand ? 1:0)
                    .rotationEffect(expand ? .degrees(-43):.degrees(0))
                    .animation(.easeOut(duration: 0.15))
            }
            .frame(width: 82, height: 82)
            .cornerRadius(expand ? 41:8)
            .scaleEffect(expand ? 1:0.5)
            .offset(x: expand ? direction.offsets.0:0, y: expand ? direction.offsets.1:0)
            .rotationEffect(expand ? .degrees(43):.degrees(0))
            .animation(Animation.easeOut(duration: 0.25).delay(0.05))
        }
        .offset(x: direction.containerOffset.0, y: direction.containerOffset.1)
    }
}

struct ExpandingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingView(expand: .constant(true), direction: .bottom, symbolName: "doc.fill")
    }
}

// MARK: - Enum denoting Expansion of View
enum ExpandDirection{
    case bottom
    case left
    case right
    case top
    
    var offsets: (CGFloat, CGFloat){
        switch self{
        case .bottom:
            return (32, 64)
        case .left:
            return (-64, 32)
        case .top:
            return (-32, -64)
        case .right:
            return (64, -32)
        }
    } // end of variable offsets
    
    var containerOffset: (CGFloat, CGFloat){
        switch self{
        case .bottom:
            return (18, 18)
        case .left:
            return (-18, 18)
        case .top:
            return (-18, -18)
        case .right:
            return (18, -18)
        }
    } // end of variable containerOffset
} // end of enum
