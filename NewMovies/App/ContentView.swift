//
//  ContentView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 01/02/21.
//

import SwiftUI
import Core
import Movies

struct ContentView: View {
    @EnvironmentObject var homePresenter: GetListPresenter<Int, MovieModel, Interactor<Int, [MovieModel], GetListMovieRepository<GetMovieLocalDataSource, GetListMovieRemoteDataSource, MovieListTransformer>>>
    @EnvironmentObject var favoritePresenter: GetListPresenter<Int, MovieModel, Interactor<Int, [MovieModel], GetFavoriteMovieRepository<GetFavoriteLocalDataSource, MovieListTransformer>>>
    var body: some View {
        TabView {
            NavigationView{
                HomeView(presenter: homePresenter)
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView{
                FavoriteView(presenter: favoritePresenter)
            }.tabItem {
                Image(systemName: "heart")
                Text("Favorite")
            }
            
            NavigationView{
                ProfileView()
            }.tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}
