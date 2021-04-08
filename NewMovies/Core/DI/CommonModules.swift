//
//  CommonModules.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 07/04/21.
//

//import Core
//import Movies
//import SwiftUI
//import Foundation
//import Cleanse
//
//struct FoundationCommonModule: Module {
//    static func configure(binder: Binder<Singleton>) {
//        binder.bind(ProcessInfo.self)
//            .to{ProcessInfo.processInfo}
//    }
//}
//
//struct RootWindowModule: Cleanse.Module {
//    static func configure(binder: Binder<Singleton>) {
//        binder.include(module: MovieListPresenter.Module.self)
//        binder.include(module: HomeRouter.Module.self)
//        binder.include(module: FavoriteRouter.Module.self)
//        binder.include(module: FavoriteMoviePresenter.Module.self)
//        binder
//            .bind()
//            .to { (movieListPresenter: Provider<MovieListPresenter>, favoritePresenter: Provider<FavoriteMoviePresenter>, homeRouter: Provider<HomeRouter>, favoriteRouter: Provider<FavoriteRouter>) -> UIViewController in
//                let contentView = ContentView(homePresenter: movieListPresenter.get(), favoritePresenter: favoritePresenter.get(), homeRouter: homeRouter.get(), favoriteRouter: favoriteRouter.get())
//                return UIHostingController(rootView: contentView)
//            }
//    }
//}
//
//extension UIViewController {
//    public struct Root: Tag {
//        public typealias Element = UIViewController
//    }
//}
