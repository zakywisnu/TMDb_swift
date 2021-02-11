//
//  ColorRandomExt.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 02/02/21.
//

import SwiftUI

extension Color {

  static var random: Color {
    return Color(
        red: .random(in: 0.5...0.6),
        green: .random(in: 0.5...0.6),
        blue: .random(in: 0.5...0.6)
    )
  }
  
}
