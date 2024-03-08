//
//  HomeView.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import UIKit
import RecipesUI

extension HomeViewController {
    
    final class CustomView: UIView {
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let tableView: UITableView = {
            let tableView = UITableView()
            tableView.register(RecipeTableViewCell.self)
            tableView.separatorStyle = .none
            tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
        
        let tabControl: YPTabControl = {
            let tabControl = YPTabControl()
            let tabItems: [YPTabItem] = [
                YPFilters.all,
                RecipeCategory.salads,
                RecipeCategory.fish,
                RecipeCategory.mainCourses,
                RecipeCategory.soups,
                RecipeCategory.entrees,
                RecipeCategory.desserts
            ]
            tabControl.configure(with: tabItems)
            tabControl.setHeight(with: 50)
            tabControl.translatesAutoresizingMaskIntoConstraints = false
            tabControl.backgroundColor = YPColors.viewBackground1
            return tabControl
        }()
        
        let searchBar: YPSearchBar = {
            let searchBar = YPSearchBar()
            searchBar.placeholder = CommonStrings.search
            searchBar.regex = RecipesRegex.searchBar
            searchBar.setHeight(with: 50)
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            return searchBar
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
            backgroundColor = YPColors.viewBackground1
            addSubview(stackView)
            stackView.pinToSafeAreaSuperview()
            stackView.addArrangedSubviews(
                searchBar,
                tabControl,
                tableView
            )
        }
    }
}
