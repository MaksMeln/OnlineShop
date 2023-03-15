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
        
        
        //BackgroundColor
        static let backgroundColor = UIColor(hexString: "#FAF9FF")
        static let backgroundButton = UIColor(hexString: "#4E55D7")
        static let borderColorProfileImage = UIColor(hexString: "#C0C0C0")
        
        //LOGIN
        static let authorizationBackgoundTextField = UIColor(hexString: "#E8E8E8")
        static let authorizationTitleLabel = UIColor(hexString: "#161826")
        
        // OtherColor
        static let nameLabel = UIColor(hexString: "#3F3F3F")
        
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
            static let uploadItemButton = "Upload Item"
            
            enum ProfileButton {
                static let tradeStore = "Trade store"
                static let paymentMethod = "Payment method"
                static let balance = "Balance"
                static let tradeHistory = "Trade history"
                static let restorePurchase = "Restore purchase"
                static let help = "Help"
                static let logOut = "Log out"
                static let balanceData = "$ 1593"
                static let cell = "cell"
            }
        }
        
        enum Authorization {
            static let signIn = "Sign in"
            static let firstName = "First name"
            static let lastName = "Last name"
            static let email = "Email"
            static let subtitleLogIn = "Already have an account?"
            static let logIn = "Log in"
            static let google = "Sign in with Google"
            static let apple = "Sign in with Apple"
            
            static let welcomeBack = "Welcome Back"
            static let password = "Password"
        }
        
        enum HomeController {
            enum NavBar {
                static let firstTitle = "Trade by"
                static let secondTitle = "bata"
                static let location = "Location"
            }
            enum CategoryItem {
                static let phones = "Phones"
                static let headPhones = "Headphones"
                static let games = "Games"
                static let cars = "Cars"
                static let furniture = "Furniture"
                static let kids = "Kids"
            }
            
            static let latest = "Latest"
            static let flashSale = "Flash Sale"
            static let brands = "Brands"
            static let viewAll = "View all"
            static let searchBar = "What are you looking for?"
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
        
        enum Autorization {
            static let googleIcon = UIImage(named: "googleIcon")
            static let appleIcon = UIImage(named: "appleIcon")
            static let passwordIcon = UIImage(named: "passwordIcon")
        }

        enum HomeController {
            enum CategoryIcon {
                static let carsIcon = UIImage(named: "carsIcon")
                static let gamesIcon = UIImage(named: "gamesIcon")
                static let furnitureIcon = UIImage(named: "furnitureIcon")
                static let headPhonesIcon = UIImage(named: "headPhonesIcon")
                static let kidsIcon = UIImage(named: "kidsIcon")
                static let phoneIcon = UIImage(named: "phoneIcon")
            }
            
            static let likeIcon = UIImage(named: "likeIcon")
            static let addIcon = UIImage(named: "addIcon")
            static let locationVector = UIImage(named: "locationVector")
            static let navBarButton = UIImage(named: "navBarButton")
            static let searchIcon = UIImage(named: "searchIcon")
            static let latestImage = UIImage(named: "latestImage")
            static let profileImageHome = UIImage(named: "profileImageHome")
            
            
        }
        
        enum ProfileController {
            static let tableIcon = UIImage(named: "tableIcon")
            static let help = UIImage(named: "help")
            static let logOut = UIImage(named: "logOut")
            static let restorePurchase = UIImage(named: "restorePurchase")
            static let uploadItem = UIImage(named: "uploadItem")
            static let vector = UIImage(named: "vector")
            static let profileImage = UIImage(named: "profileImage")
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
