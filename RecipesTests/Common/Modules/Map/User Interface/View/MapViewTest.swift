//
//  MapViewTest.swift
//  Recipes
//
//  Created by Carlos Llerena on 16/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

import Nimble
import Quick

@testable import Recipes

final class MapViewTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A Map View") {
        }
    }


    // MARK: Mock Classes

    private class MockOutput: MapViewOutput {

        var viewIsReadyCount = 0

        func viewIsReady() {
            viewIsReadyCount += 1
        }
    }
}
