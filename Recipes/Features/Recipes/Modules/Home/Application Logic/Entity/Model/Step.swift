//
//  Step.swift
//  Recipes
//
//  Created by Carlos Alfredo Llerena Huayta on 14/05/23.
//

import RecipesUI

struct Step: Decodable, YPStepItem {

    var number: Int
    var instructions: String
    let estimatedTime: Int
    
    var numberStep: String {
        String(number)
    }
    
    var instructionStep: String {
        instructions
    }
    
    
}
