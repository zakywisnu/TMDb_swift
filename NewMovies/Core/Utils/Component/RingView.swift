//
//  RingView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 11/02/21.
//

import SwiftUI

struct RingView: View {
    
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 7.0
    
    var body: some View {
        let multiplier = width / 44
        let vote = percent * 10
        let progress = 1 - (percent/10)
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            Circle()
                .trim(from: progress, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 5*multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0))
                .frame(width: width, height: height)
            Text("\(Int(vote))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
