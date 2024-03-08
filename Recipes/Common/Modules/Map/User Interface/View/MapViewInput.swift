//
//  MapViewInput.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

protocol MapViewInput: AnyObject {

    func setUpInitialState()
    func setRecipe(recipe: Recipe)
    func moduleInput() -> MapModuleInput
}
