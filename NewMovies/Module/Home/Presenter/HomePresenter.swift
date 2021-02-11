//
//  HomePresenter.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 01/02/21.
//

import RxSwift
import SwiftUI

class HomePresenter: ObservableObject{
    private let disposeBag = DisposeBag()
    private let homeUseCase: HomeUseCase
    
    @Published var movies: [MovieModel] = []
    @Published var errorMessages: String = ""
    @Published var loadingState: Bool = false
    @Published var errorState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getMovies() {
        loadingState = true
        homeUseCase.getMovies()
            .observe(on: MainScheduler.instance)
            .subscribe{ result in
                print(result)
                self.movies = result
            } onError: { error in
                self.errorState = true
                self.loadingState = false
                self.errorMessages = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
                self.errorState = false
            }.disposed(by: disposeBag)
    }
}
