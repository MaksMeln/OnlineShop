//
//  OnlineShopBaseViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

class OnlineShopBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearence()
    }
}

@objc extension OnlineShopBaseViewController {
    
    func setupViews() {}
    func constraintViews() {}
    func configureAppearence() {
        view.backgroundColor = Resources.Colors.backgroundColor
    }
}
