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

class FavoriteRouter {
    func makeDetailView(for movie: MovieModel) -> some View {
        let detailUseCase: Interactor<Int, MovieModel, GetDetailMovieRepository<GetMovieLocalDataSource, GetMovieRemoteDataSource, MovieTransformer>> = Injection.init().provideMovieDetail(by: movie.id)
        let favoriteUseCase: Interactor<Int, MovieModel, UpdateFavoriteMovieRepository<GetFavoriteLocalDataSource, MovieTransformer>> = Injection.init().provideUpdateFavorite()
        let presenter = MoviePresenter(movieUseCase: detailUseCase, favoriteUseCase: favoriteUseCase)
        return DetailView(presenter: presenter, movie: movie)
    }
}
