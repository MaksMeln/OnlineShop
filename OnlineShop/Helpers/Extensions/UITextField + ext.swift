//
//  UITextField + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

extension UITextField {
    convenience init(placecholder: String) {
        self.init()
        
        self.placeholder = placecholder
        self.backgroundColor = Resources.Colors.authorizationBackgoundTextField
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.widthAnchor.constraint(equalToConstant: 290).isActive = true
        self.layer.cornerRadius = 15
        self.textAlignment = .center
        self.font = Resources.Fonts.MontserratMedium(with: 11)
        
    }
}
