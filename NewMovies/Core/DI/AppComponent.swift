//
//  AppComponent.swift
//  NewMovies
//
//  Created by Ahmad Zaky on 07/04/21.
//

import Cleanse
import Movies
import Core

struct AppComponent: Cleanse.RootComponent {
    
    typealias Root = PropertyInjector<NewMoviesApp>
    static func configure(binder: Binder<Singleton>) {
        binder.include(module: MovieListPresenter.Module.self)
//        binder.include(module: FavoriteMoviePresenter.Module.self)
        binder.include(module: HomeRouter.Module.self)
        binder.include(module: FavoriteRouter.Module.self)
    }
    
    static func configureRoot(binder bind: ReceiptBinder<PropertyInjector<NewMoviesApp>>) -> BindingReceipt<PropertyInjector<NewMoviesApp>> {
        return bind.propertyInjector{ (bind) -> BindingReceipt<PropertyInjector<NewMoviesApp>> in
            return bind.to(injector: NewMoviesApp.injectProperties)
        }
    }
    
}
