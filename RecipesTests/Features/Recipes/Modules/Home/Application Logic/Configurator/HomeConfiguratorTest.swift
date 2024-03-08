//
//  HomeConfiguratorTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class HomeModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: HomeViewControllerMock!

        beforeEach {
            viewController = HomeViewControllerMock()

            HomeModuleConfigurator.configure(viewController: viewController)
        }

        afterEach {
            viewController = nil
        }

        describe("A HomeModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(HomePresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? HomePresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(HomeViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(HomeRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(HomeInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? HomePresenter
                let interactor = presenter?.interactor as? HomeInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(HomePresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class HomeViewControllerMock: HomeViewController {
    }
}
