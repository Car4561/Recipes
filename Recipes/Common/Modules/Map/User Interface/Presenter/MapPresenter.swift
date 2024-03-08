//
//  MapPresenter.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

class MapPresenter {

    weak var view: MapViewInput!
    var interactor: MapInteractorInput!
    var router: MapRouterInput!
    
    var recipe: Recipe!
}


// MARK: MapModuleInput methods

extension MapPresenter: MapModuleInput {

    func initializeModule(recipe: Recipe) {
        self.recipe = recipe
    }
}


// MARK: MapViewOutput methods

extension MapPresenter: MapViewOutput {

    func viewIsReady() {
        view.setRecipe(recipe: recipe)
    }
}


// MARK: MapInteractorOutput methods

extension MapPresenter: MapInteractorOutput {
}
