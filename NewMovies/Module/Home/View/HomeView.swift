//
//  HomeView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 01/02/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        
        ZStack {
//            if presenter.loadingState {
//                loadingIndicator
//            } else if presenter.errorState {
//                errorIndicator
//            } else if presenter.movies.isEmpty {
//                emptyIndicator
//            } else {
                content
//            }
        }.onAppear {
//            if self.presenter.movies.count == 0 {
                self.presenter.getMovies()
//            }
        }
        
    }
}

extension HomeView {
    var loadingIndicator: some View {
        LoadingView()
    }
    var errorIndicator: some View {
        CustomEmptyView(image: "movie_icon", title: presenter.errorMessages)
    }
    
    var emptyIndicator: some View {
        CustomEmptyView(image: "empty_favorite", title: "The Movie Favorite is Empty")
    }
    
    var content: some View {
        ScrollView(.vertical,showsIndicators: false) {
//            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(self.presenter.movies, id: \.id) { item in
                    MovieList(movie: item)
                }
//            }
        }
    }
}
