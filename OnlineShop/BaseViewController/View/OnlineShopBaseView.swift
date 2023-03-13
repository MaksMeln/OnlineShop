//
//  OnlineShopBaseView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

class OnlineShopBaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension OnlineShopBaseView {
    func setupViews() {}
    func constraintViews() {}
    
    func configureAppearance() {}
}
