//
//  RestClient.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import Combine
import Foundation

public typealias JSON = [String: Any]

open class RestClient: NSObject{
    
    private let baseURL: String
    private let headers: HTTPHeaders
    
    public init(configuration: ClientConfiguration) {
        baseURL = configuration.baseURL
        headers = configuration.httpHeaders
    }
    
    public func request<T: Decodable, U :Decodable>(resource: Resource,
                                                    querys: [URLQueryItem] = [],
                                                    parameters: JSON? = nil,
                                                    type: T.Type,
                                                    errorType: U.Type) -> AnyPublisher<T, NetworkingError> {
        let fullURLString = baseURL + resource.resource.route
        guard let url = URL(string: fullURLString) else {
            return Fail(error: NetworkingError.invalidRequestError("Invalid URL: \(fullURLString)")).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = resource.resource.method.rawValue
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if resource.resource.method != .get,
           let parameters = parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError({ error -> NetworkingError in
                if error.code  == URLError.Code.notConnectedToInternet {
                    return .notConnectionInternet(error)
                }
                return .unexpectedError(error)
            })
            .tryMap({ (data, response) -> (data: Data, response: URLResponse) in
                guard let urlResponse = response as? HTTPURLResponse else {
                    throw NetworkingError.invalidResponse
                }
                
                switch urlResponse.statusCode {
                case 401:
                    throw NetworkingError.unauthorized
                case 400, 402...599:
                    let decoder = JSONDecoder()
                    let apiError = try decoder.decode(errorType, from: data)
                    
                    throw NetworkingError.apiError(error: apiError)
                default:
                    break
                }
                
                return (data, response)
            })
            .map(\.data)
            .tryMap({ data -> T in
                let decoder = JSONDecoder()
                
                do {
                    let decode = try decoder.decode(T.self, from: data)
                    return decode
                } catch {
                    let message = "Failed parsing object:  \(error)   \(String(describing: T.self))"
                    print(message)
                    throw NetworkingError.parsingError(error, message)
                }
            })
            .mapError({ error in
                guard let networkingError = error as? NetworkingError else { return .unexpectedError(error) }
                return networkingError
            })
            .eraseToAnyPublisher()
    }
    
}

extension RestClient: URLSessionDelegate {

    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            return completionHandler(URLSession.AuthChallengeDisposition.useCredential, nil)
        }
        return completionHandler(URLSession.AuthChallengeDisposition.useCredential, URLCredential(trust: serverTrust))
        
    }
}
