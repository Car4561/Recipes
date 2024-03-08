//
//  MapPresenterTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class MapPresenterTest: QuickSpec {

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
        
        var presenter: MapPresenter!
        var interactor: MockInteractor!
        var router: MockRouter!
        var view: MockView!

        beforeEach {
            presenter = MapPresenter()
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

        describe("A Map Presenter") {
    
            context("ModuleInput conformance") {
        
                it("Should initialize module with recipe object") {
                    presenter.initializeModule(recipe: recipe)
                    
                    expect(presenter.recipe).toNot(beNil())
                }
            }
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: MapInteractorInput {
    }

    private class MockRouter: MapRouterInput {
    }

    private class MockView: MapViewInput {

        var setRecipeCount = 0
        
        var recipe: Recipe?
        
        func setRecipe(recipe: Recipe) {
            self.recipe = recipe
            setRecipeCount += 1
        }

        func setUpInitialState() {
        }

        func moduleInput() -> MapModuleInput {

            return MapPresenter()
	    }
    }
}
