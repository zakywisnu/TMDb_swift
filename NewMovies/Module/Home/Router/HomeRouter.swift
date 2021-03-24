//
//  HomeRouter.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 14/02/21.
//

import Foundation
import SwiftUI
import Core
import Movies

class HomeRouter {
    func makeDetailView(for movies: MovieModel) -> some View {
        let detailUseCase: Interactor<Int, MovieModel, GetDetailMovieRepository<GetMovieLocalDataSource, GetMovieRemoteDataSource, MovieTransformer>> = Injection.init().provideMovieDetail(by: movies.id)
        let favoriteUseCase: Interactor<Int, MovieModel, UpdateFavoriteMovieRepository<GetFavoriteLocalDataSource, MovieTransformer>> = Injection.init().provideUpdateFavorite()
        let presenter = MoviePresenter(movieUseCase: detailUseCase, favoriteUseCase: favoriteUseCase)
        return DetailView(presenter: presenter, movie: movies)
    }
}
