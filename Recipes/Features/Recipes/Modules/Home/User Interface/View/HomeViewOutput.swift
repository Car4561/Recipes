//
//  HomeViewOutput.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import RecipesUI

protocol HomeViewOutput {
    
    var recipesCount: Int { get }

    func viewIsReady()
    func getRecipe(at index: Int) -> Recipe
    func didSelectedTabControlItem(_ item: YPTabItem)
    func didTapSearchBarSearchButton(with textFilter: String)
    func didTapSearchBarCancelButton()
    func didSelectRecipe(at index: Int)
}
