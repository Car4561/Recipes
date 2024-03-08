//
//  RecipesDetailViewInput.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

protocol RecipesDetailViewInput: AnyObject {

    func setUpInitialState()
    func setRecipe(_ recipe: Recipe)
    func moduleInput() -> RecipesDetailModuleInput
}
