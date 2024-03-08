//
//  Ingredient.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import RecipesUI

struct Ingredient: Decodable, YPLabelItem {

    let name: String
    let quantity: String
    let unit: String
    
    var titleLabel: String {
        "\(quantity) \(unit) \(name)"
    }
}
