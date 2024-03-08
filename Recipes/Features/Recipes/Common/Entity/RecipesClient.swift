//
//  RecipesClient.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import RecipesNetworking
import Combine

protocol RecipesClientProvider {
    func recipesList() -> AnyPublisher<RecipesResponse, NetworkingError>
}

final class RecipesClient: RestClient, RecipesClientProvider {

    func recipesList() -> AnyPublisher<RecipesResponse, NetworkingError> {
        request(
            resource: RecipesResource.recipes,
            type: RecipesResponse.self,
            errorType: ErrorResponse.self
        )
    }
}
