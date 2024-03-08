//
//  RecipesDetailPresenterTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class RecipesDetailPresenterTest: QuickSpec {

    override func spec() {

        let recipe = Recipe(
            name: "test_name",
            image: "test_image",
            description: "test_description",
            steps: [],
            ingredients: [],
            location: .init(latitude: 0, longitude: 0),
            recipeCategory: .mainCourses
        )
        
        var presenter: RecipesDetailPresenter!
        var interactor: MockInteractor!
        var router: MockRouter!
        var view: MockView!
        
        beforeEach {
            presenter = RecipesDetailPresenter()
            interactor = MockInteractor()
            router = MockRouter()
            view = MockView()
            
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
        }

        afterEach {
            presenter = nil
            interactor = nil
            router = nil
            view = nil
        }

        describe("A RecipesDetail Presenter") {
    
            context("ModuleInput conformance") {
        
                it("Should initialize module with recipe object") {
                    presenter.initializeModule(recipe: recipe)
                    
                    expect(presenter.recipe).toNot(beNil())
                }
            }

            context("ViewOutput conformance") {
                
                it("Should set the recipe detail when view is ready") {
                    presenter.recipe = recipe
                    presenter.viewIsReady()
                    
                    expect(view.setRecipeCount).to(equal(1))
                    expect(view.recipe?.name).to(equal(recipe.name))
                }
                
                it("Should route to map module when map button tapped") {
                    presenter.recipe = recipe
                    presenter.didTapMapButton()
                    
                    expect(router.routeToMapCount).to(equal(1))
                    expect(router.recipe).toNot(beNil())
                }
            }
            
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: RecipesDetailInteractorInput {
    }

    private class MockRouter: RecipesDetailRouterInput {

        var routeToMapCount = 0
        
        var recipe: Recipe?
        
        func routeToMap(recipe: Recipe) {
            self.recipe = recipe
            routeToMapCount += 1
        }
    }

    private class MockView: RecipesDetailViewInput {
        
        var setRecipeCount = 0
        
        var recipe: Recipe?
        
        func setRecipe(_ recipe: Recipe) {
            self.recipe = recipe
            setRecipeCount += 1
        }

        func setUpInitialState() {
        }

        func moduleInput() -> RecipesDetailModuleInput {

            return RecipesDetailPresenter()
	    }
    }
}
