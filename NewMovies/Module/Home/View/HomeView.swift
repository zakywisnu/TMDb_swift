//
//  HomeView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 01/02/21.
//

import SwiftUI
import Core
import Movies

struct HomeView: View {
    
    @ObservedObject var presenter: GetListPresenter<Int, MovieModel, Interactor<Int, [MovieModel], GetListMovieRepository<GetMovieLocalDataSource, GetListMovieRemoteDataSource, MovieListTransformer>>>
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else if presenter.list.isEmpty {
                emptyIndicator
            } else {
                content
            }
        }.onAppear {
            print(self.presenter.list)
            if self.presenter.list.count == 0 {
                self.presenter.getList(request: 0)
            }
        }.navigationBarTitle(
            Text("Popular Movies"),displayMode: .automatic
        )
        
    }
}

extension HomeView {
    var loadingIndicator: some View {
        LoadingView()
    }
    var errorIndicator: some View {
        CustomEmptyView(image: "movie_icon", title: presenter.errorMessage)
    }
    
    var emptyIndicator: some View {
        CustomEmptyView(image: "empty_favorite", title: "The Movie Favorite is Empty")
    }
    
    var content: some View {
        ScrollView(.vertical,showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(self.presenter.list, id: \.id) { item in
                    ZStack {
                        self.linkBuilder(for: item) {
                            MovieList(movie: item)
                        }
                    }
                }
            }
        }
    }
    
    func linkBuilder<Content: View> (
        for movie: MovieModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: HomeRouter().makeDetailView(for: movie)){
            content()
        }
    }
}
