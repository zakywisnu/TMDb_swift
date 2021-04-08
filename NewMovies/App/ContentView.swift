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
    let homePresenter: MovieListPresenter
    let favoritePresenter: FavoriteMoviePresenter
    let homeRouter: HomeRouter
    let favoriteRouter: FavoriteRouter
    var body: some View {
        TabView {
            NavigationView{
                HomeView(homeRouter: homeRouter, presenter: homePresenter)
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView{
                FavoriteView(presenter: favoritePresenter, favoriteRouter: favoriteRouter)
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
