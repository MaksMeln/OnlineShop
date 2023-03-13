//
//  Resources.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

enum Resources {
    
    enum Colors {
        
        //DefaltColor
        static let defaultWhite = UIColor(hexString: "#EAEAEA")
        static let defaultBlack = UIColor(hexString: "#000000")
        static let defaultGray = UIColor(hexString: "#808080")
        static let defaultBlue = UIColor(hexString: "#254FE6")
        
        static let backgroundColor = UIColor(hexString: "#FAF9FF")
        
        //LOGIN
        static let backgroundRegistration = UIColor(hexString: "#E8E8E8")
        static let TitleLabel = UIColor(hexString: "#161826")
        
        // OtherColor
        static let nameLabel = UIColor(hexString: "#3F3F3F")
        static let circleBackground = UIColor(hexString: "#EEEFF4")
        static let backgroundButton = UIColor(hexString: "#4E55D7")
        
        //TabBar
        static let activeTabBar = UIColor(hexString: "#737297")
        static let inactiveTabBar = UIColor(hexString: "#909090")
        static let backgoundTabBar = UIColor(hexString: "#FFFFFF")
    }
    
    enum String {
        
        enum ProfileController {
            static let title = "Profile"
            static let changePhotoLabel = "Change photo"
            static let nameProfile = "Satria Adhi Pradana"
            static let buttonText = "Upload Item"
            
            enum Table {
                static let tradeStore = "Trade store"
                static let paymentMethod = "Payment method"
                static let balance = "Balance"
                static let tradeHistory = "Trade history"
                static let restorePurchase = "Restore purchase"
            }
            static let help = "Help"
            static let logOut = "Log out"
        }
        
    }
    
    
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .home : return UIImage(named: "homeTabBar")
                case .chosenByLike : return UIImage(named: "chosenByLikeTabBar")
                case .storage : return UIImage(named: "storageTabBar")
                case .message : return UIImage(named: "messageTabBar")
                case .profile : return UIImage(named: "profileTabBar")
                }
            }
        }
        
        enum ProfileController {
            static let tableIcon = UIImage(named: "tableIcon")
            static let help = UIImage(named: "help")
            static let logOut = UIImage(named: "logOut")
            static let restorePurchase = UIImage(named: "restorePurchase")
            static let uploadItem = UIImage(named: "uploadItem")
            static let vector = UIImage(named: "vector")
            static let profilePhoto = UIImage(named: "profilePhoto")
        }
        
    }
    
    
    
    
    enum Fonts {
        static func MontserratBold(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Bold", size: size) ?? UIFont()
        }
        static func MontserratMedium(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Medium", size: size) ?? UIFont()
        }
        static func MontserratRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-Regular", size: size) ?? UIFont()
        }
        static func MontserratSemiBold(with size: CGFloat) -> UIFont {
            UIFont(name: "Montserrat-SemiBold", size: size) ?? UIFont()
        }
    }
}
