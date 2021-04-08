//
//  FavoriteRouter.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 15/02/21.
//

import Foundation
import SwiftUI
import Core
import Movies
import Cleanse

class FavoriteRouter {
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

extension FavoriteRouter {
    struct Module: Cleanse.Module {
        static func configure(binder: Binder<Singleton>) {
            binder.include(module: MovieDetailPresenter.Module.self)
            binder.bind(FavoriteRouter.self).to(factory: FavoriteRouter.init)
        }
    }
}
