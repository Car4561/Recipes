//
//  YPActivityIndicatorPresentable.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import UIKit

fileprivate var ypActivityIndicatorView: YPActivityIndicatorView!

public protocol YPActivityIndicatorPresentable {
    
    func showYPActivityIndicatorView()
    func hideYPActivityIndicatorView()
}

public extension YPActivityIndicatorPresentable where Self: UIViewController {
    
    func showYPActivityIndicatorView() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        let frame = UIScreen.main.bounds
        ypActivityIndicatorView = YPActivityIndicatorView(frame: frame)

        if let window = keyWindow {
            window.addSubview(ypActivityIndicatorView)
        } else {
            self.navigationController?.view.addSubview(ypActivityIndicatorView)
        }
    }
    
    func hideYPActivityIndicatorView() {
        ypActivityIndicatorView?.removeFromSuperview()
    }
}
