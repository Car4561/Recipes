//
//  RecipesDetailPresenter.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

class RecipesDetailPresenter {

    weak var view: RecipesDetailViewInput!
    var interactor: RecipesDetailInteractorInput!
    var router: RecipesDetailRouterInput!
    
    var recipe: Recipe!
}


// MARK: RecipesDetailModuleInput methods

extension RecipesDetailPresenter: RecipesDetailModuleInput {

    func initializeModule(recipe: Recipe) {
        self.recipe = recipe
    }
}


// MARK: RecipesDetailViewOutput methods

extension RecipesDetailPresenter: RecipesDetailViewOutput {
    
    func viewIsReady() {
        view.setRecipe(recipe)
    }
    
    func didTapMapButton() {
        router.routeToMap(recipe: recipe)
    }
}


// MARK: RecipesDetailInteractorOutput methods

extension RecipesDetailPresenter: RecipesDetailInteractorOutput {
}
