//
//  HomeInteractorTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import XCTest
import Nimble
import Quick

@testable import Recipes

final class HomeInteractorTest: QuickSpec {

    override func spec() {
        var interactor: HomeInteractor!
        var presenter: MockPresenter!
        var recipesClient: RecipesMockClient!
        
        beforeEach {
            interactor = HomeInteractor()
            presenter = MockPresenter()
            recipesClient = RecipesMockClient()
            interactor.output = presenter
            interactor.recipesClient = recipesClient
        }

        afterEach {
            interactor = nil
            recipesClient = nil
            presenter = nil
        }

        #if arch(x86_64)
        describe("A Home Interactor") {

            it("should succeed on listing recipes") {
                let expectation = QuickSpec.current.expectation(description: "list recipes")
                
                presenter.expectation = expectation
                recipesClient.kindOfTest = .success
                interactor.getRecipesList()
                QuickSpec.current.waitForExpectations(timeout: 3, handler: { _ in
                    expect(presenter.didFetchRecipesListCount).to(equal(1))
                    expect(presenter.recipes).toNot(beNil())
                })
            }
            
            it("should fail on listing recipes") {
                let expectation = QuickSpec.current.expectation(description: "fail to list recipes")
                
                presenter.expectation = expectation
                recipesClient.kindOfTest = .failure
                
                interactor.getRecipesList()

                QuickSpec.current.waitForExpectations(timeout: 3, handler: { _ in
                    expect(presenter.didFailFetchingRecipesListCount).to(equal(1))
                })
            }
        }
        #endif
    }


    // MARK: Mock Classes

    private class MockPresenter: HomeInteractorOutput {
        
        
        var didFetchRecipesListCount = 0
        var didFailFetchingRecipesListCount = 0
        
        var expectation: XCTestExpectation?

        var recipes: [Recipe]?
        
        func didFetchRecipesList(_ recipes: [Recipe]) {
            didFetchRecipesListCount += 1
            self.recipes = recipes
            expectation?.fulfill()
        }
        
        func didFailFetchingRecipesList() {
            didFailFetchingRecipesListCount += 1
            expectation?.fulfill()
        }
    }
}
