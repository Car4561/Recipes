//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import Foundation

extension String {
    
    public func isValid(regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: self)
        
        return isValid
    }
}
