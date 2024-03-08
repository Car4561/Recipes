//
//  YPActivityIndicatorView.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import Lottie
import UIKit

public class YPActivityIndicatorView: UIView {
    
    // MARK: Propierties

    private var activityIndicatorView: LottieAnimationView = {
        let activityIndicatorView = LottieAnimationView(name: YPResources.Lottie.activityIndicator, bundle: Bundle.module)
        activityIndicatorView.setSize(with: .init(width: 400, height: 300))
        activityIndicatorView.loopMode = .loop
        activityIndicatorView.backgroundColor = .white
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()

    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    //MARK: Helpers

    private func setupViews() {
        backgroundColor = .white
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInParent()
        activityIndicatorView.play()
    }
    
}
