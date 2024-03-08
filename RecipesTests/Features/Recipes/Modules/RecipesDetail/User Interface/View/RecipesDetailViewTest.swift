//
//  RecipesDetailViewTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 15/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class RecipesDetailViewTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A RecipesDetail View") {
        }
    }


    // MARK: Mock Classes

    private class MockOutput: RecipesDetailViewOutput {

        var didTapMapButtonCount = 0
        var viewIsReadyCount = 0

        func didTapMapButton() {
            didTapMapButtonCount += 1
        }
        
        func viewIsReady() {
            viewIsReadyCount += 1
        }
    }
}
