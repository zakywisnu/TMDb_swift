//
//  CustomEmptyView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 11/02/21.
//

import SwiftUI

struct CustomEmptyView: View {
    var image: String
    var title: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .frame(width: 100)
            
            Text(title)
                .font(.system(.body, design: .rounded))
        }
    }
}
