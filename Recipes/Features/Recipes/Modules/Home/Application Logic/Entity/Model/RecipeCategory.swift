//
//  RecipeCategory.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import RecipesUI

enum RecipeCategory: Int, Decodable, YPTabItem {

    case salads = 1
    case fish
    case soups
    case entrees
    case mainCourses
    case desserts
    
    var title: String {
        switch self {
        case .salads:
            return RecipesStrings.Home.salads
        case .fish:
            return RecipesStrings.Home.fish
        case .soups:
            return RecipesStrings.Home.soups
        case .entrees:
            return RecipesStrings.Home.entrees
        case .mainCourses:
            return RecipesStrings.Home.mainCourses
        case .desserts:
            return RecipesStrings.Home.desserts
        }
    }
    
}
