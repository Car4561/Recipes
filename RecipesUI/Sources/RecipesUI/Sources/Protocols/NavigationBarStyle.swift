//
//  NavigationBarStyle.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import UIKit

public protocol NavigationBarStyle {
    
    func primaryStyle()
    func clearStyle()
}

public extension NavigationBarStyle where Self: UIViewController {
    
    func clearStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.white

        navigationItem.backButtonTitle = ""
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func primaryStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = YPColors.tintedNavigationBar
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : YPColors.tintedNavigationBarItem
        ]
    
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = YPColors.tintedNavigationBarItem

        navigationItem.backButtonTitle = ""
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
