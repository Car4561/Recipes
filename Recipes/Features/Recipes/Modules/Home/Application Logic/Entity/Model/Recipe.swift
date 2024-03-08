//
//  Recipe.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

struct Recipe: Decodable {
    
    let name: String
    let image: String
    let description: String
    let steps: [Step]
    let ingredients: [Ingredient]
    let location: Location
    var recipeCategory: RecipeCategory
}
