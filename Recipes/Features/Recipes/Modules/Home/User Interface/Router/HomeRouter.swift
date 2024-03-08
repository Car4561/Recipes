//
//  HomeRouter.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//


class HomeRouter: HomeRouterInput, Routable {
    
    weak var viewController: HomeViewController!
    
    func routeToDetailRecipe(_ recipe: Recipe) {
        pushViewController(
            from: viewController,
            to: RecipesDetailViewController.self,
            configuration: RecipesDetailModuleConfigurator.self,
            moduleConfiguration: { recipesDetailViewController in
                recipesDetailViewController.moduleInput().initializeModule(recipe: recipe)
            }
        )
    }
}
