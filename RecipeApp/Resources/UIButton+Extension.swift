//
//  UIButton+Extension.swift
//  RecipeApp
//
//  Created by Manoo on 1/12/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit


extension UIButton{
    public convenience init(title: String, borderColor: UIColor){
        self.init()
        let attrbutedstring = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
              self.setAttributedTitle(attrbutedstring, for: .normal)
              self.layer.cornerRadius = 5
              self.layer.borderWidth = 1
              self.layer.borderColor = borderColor.cgColor
              self.setAnchor(width: 0, height: 50)
    }
}
