//
//  UIImage+Extensions.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit

extension UIImage {
    
    static func loadImage(named: String) -> UIImage {
        guard let image = UIImage(named: named, in: Bundle.module, compatibleWith: nil) else { abort() }
        return image
    }
}
