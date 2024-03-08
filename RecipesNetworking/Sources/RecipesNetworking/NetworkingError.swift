//
//  NetworkingError.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

public enum NetworkingError: Error {
    
    case apiError(error: Decodable)
    case notConnectionInternet(Error)
    case invalidRequestError(String)
    case invalidResponse
    case parsingError(Error, String)
    case unauthorized
    case unexpectedError(Error)
}
