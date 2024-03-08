//
//  RecipesDetailRouter.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

class RecipesDetailRouter: RecipesDetailRouterInput, Routable {
    
    weak var viewController: RecipesDetailViewController!
    
    func routeToMap(recipe: Recipe) {
        pushViewController(
            from: viewController,
            to: MapViewController.self,
            configuration: MapModuleConfigurator.self,
            moduleConfiguration: { mapViewController in
                mapViewController.moduleInput().initializeModule(recipe: recipe)
            }
        )
    }
}
