//
//  YPFilters.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import RecipesUI

enum YPFilters: YPTabItem {

    case all
    
    var title: String {
        switch self {
        case .all:
            return CommonStrings.all
        }
    }
}
