//
//  RecipesDetailViewController.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import UIKit
import RecipesUI

class RecipesDetailViewController: UIViewController {

    // MARK: Properties

    var output: RecipesDetailViewOutput!

    private var customView: CustomView {
        guard let view = view as? CustomView else {
            fatalError("Could not load Custom View")
        }
        return view
    }

    // MARK: Life cycle
    
    override func loadView() {
        view = CustomView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = RecipesStrings.Detail.title
        configureMapButton()
        output.viewIsReady()
    }
    
    func configureMapButton() {
        let mapButtonItem = UIBarButtonItem(image: YPImages.mapIcon, style: .done, target: self, action: #selector(didTapQAButton))
        navigationItem.rightBarButtonItem = mapButtonItem
    }

    @objc func didTapQAButton() {
        output.didTapMapButton()
    }
}


// MARK: RecipesDetailViewInput Methods

extension RecipesDetailViewController: RecipesDetailViewInput {

    func setUpInitialState() {
    }
    
    func setRecipe(_ recipe: Recipe) {
        customView.configure(recipe: recipe)
    }

    func moduleInput() -> RecipesDetailModuleInput {
        return output as! RecipesDetailModuleInput
    }
}
