//
//  HomeRouter.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 14/02/21.
//

import Cleanse
import SwiftUI
import Core
import Movies

class HomeRouter {
    let detailPresenter: Factory<MovieDetailPresenter.AssistedFeed>
    let updateFavorite: UpdateFavoriteMoviePresenter
    
    init(detailPresenter: Factory<MovieDetailPresenter.AssistedFeed>, updateFavoritePresenter: UpdateFavoriteMoviePresenter) {
        self.detailPresenter = detailPresenter
        self.updateFavorite = updateFavoritePresenter
    }
    
    func makeDetailView(for movie: MovieModel) -> some View {
        return DetailView(presenter: detailPresenter.build(movie), updateFavoritePresenter: updateFavorite)
    }
}

extension HomeRouter {
    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Singleton>) {
            binder.include(module: MovieDetailPresenter.Module.self)
            binder.bind(HomeRouter.self).to(factory: HomeRouter.init)
        }
    }
}
