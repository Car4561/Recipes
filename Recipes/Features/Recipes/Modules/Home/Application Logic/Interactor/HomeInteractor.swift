//
//  HomeInteractor.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Foundation
import Combine

class HomeInteractor: HomeInteractorInput {

    weak var output: HomeInteractorOutput!
    lazy var networkingService: NetworkingService = NetworkingService()
    lazy var recipesClient: RecipesClientProvider = RecipesClient(configuration: NetworkingService().configuration)
    var cancellables: Set<AnyCancellable> = []

    func getRecipesList() {
        recipesClient.recipesList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError):
                    switch networkingError {
                    case .apiError:
                        self?.output.didFailFetchingRecipesList()
                    case .notConnectionInternet:
                        self?.output.didFailFetchingRecipesList()
                    case .unexpectedError:
                        self?.output.didFailFetchingRecipesList()
                    default:
                        self?.output.didFailFetchingRecipesList()
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.output.didFetchRecipesList(response.recipes)
            }).store(in: &cancellables)
    }
    
}
