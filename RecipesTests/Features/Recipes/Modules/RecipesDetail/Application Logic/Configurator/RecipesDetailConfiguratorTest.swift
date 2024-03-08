//
//  RecipesDetailConfiguratorTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class RecipesDetailModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: RecipesDetailViewControllerMock!

        beforeEach {
            viewController = RecipesDetailViewControllerMock()

            RecipesDetailModuleConfigurator.configure(viewController: viewController)
        }

        afterEach {
            viewController = nil
        }

        describe("A RecipesDetailModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(RecipesDetailPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? RecipesDetailPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(RecipesDetailViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(RecipesDetailRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(RecipesDetailInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? RecipesDetailPresenter
                let interactor = presenter?.interactor as? RecipesDetailInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(RecipesDetailPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class RecipesDetailViewControllerMock: RecipesDetailViewController {
    }
}
