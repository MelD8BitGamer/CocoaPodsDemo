//
//  Cocktail.swift
//  CocoaPodsDemo
//
//  Created by Melinda Diaz on 2/27/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation


struct DrinksWrapper: Codable {
    let drinks: [Cocktail]
}
struct Cocktail: Codable {
    let strDrink: String //cocktail name
    let strDrinkThumb: String //cocktail image
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
}

extension Cocktail {
    //compact map gives you results WITHOUT non NIL Values
    var ingredients: String {
        let results = [ strIngredient1, strIngredient2, strIngredient3,strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9,strIngredient10, strIngredient11, strIngredient12,strIngredient13, strIngredient14,strIngredient15].compactMap { $0 }
        return results.joined(separator: ",")
    }
}
