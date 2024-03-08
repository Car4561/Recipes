//
//  HomeInteractorOutput.swift
//  Recipes
//
//  Created by Carlos Llerena on 14/05/2023.
//  Copyright © 2023 Carlos Llerena. All rights reserved.
//

protocol HomeInteractorOutput: AnyObject {
    
    func didFetchRecipesList(_ recipes: [Recipe])
    func didFailFetchingRecipesList()
}
