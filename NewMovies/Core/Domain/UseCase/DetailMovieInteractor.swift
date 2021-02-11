//
//  DetailMovieInteractor.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 10/02/21.
//

import Foundation
import RxSwift

protocol DetailUseCase {
    func getMovieDetail(id: String) -> Observable<MovieModel>
}

class DetailMovieInteractor: DetailUseCase {
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol){
        self.repository = repository
    }
    func getMovieDetail(id: String) -> Observable<MovieModel> {
        return repository.getMovieDetail(by: id)
    }
}
