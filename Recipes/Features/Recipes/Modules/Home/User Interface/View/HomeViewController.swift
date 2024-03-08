//
//  HomeViewController.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import UIKit
import RecipesUI

class HomeViewController: UIViewController, NavigationBarStyle {

    // MARK: Properties

    var output: HomeViewOutput!
    
    private var customView: CustomView {
        guard let view = view as? CustomView else {
            fatalError("Could not load Custom View")
        }
        return view
    }

    var tabControl: YPTabControl { customView.tabControl }
    var searchBar: YPSearchBar { customView.searchBar }
    var tableView: UITableView { customView.tableView }

    // MARK: Life cycle
    
    override func loadView() {
        view = CustomView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.ypSearchBarDelegate = self
        customView.tabControl.delegate = self
        primaryStyle()
        configureMainNavigation()
        output.viewIsReady()
    }
    
    func configureMainNavigation() {
        title = RecipesStrings.Home.title
    }
}


// MARK: HomeViewInput Methods

extension HomeViewController: HomeViewInput, YPActivityIndicatorPresentable {

    func setUpInitialState() {
    }

    func moduleInput() -> HomeModuleInput {
        return output as! HomeModuleInput
    }
    
    func reloadRecipes() {
        tableView.reloadData()
    }
}


// MARK: UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.recipesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RecipeTableViewCell
        let recipe = output.getRecipe(at: indexPath.row)
        cell.configure(with: recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRecipe(at: indexPath.row)
    }
}

// MARK: YPTabControlDelegate

extension HomeViewController: YPTabControlDelegate {

    func didSelect(item: YPTabItem) {
        output.didSelectedTabControlItem(item)
    }

}


// MARK: YPSearchBarDelegate

extension HomeViewController: YPSearchBarDelegate {
    
    func searchBarTextFieldDidChange(_ searchBar: YPSearchBar) {
        guard let searchText = searchBar.text?.lowercased() else { return }
        output.didTapSearchBarSearchButton(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: YPSearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: YPSearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: YPSearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        searchBar.text = nil
        output.didTapSearchBarCancelButton()
    }

}
