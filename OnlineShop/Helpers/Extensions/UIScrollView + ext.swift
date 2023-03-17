//
//  UIScrollView + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit
extension UIScrollView {
    convenience init(frame: CGRect, contentSize: CGSize){
    self.init()
    
        self.backgroundColor = Resources.Colors.backgroundColor
    self.frame = frame
    self.showsVerticalScrollIndicator = false
    self.contentSize = contentSize
    }
}
