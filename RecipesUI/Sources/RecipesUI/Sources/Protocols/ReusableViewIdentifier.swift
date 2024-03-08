//
//  ReusableViewIdentifier.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import UIKit

protocol ReusableViewIdentifier: AnyObject {
    
    static var reuseIdentifier: String { get }
}

extension ReusableViewIdentifier where Self: UIView {
    
    static var reuseIdentifier: String { String(describing: self) }
}
