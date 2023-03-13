//
//  UILabel + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? , textColor: UIColor? ){
    self.init()
    
    self.text = text
    self.textColor = textColor
    self.font = font
    
    }
}
