//
//  RecipesResource.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import RecipesNetworking

enum RecipesResource: Resource {

    case recipes

    var resource: (method: HTTPMethod, route: String) {
        switch self {
        case .recipes:
            return (.get, "/recipes")
        }
    }
}
