//
//  RecipesMockClient.swift
//  RecipesTests
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import Combine
import RecipesNetworking

@testable import Recipes

final class RecipesMockClient: RecipesClientProvider {
    
    var recipeList = 0
    
    var recipesMock = RecipesMock()
    var kindOfTest: KindOfTest = .success

    func recipesList() -> AnyPublisher<RecipesResponse, NetworkingError> {
        recipeList += 1
        recipesMock.kindOfTest = kindOfTest
        return Result { try recipesMock.makeList() }
            .mapError { _ in NetworkingError.invalidResponse }
            .publisher
            .eraseToAnyPublisher()
    }
}
