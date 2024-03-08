//
//  HomePresenterTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick
import RecipesUI

@testable import Recipes

final class HomePresenterTest: QuickSpec {

    override func spec() {
        
        var presenter: HomePresenter!
        var interactor: MockInteractor!
        var router: MockRouter!
        var view: MockView!
        var recipesMock: RecipesMock!

        beforeEach {
            presenter = HomePresenter()
            interactor = MockInteractor()
            router = MockRouter()
            view = MockView()
            recipesMock = RecipesMock()

            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
        }

        afterEach {
            presenter = nil
            interactor = nil
            router = nil
            view = nil
            recipesMock = nil
        }

        describe("A Home Presenter") {
            
            context("ViewOutput conformance") {
                
                it("Should get recipes list") {
                    presenter.viewIsReady()
                    
                    expect(interactor.getRecipesListCount).to(equal(1))
                }
                
                it("Should route to recipe detail") {
                    let selectedIndex = 1

                    presenter.recipes = recipesMock.makeRecipes()
                    presenter.didSelectRecipe(at: selectedIndex)
                    
                    expect(router.recipe?.name).to(equal(presenter.recipes[selectedIndex].name))
                    expect(router.routeToDetailRecipeCount).to(equal(1))
                }
                
                it("Should show recipes by category") {
                    presenter.didSelectedTabControlItem(RecipeCategory.mainCourses)
                    
                    expect(view.reloadRecipesCount).to(equal(1))
                }
                
                it("Should filter recipes by search text") {
                    presenter.didTapSearchBarSearchButton(with: "test_text")
                    
                    expect(view.reloadRecipesCount).to(equal(1))
                }
                
                it("Should get recipes by category") {
                    presenter.didTapSearchBarSearchButton(with: "test_text")
                    
                    expect(view.reloadRecipesCount).to(equal(1))
                }
                
                it("Should get recipes with search bar text filter") {
                    presenter.didTapSearchBarSearchButton(with: "test_text")
                    
                    expect(view.reloadRecipesCount).to(equal(1))
                }
                
                it("should cancel recipes search bar filter") {
                    presenter.didTapSearchBarSearchButton(with: "test_text")
                    
                    expect(view.reloadRecipesCount).to(equal(1))
                }
            }
            
            context("InteractorOutput conformance") {
                
                it("Should set recipe list") {
                    let recipes = recipesMock.makeRecipes()
                    presenter.didFetchRecipesList(recipes)
                    
                    expect(view.hideYPActivityIndicatorViewCount).to(equal(1))
                    expect(view.reloadRecipesCount).to(equal(1))
                }
                
                it("Should set recipe list") {
                    let recipes = recipesMock.makeRecipes()
                    presenter.didFetchRecipesList(recipes)
                    
                    expect(view.hideYPActivityIndicatorViewCount).to(equal(1))
                    expect(view.reloadRecipesCount).to(equal(1))
                }
            }
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: HomeInteractorInput {

        var getRecipesListCount = 0
        
        func getRecipesList() {
            getRecipesListCount += 1
        }
    }

    private class MockRouter: HomeRouterInput {
        
        var routeToDetailRecipeCount = 0
        
        var recipe: Recipe?

        func routeToDetailRecipe(_ recipe: Recipe) {
            self.recipe = recipe
            routeToDetailRecipeCount += 1
        }
    }

    private class MockView: HomeViewInput {
    
        var reloadRecipesCount = 0
        var showYPActivityIndicatorViewCount = 0
        var hideYPActivityIndicatorViewCount = 0
        
        func showYPActivityIndicatorView() {
            showYPActivityIndicatorViewCount += 1
        }
        
        func hideYPActivityIndicatorView() {
            hideYPActivityIndicatorViewCount += 1
        }

        func reloadRecipes() {
            reloadRecipesCount += 1
        }

        func setUpInitialState() {
    
        }

        func moduleInput() -> HomeModuleInput {
            return HomePresenter()
	    }
    }
}
