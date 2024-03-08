//
//  MapConfiguratorTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class MapModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: MapViewControllerMock!

        beforeEach {
            viewController = MapViewControllerMock()

            MapModuleConfigurator.configure(viewController: viewController)
        }

        afterEach {
            viewController = nil
        }

        describe("A MapModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(MapPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? MapPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(MapViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(MapRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(MapInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? MapPresenter
                let interactor = presenter?.interactor as? MapInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(MapPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class MapViewControllerMock: MapViewController {
    }
}
