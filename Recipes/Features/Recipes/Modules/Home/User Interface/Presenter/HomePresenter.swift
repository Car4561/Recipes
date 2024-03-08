//
//  HomePresenter.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import RecipesUI

class HomePresenter {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    
    var recipes: [Recipe] = [] {
        didSet {
            view.reloadRecipes()
        }
    }

    var recipesBackup: [Recipe] = []
}


// MARK: HomeModuleInput methods

extension HomePresenter: HomeModuleInput {

    func initializeModule() {
    }
}


// MARK: HomeViewOutput methods

extension HomePresenter: HomeViewOutput {

    var recipesCount: Int {
        recipes.count
    }

    func viewIsReady() {
        view.showYPActivityIndicatorView()
        interactor.getRecipesList()
    }
    
    func getRecipe(at index: Int) -> Recipe {
        recipes[index]
    }
    
    func didSelectedTabControlItem(_ item: YPTabItem) {
        guard let recipeCategory = item as? RecipeCategory else {
            recipes = recipesBackup
            return
        }
        recipes = recipesBackup.filter { $0.recipeCategory == recipeCategory }
    }
    
    func didTapSearchBarSearchButton(with textFilter: String) {
        recipes = textFilter.isEmpty ? recipesBackup : recipesBackup.filter { $0.name.lowercased().contains(textFilter) }
    }
    
    func didTapSearchBarCancelButton() {
        recipes = recipesBackup
    }
    
    func didSelectRecipe(at index: Int) {
        let recipe = recipes[index]
        router.routeToDetailRecipe(recipe)
    }
}


// MARK: HomeInteractorOutput methods

extension HomePresenter: HomeInteractorOutput {

    func didFetchRecipesList(_ recipes: [Recipe]) {
        view.hideYPActivityIndicatorView()
        self.recipes = recipes
        self.recipesBackup = recipes
    }
    
    func didFailFetchingRecipesList() {
        view.hideYPActivityIndicatorView()
    }
}
