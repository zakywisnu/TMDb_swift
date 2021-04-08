//
//  FavoriteView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 15/02/21.
//

import SwiftUI
import Core
import Movies

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoriteMoviePresenter
    var favoriteRouter: FavoriteRouter
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
        }.onAppear{
            self.presenter.getList(request: nil)
        }
        .navigationBarTitle(
            Text("Favorite Movies"), displayMode: .automatic
        )
    }
}

extension FavoriteView {
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
                        self.detailLinkBuilder(for: item){
                            MovieList(movie: item)
                        }
                    }
                }
            }
        }
    }
}

extension FavoriteView {
    func detailLinkBuilder<Content: View>(
        for movie: MovieModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        ZStack {
            NavigationLink(destination: favoriteRouter.makeDetailView(for: movie)) {  }
            content()
        }
    }
}
