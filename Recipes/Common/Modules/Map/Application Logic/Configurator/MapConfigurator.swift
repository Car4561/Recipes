//
//  MapConfigurator.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import UIKit

class MapModuleConfigurator: ModuleConfigurator {

    static func configure(viewController: UIViewController) {
        guard let viewController = viewController as? MapViewController else { return }
    
        let router = MapRouter()

        let presenter = MapPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MapInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
