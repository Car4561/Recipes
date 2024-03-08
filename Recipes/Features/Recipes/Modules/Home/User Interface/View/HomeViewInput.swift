//
//  HomeViewInput.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

protocol HomeViewInput: AnyObject {

    func setUpInitialState()
    func reloadRecipes()
    func showYPActivityIndicatorView()
    func hideYPActivityIndicatorView()
    func moduleInput() -> HomeModuleInput
}
