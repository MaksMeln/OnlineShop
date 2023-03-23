//
//  NavBarController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    private func configureAppearance() {
        view.backgroundColor = Resources.Colors.Background.backgroundColor
        navigationBar.isTranslucent = false
//        navigationController?.navigationBar.isHidden = true
    }
}
