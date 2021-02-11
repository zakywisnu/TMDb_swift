//
//  ContentView.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 01/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var presenter: HomePresenter
    var body: some View {
        NavigationView{
            HomeView(presenter: presenter).environmentObject(presenter)
        }
    }
}
