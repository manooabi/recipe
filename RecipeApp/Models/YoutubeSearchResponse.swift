//
//  YoutubeSearchResponse.swift
//  RecipeApp
//
//  Created by Manoo on 1/5/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import Foundation




struct YoutubesearchResponse: Codable{
    let items: [VideoElement]
}

struct VideoElement: Codable{
    let id: IdVideoElement
}
struct IdVideoElement: Codable{
    let kind: String
    let videoId:String
}
