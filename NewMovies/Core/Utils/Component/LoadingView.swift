//
//  LoadingView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 11/02/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {  
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(3)
            
            Text("Loading")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .offset(y: 30)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
