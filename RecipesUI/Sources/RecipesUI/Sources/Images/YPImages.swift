//
//  YPImages.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit

public enum YPImages {
    
    private enum Name {

        static let mapIcon = "mapIcon"
    }
    
    public static let mapIcon = UIImage.loadImage(named: Name.mapIcon)
}
