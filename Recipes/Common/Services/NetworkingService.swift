//
//  NetworkingService.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import Foundation
import RecipesNetworking

final class NetworkingService {
    
    // MARK: Properties

    var configuration: ClientConfiguration {
        return makeConfiguration()
    }
    
    // MARK: Private methods
    
    private func makeConfiguration() -> ClientConfiguration {
        let configuration = ClientConfiguration(baseURL: makeHost(),
                                                httpHeaders: makeHeaders())
        return configuration
    }

    private func makeHost() -> String {
       return Host.baseUrl
    }

    private func makeHeaders() -> [String: String] {
        ["Content-Type" : "application/json"]
    }
}
