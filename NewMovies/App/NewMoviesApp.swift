//
//  NewMoviesApp.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 01/02/21.
//

import SwiftUI

@main
struct NewMoviesApp: App {
    
    @StateObject var presenter = HomePresenter(homeUseCase: Injection().provideHome())
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: presenter)
        }
    }
}
