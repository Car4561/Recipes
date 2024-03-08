//
//  RecipesDetailView.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 16/05/23.
//

import UIKit
import RecipesUI

extension RecipesDetailViewController {
    
    final class CustomView: UIView {
        
        private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.bounces = true
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 13
            stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let recipeImage: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.setHeight(with: 400)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = YPFont.medium17
            label.text = RecipesStrings.Detail.ingredientes
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let ingredientsTitleLabel: UILabel = {
            let label = UILabel()
            label.font = YPFont.heavy24
            label.text = RecipesStrings.Detail.ingredientes
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let ingredientsList: YPList = {
            let ypList = YPList()
            ypList.translatesAutoresizingMaskIntoConstraints = false
            return ypList
        }()
        
        let stepsTitleLabel: UILabel = {
            let label = UILabel()
            label.font = YPFont.heavy24
            label.text = RecipesStrings.Detail.steps
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let stepsList: YPList = {
            let ypList = YPList()
            ypList.translatesAutoresizingMaskIntoConstraints = false
            return ypList
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            initializeView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            initializeView()
        }
        
        private func initializeView() {
            backgroundColor = YPColors.lightLabel
            addSubview(scrollView)
            scrollView.addSubview(stackView)
            scrollView.pinToSafeAreaSuperview()
            stackView.pinToSuperview()
            stackView.addArrangedSubviews(
                recipeImage,
                descriptionLabel,
                ingredientsTitleLabel,
                ingredientsList,
                stepsTitleLabel,
                stepsList
            )
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        }
        
        public func configure(recipe: Recipe) {
            recipeImage.load(url: recipe.image)
            descriptionLabel.text = recipe.description
            ingredientsList.configure(viewType: YPLabel.self, with: recipe.ingredients)
            stepsList.configure(viewType: YPStep.self, with: recipe.steps)
        }
    }
}
