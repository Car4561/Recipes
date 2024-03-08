//
//  HomeConfigurator.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import UIKit

class HomeModuleConfigurator: ModuleConfigurator {

    static func configure(viewController: UIViewController) {
        guard let viewController = viewController as? HomeViewController else { return }
        
        let router = HomeRouter()
        router.viewController = viewController
        
        let presenter = HomePresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = HomeInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
