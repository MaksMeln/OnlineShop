//
//  Resources.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

enum Resources {
//MARK: - COLORS
    enum Colors {
        enum Background{
            static let backgroundColor = UIColor(hexString: "#FAF9FF")
            static let backgroundButton = UIColor(hexString: "#4E55D7")
            static let searchBarTextFieldBackground = UIColor(hexString: "#F5F6F7")
            static let categoryNameBackground = UIColor(hexString: "#C4C4C4")
            static let diskountBackground = UIColor(hexString: "#F93A3A")
            static let tabBarBackgound = UIColor(hexString: "#FFFFFF")
            static let quantityBackground = UIColor(hexString: "#181726")
            static let likeAndShareBackground = UIColor(hexString: "#E5E9EF")
        }
        
        enum Default {
            static let defaultWhite = UIColor(hexString: "#EAEAEA")
            static let defaultBlack = UIColor(hexString: "#000000")
            static let defaultGray = UIColor(hexString: "#808080")
            static let defaultBlue = UIColor(hexString: "#254FE6")
        }
        
        enum TabBar {
            static let activeTabBar = UIColor(hexString: "#737297")
            static let inactiveTabBar = UIColor(hexString: "#909090")
        }
        
        enum Authorization {
            static let authorizationBackgoundTextField = UIColor(hexString: "#E8E8E8")
            static let authorizationTitleLabel = UIColor(hexString: "#161826")
        }
        
        enum OtherColors {
            static let nameLabel = UIColor(hexString: "#3F3F3F")
            static let cateoryTitle = UIColor(hexString: "#A6A7AB")
            static let borderColorProfileImage = UIColor(hexString: "#C0C0C0")
            static let borderColorPage1Image = UIColor(hexString: "#4E4D4D")
            static let colorLabel = UIColor(hexString: "#737373")
            static let borderCollectionProducr = UIColor(hexString: "#EBEBEB")
        }
    }

//MARK: - STRING
    enum String {
        static let cell = "cell"

//ProfileController
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
            }
        }
        
//Authorization
        enum Authorization {
            
            enum TextField {
                static let firstName = "First name"
                static let lastName = "Last name"
                static let email = "Email"
                static let password = "Password"
            }
            
            enum Title {
                static let signIn = "Sign in"
                static let welcomeBack = "Welcome Back"
            }
            
            enum ButtonHelpers {
                static let google = "Sign in with Google"
                static let apple = "Sign in with Apple"
            }
            
            enum Login {
                static let subtitleLogin = "Already have an account?"
                static let login = "Login"
            }
            
            enum Error {
                static let userExists = "Пользователь с таким именем  уже существует"
                static let registrationSucces = "Регистрация успешно завершена!"
                static let registrationError = "Регистрация не завершена!"
                static let password = "Пароль введен неккоректно"
                static let email = "Email введен неккоректно "
                static let name = "Only A - Z characters, min 1 character"
                static let userNotExist = "Пользователь не найден"
            }
        }

//Page1Controller
        enum Page1Controller {
            enum NavBar {
                static let firstTitle = "Trade by"
                static let secondTitle = "bata"
                static let location = "Location"
            }
            enum CategoryTitle {
                static let phones = "Phones"
                static let headphones = "Headphones"
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
            static let discount = "% off"
        }
    }
    
//MARK: - IMAGES
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .page1 : return UIImage(named: "page1TabBar")
                case .chosenByLike : return UIImage(named: "chosenByLikeTabBar")
                case .storage : return UIImage(named: "storageTabBar")
                case .message : return UIImage(named: "messageTabBar")
                case .profile : return UIImage(named: "profileTabBar")
                }
            }
        }
//Autorization
        enum Autorization {
            static let googleIcon = UIImage(named: "googleIcon")
            static let appleIcon = UIImage(named: "appleIcon")
            static let passwordIcon = UIImage(named: "passwordIcon")
        }
//Page1Controller
        enum Page1Controller {
            enum CategoryIcon {
                static let phoneIcon = UIImage(named: "phoneIcon")!
                static let headphonesIcon = UIImage(named: "headphonesIcon")!
                static let gamesIcon = UIImage(named: "gamesIcon")!
                static let carsIcon = UIImage(named: "carsIcon")!
                static let furnitureIcon = UIImage(named: "furnitureIcon")!
                static let kidsIcon = UIImage(named: "kidsIcon")!
            }
            
            enum NavBar {
                static let navBarButton = UIImage(named: "navBarButton")
                static let locationVector = UIImage(named: "locationVector")
                static let searchIcon = UIImage(named: "searchIcon")
            }
            
            enum ButtonCollection {
                static let likeButton = UIImage(named: "likeIcon")
                static let addLatestBtn = UIImage(named: "addIcon")
                static let addFlashSaleBtn = UIImage(named: "addIconFlashSale")
            }
            
            static let flashSaleUserIcon = UIImage(named: "flashSaleUserIcon")
            static let brandImage = UIImage(named: "brandImage")
        }
        
//Page2Controller
        enum Page2Controller {
            static let likePage2Icon = UIImage(named: "likePage2Icon")
            static let minusIcon = UIImage(named: "minusIcon")
            static let page2Image = UIImage(named: "page2Image")
            static let plusIcon = UIImage(named: "plusIcon")
            static let shareIcon = UIImage(named: "shareIcon")
            static let starIcon = UIImage(named: "starIcon")
            static let line = UIImage(named: "line")
            static let backButton = UIImage(named: "backButton")
        }
        
//ProfileController
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
    
    enum CategoryCollection {
        static let phones = CategoryList(categoryIcon: Resources.Images.Page1Controller.CategoryIcon.phoneIcon,
                                         categoryTitle: Resources.String.Page1Controller.CategoryTitle.phones)
        
        static let headphones = CategoryList(categoryIcon: Resources.Images.Page1Controller.CategoryIcon.headphonesIcon,
                                             categoryTitle: Resources.String.Page1Controller.CategoryTitle.headphones)
        
        static let games = CategoryList(categoryIcon: Resources.Images.Page1Controller.CategoryIcon.gamesIcon,
                                        categoryTitle: Resources.String.Page1Controller.CategoryTitle.games)
        
        static let cars = CategoryList(categoryIcon: Resources.Images.Page1Controller.CategoryIcon.carsIcon,
                                       categoryTitle: Resources.String.Page1Controller.CategoryTitle.cars)
        
        static let furniture = CategoryList(categoryIcon: Resources.Images.Page1Controller.CategoryIcon.furnitureIcon,
                                            categoryTitle: Resources.String.Page1Controller.CategoryTitle.furniture)
        
        static let kids = CategoryList(categoryIcon: Resources.Images.Page1Controller.CategoryIcon.kidsIcon,
                                       categoryTitle: Resources.String.Page1Controller.CategoryTitle.kids)
        
        static let collectionArray = [phones, headphones, games, cars, furniture, kids, phones, headphones, games, cars, furniture, kids]
        
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
