//
//  UIColour+Extension.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

extension UIColor{
    public convenience init(r:CGFloat, g:CGFloat, b:CGFloat){
        self.init(red:r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var greenBorderColor: UIColor = {
        return UIColor(r: 80, g: 227, b: 194)
    }()
    
    static var redBorderColour: UIColor = {
        return UIColor(r: 255, g: 151, b: 164)
    }()
}
