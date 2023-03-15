//
//  HomeViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

class HomeViewController : OnlineShopBaseViewController {
    
    
    private let navBar = HomeNavBarView()
    
}


extension HomeViewController {
    
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(navBar)
    }
    
    override func constraintViews() {
        super.constraintViews()
       
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

           ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        navigationController?.navigationBar.isHidden = true
    }
}
