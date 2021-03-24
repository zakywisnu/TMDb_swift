//
//  SceneDelegate.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 24/03/21.
//

import UIKit
import SwiftUI
import RealmSwift
import Core
import Movies

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let injection = Injection()
        
        let favoriteUseCase: Interactor<Int, [MovieModel], GetFavoriteMovieRepository<GetFavoriteLocalDataSource, MovieListTransformer>> = injection.provideFavorite()
        let homeUseCase: Interactor<Int, [MovieModel], GetListMovieRepository<GetMovieLocalDataSource, GetListMovieRemoteDataSource, MovieListTransformer>> = injection.provideMovieList()
        
        
        let homePresenter = GetListPresenter(useCase: homeUseCase)
        let favoritePresenter = GetListPresenter(useCase: favoriteUseCase)
        
        let contentView = ContentView()
            .environmentObject(homePresenter)
            .environmentObject(favoritePresenter)
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
}
