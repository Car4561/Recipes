//
//  Resource.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

public protocol Resource {
    
    var resource: (method: HTTPMethod, route: String) { get }
}
