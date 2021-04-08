//
//  NewMoviesApp.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 07/04/21.
//

import SwiftUI
import Core
import Movies
import Cleanse

@main
class NewMoviesApp: App {
    var homePresenter: MovieListPresenter
    var favoritePresenter: FavoriteMoviePresenter!
    var homeRouter: HomeRouter!
    var favoriteRouter: FavoriteRouter!
    
    required init() {
        let propertyInjector = try? ComponentFactory.of(AppComponent.self).build(())
        propertyInjector?.injectProperties(into: self)
    
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(homePresenter: homePresenter, favoritePresenter: favoritePresenter, homeRouter: homeRouter, favoriteRouter: favoriteRouter)
        }
    }
}

extension NewMoviesApp {
    func injectProperties(_ homePresenter: MovieListPresenter, _ favoritePresenter: FavoriteMoviePresenter, _ homeRouter: HomeRouter, _  favoriteRouter: FavoriteRouter) {
        self.homePresenter = homePresenter
        self.favoritePresenter = favoritePresenter
        self.homeRouter = homeRouter
        self.favoriteRouter = favoriteRouter
    }
}
