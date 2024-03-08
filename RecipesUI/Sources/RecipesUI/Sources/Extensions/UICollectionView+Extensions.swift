//
//  UICollectionView+Extensions.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import UIKit

extension UICollectionViewCell: ReusableViewIdentifier {}

extension UICollectionView {

    public func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
