//
//  UIView + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

extension UIView {
    
    @objc func setupView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
//    func setCenter(_ label: UILabel) {
//        translatesAutoresizingMaskIntoConstraints = false
//        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    }
    
    
}
