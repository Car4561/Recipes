//
//  HomeViewTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick
import UIKit

@testable import Recipes
@testable import RecipesUI

final class HomeViewTest: QuickSpec {

    override func spec() {
        
        var viewController: HomeViewController!
        var output: MockOutput!
        
        beforeEach {
            viewController = HomeViewController()
            viewController.loadView()
    
            output = MockOutput()
            viewController.output = output
        }

        afterEach {
            viewController = nil
            output = nil
        }

        describe("A Home View") {

            it("view ready") {
                viewController.viewDidLoad()
                
                expect(output.viewIsReadyCount).to(equal(1))
            }
            
            it("should tap item tab control") {
                let indexPath = IndexPath(row: 0, section: 0)
                
                viewController.tableView(viewController.tableView, didSelectRowAt: indexPath)

                expect(output.didSelectRecipeCount).toNot(beNil())
                expect(output.index).to(equal(indexPath.row))
            }
            
            it("should tap item tab control") {
                viewController.didSelect(item: RecipeCategory.mainCourses)
                
                expect(output.item).toNot(beNil())
                expect(output.didSelectedTabControlItemCount).to(equal(1))
            }
            
            it("should search bar filter when text field did change") {
                let text = "test_text"
                viewController.searchBar.text = text
                viewController.searchBarTextFieldDidChange(viewController.searchBar)
                
                expect(output.didTapSearchBarSearchButtonCount).to(equal(1))
                expect(output.textFilter).toNot(beNil())
                expect(output.textFilter).toNot(beEmpty())
                expect(output.textFilter).to(equal(text))
                
            }
            
            it("should tap search bar cancel button") {
                viewController.searchBarCancelButtonClicked(viewController.searchBar)
                
                expect(output.didTapSearchBarCancelButtonCount).to(equal(1))
            }
        }
    }


    // MARK: Mock Classes

    private class MockOutput: HomeViewOutput {
        
        var didTapSearchBarCancelButtonCount = 0
        var didSelectedTabControlItemCount = 0
        var didTapSearchBarSearchButtonCount = 0
        var didSelectRecipeCount = 0
    
        var recipesCount: Int {
            testRecipesCount
        }
    
        var item: YPTabItem?
        var testRecipesCount = 0
        var index = 0
        var textFilter: String?

        func getRecipe(at index: Int) -> Recipe {
            return Recipe(
                name: "test_name",
                image: "test_image",
                description: "test_description",
                steps: [],
                ingredients: [],
                location: .init(latitude: 0, longitude: 0),
                recipeCategory: .mainCourses
            )
        }
        
        func didSelectedTabControlItem(_ item: YPTabItem) {
            self.item = item
            didSelectedTabControlItemCount += 1
        }
        
        func didTapSearchBarSearchButton(with textFilter: String) {
            self.textFilter = textFilter
            didTapSearchBarSearchButtonCount += 1
        }
        
        func didTapSearchBarCancelButton() {
            didTapSearchBarCancelButtonCount += 1
        }
    
        func didSelectRecipe(at index: Int) {
            self.index = index
            didSelectRecipeCount += 1
        }

        var viewIsReadyCount = 0

        func viewIsReady() {
            viewIsReadyCount += 1
        }
    }
}
