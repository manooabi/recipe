//
//  Favourites.swift
//  RecipeApp
//
//  Created by Manoo on 1/26/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import Foundation

struct Favourites: Decodable{
    let userId:Int
    let foodId: Int
    let foodName: String?
    let categories: String?
    let type: String?
    let photo: String?
    let description: String?
    let indegredients: String?
    
}
