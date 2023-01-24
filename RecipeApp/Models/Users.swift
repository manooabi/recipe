//
//  Users.swift
//  RecipeApp
//
//  Created by Manoo on 1/23/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import Foundation

struct Users:Encodable {
   let userId: Int
    let userName: String?
    let email: String?
    let password: String?
    
}
