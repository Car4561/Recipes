//
//  RecipesMock.swift
//  RecipesTests
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import Combine
import Foundation
import RecipesNetworking

@testable import Recipes

final class RecipesMock {
    
    var kindOfTest: KindOfTest = .success

    func makeRecipes() -> [Recipe] {
        let ingredient = Ingredient(name: "Tomato", quantity: "2", unit: "pieces")
        let step = Step(number: 1, instructions: "Wash and chop the tomatoes and cucumbers.", estimatedTime: 5)
        let location = Location(latitude: 40.7128, longitude: -74.0060)

        let recipe = Recipe(
            name: "test_text",
            image: "salad.jpg",
            description: "A refreshing salad with tomatoes and cucumbers.",
            steps: [step],
            ingredients: [ingredient],
            location: location,
            recipeCategory: .salads
        )
        return Array(repeating: recipe, count: 15)
    }

    func makeList() throws -> RecipesResponse {
       let resource = kindOfpathResource(kindPath: "list")
       let response = try obtainResponseObjectFromJsonFile(pathResource: resource, type: RecipesResponse.self)
       return response
    }
    
    private func kindOfpathResource(kindPath: String) -> String {
       switch kindOfTest {
       case .success:
           return "recipes_\(kindPath)_response_200"
       case .failure:
           return "recipes_\(kindPath)_response_400"
       }
    }
    
    private func obtainResponseObjectFromJsonFile<T: Decodable>(pathResource: String, type: T.Type) throws -> T {
        let bundle = Bundle(for: RecipesMock.self)
        guard let url = bundle.url(forResource: pathResource, withExtension: "json"),
              let jsonData = try? Data(contentsOf: url),
              let response = try? JSONDecoder().decode(T.self, from: jsonData) else {
            throw NetworkingError.invalidResponse
        }
        return response
    }
}
