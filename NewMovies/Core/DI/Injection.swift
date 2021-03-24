//
//  Injection.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 02/02/21.
//

import Foundation
import Core
import Movies
import UIKit

final class Injection : NSObject {
    
    func provideMovieList<U: UseCase>() -> U where U.Request == Int, U.Response == [MovieModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let locale = GetMovieLocalDataSource(realm: appDelegate.realm)
        let remote = GetListMovieRemoteDataSource(endpoint: Endpoints.Gets.popular.url)
        let mapper = MovieListTransformer()
        
        let repository = GetListMovieRepository(localDataSource: locale, remoteDataSource: remote, mapper: mapper)
        return Interactor(repository: repository) as! U
    }
    
    func provideMovieDetail<U: UseCase>(by id: Int) -> U where U.Request == Int, U.Response == MovieModel {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = GetMovieLocalDataSource(realm: appDelegate.realm)
        let remote = GetMovieRemoteDataSource(endpoint: Endpoints.Gets.detailMovie(id: id).url)
        let mapper = MovieTransformer()
        let repository = GetDetailMovieRepository(localDataSource: local, remoteDataSource: remote, mapper: mapper)
        return Interactor(repository: repository) as! U
    }
    
    func provideFavorite<U: UseCase>() -> U where U.Request == Int, U.Response == [MovieModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = GetFavoriteLocalDataSource(realm: appDelegate.realm)
        let mapper = MovieListTransformer()
        let repository = GetFavoriteMovieRepository(localDataSource: local, mapper: mapper)
        return Interactor(repository: repository) as! U
    }
    
    func provideUpdateFavorite<U:UseCase>() -> U where U.Request == Int, U.Response == MovieModel{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let local = GetFavoriteLocalDataSource(realm: appDelegate.realm)
        let mapper = MovieTransformer()
        let repository = UpdateFavoriteMovieRepository(localeDataSource: local, mapper: mapper)
        return Interactor(repository: repository) as! U
    }
    
}
