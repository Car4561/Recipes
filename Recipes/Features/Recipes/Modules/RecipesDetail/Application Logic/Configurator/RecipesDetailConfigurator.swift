//
//  RecipesDetailConfigurator.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import UIKit

class RecipesDetailModuleConfigurator: ModuleConfigurator {

    static func configure(viewController: UIViewController) {
        guard let viewController = viewController as? RecipesDetailViewController else { return }

        let router = RecipesDetailRouter()
        router.viewController = viewController

        let presenter = RecipesDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RecipesDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
