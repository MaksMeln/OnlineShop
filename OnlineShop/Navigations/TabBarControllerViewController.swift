//
//  TabBarControllerViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit


enum Tabs : Int , CaseIterable{
    case home
    case chosenByLike
    case storage
    case message
    case profile
}

class TabBarControllerViewController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
        switchTo(tab: .profile)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab : Tabs) {
        selectedIndex = tab.rawValue
    }
    
    
    private func configureTabBar() {
        tabBar.tintColor = 
        
        
    }
    
}
