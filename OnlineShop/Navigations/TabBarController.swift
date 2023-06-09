//
//  TabBarController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//
import UIKit

/*
 Add circle image on selected item
 */

enum Tabs : Int , CaseIterable{
    case page1
    case chosenByLike
    case storage
    case message
    case profile
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureTabBar()
        switchTo(tab: .page1)
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab : Tabs) {
        selectedIndex = tab.rawValue
    }
    
    
    
//MARK: - CONFIGURETABBAR
    private func configureTabBar() {
        
    
        tabBar.tintColor = Resources.Colors.TabBar.activeTabBar
        tabBar.barTintColor = Resources.Colors.TabBar.inactiveTabBar
        tabBar.backgroundColor = Resources.Colors.Background.tabBarBackgound
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        tabBar.itemPositioning = .centered
        
        if #available(iOS 15.0, *) {
               let appearance = UITabBarAppearance()
               appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Resources.Colors.Background.tabBarBackgound
               UITabBar.appearance().standardAppearance = appearance
               UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
           }
       
        let controllers : [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: nil ,
                                                 image: Resources.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
        
    
    private func getController(for tab: Tabs) -> OnlineShopBaseViewController {
        switch tab {
        case .page1:  return Page1ViewController()
        case .chosenByLike: return ChosenByLikeController()
        case .storage: return StorageViewController()
        case .message:  return MessageViewController()
        case .profile: return ProfileViewController()
            
        }
    }
}
