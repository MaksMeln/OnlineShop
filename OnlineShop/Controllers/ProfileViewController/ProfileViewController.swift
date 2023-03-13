//
//  ProfileViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

/*
 Как лучше сделать вью- через кнопки или через таблицу? - через кнопки проще
 */


final class ProfileViewController : OnlineShopBaseViewController {
    
    
    private let titleLabel = UILabel(text: Resources.String.ProfileController.title,
                                     font: Resources.Fonts.MontserratBold(with: 15),
                                     textColor: Resources.Colors.defaultBlack)
    
    private let profilePhoto : UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = Resources.Images.ProfileController.profileImage
        profileImage.layer.borderColor = Resources.Colors.backgroundProfileImage.cgColor
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
        return profileImage
    }()
    
    private let changePhotoLabel = UILabel(text: Resources.String.ProfileController.changePhotoLabel,
                                           font: Resources.Fonts.MontserratMedium(with: 8) ,
                                           textColor: Resources.Colors.defaultGray)
    
    private let nameProfileLabel = UILabel(text: Resources.String.ProfileController.nameProfile,
                                           font: Resources.Fonts.MontserratBold(with: 15),
                                           textColor: Resources.Colors.nameLabel)
    
    private let uploudItemButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .uploadItem)
        button.addTarget(self, action: #selector(uploudItemButtonPress), for: .touchUpInside)
        return button
    }()
    
    
    private let buttonView = ProfileButtonView()
    
    
//    private let tradeStoreButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.tradeStore,
//                       Resources.Images.ProfileController.tableIcon,
//                       Resources.Images.ProfileController.vector,
//                       nil)
//        button.addTarget(self, action: #selector(tradeStoreButtonPress), for: .touchUpInside)
//        return button
//    }()
//    
//    private let paymentMethodButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.paymentMethod,
//                       Resources.Images.ProfileController.tableIcon,
//                       Resources.Images.ProfileController.vector,
//                       nil)
//        button.addTarget(self, action: #selector(paymentMethodButtonPress), for: .touchUpInside)
//        return button
//    }()
//    
//    private let balanceButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.balance,
//                       Resources.Images.ProfileController.tableIcon,
//                       nil,
//                       Resources.String.ProfileController.ProfileButton.balanceData)
//        button.addTarget(self, action: #selector(balanceButtonPress), for: .touchUpInside)
//        return button
//    }()
//    
//    
//    private let tradeHistoryButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.tradeHistory,
//                       Resources.Images.ProfileController.tableIcon,
//                       Resources.Images.ProfileController.vector,
//                       nil)
//        button.addTarget(self, action: #selector(tradeHistoryButtonPress), for: .touchUpInside)
//        return button
//    }()
//    
//    private let restorePurchaseButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.restorePurchase,
//                       Resources.Images.ProfileController.restorePurchase,
//                       Resources.Images.ProfileController.vector,
//                       nil)
//        button.addTarget(self, action: #selector(restorePurchaseButtonPress), for: .touchUpInside)
//        return button
//    }()
//    
//    private let helpButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.help,
//                       Resources.Images.ProfileController.help,
//                       nil,
//                       nil)
//        button.addTarget(self, action: #selector(helpButtonPress), for: .touchUpInside)
//        return button
//    }()
//    
//    private let logOutButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .profileButton)
//        button.setInfo(Resources.String.ProfileController.ProfileButton.logOut,
//                       Resources.Images.ProfileController.logOut,
//                       nil,
//                       nil)
//        button.addTarget(self, action: #selector(logOutButtonPress), for: .touchUpInside)
//        return button
//    }()
}

extension ProfileViewController {
    
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(titleLabel)
        view.setupView(profilePhoto)
        view.setupView(changePhotoLabel)
        view.setupView(nameProfileLabel)
        view.setupView(uploudItemButton)
        view.setupView(buttonView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
//        let stackViewButton = UIStackView(arrangedSubviews: [tradeStoreButton, paymentMethodButton, balanceButton, tradeHistoryButton, restorePurchaseButton, helpButton, logOutButton])
//        stackViewButton.axis = .vertical
//        stackViewButton.spacing = 21
//        view.setupView(stackViewButton)
//        buttonView.setupView(stackViewButton)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor , constant: 65),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profilePhoto.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhoto.heightAnchor.constraint(equalToConstant: 60),
            profilePhoto.widthAnchor.constraint(equalToConstant: 60),
            
            changePhotoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 83),
            changePhotoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameProfileLabel.topAnchor.constraint(equalTo: changePhotoLabel.bottomAnchor, constant: 20),
            nameProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            uploudItemButton.topAnchor.constraint(equalTo: nameProfileLabel.bottomAnchor, constant: 38),
            uploudItemButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
//            tradeStoreButton.topAnchor.constraint(equalTo: uploudItemButton.bottomAnchor, constant: 14),
//            tradeStoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
//            stackViewButton.topAnchor.constraint(equalTo: tradeStoreButton.bottomAnchor, constant: 14),
//            stackViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            buttonView.topAnchor.constraint(equalTo: uploudItemButton.bottomAnchor, constant: 14),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
        ])
        
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @objc func uploudItemButtonPress() {
       let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    
//    @objc func tradeStoreButtonPress() {
//        print("tradeStoreButton press")
//    }
//    
//    @objc func paymentMethodButtonPress() {
//        print("paymentMethodButton press")
//    }
//    
//    @objc func balanceButtonPress() {
//        print("balanceButton press")
//    }
//    
//    @objc func tradeHistoryButtonPress() {
//        print("tradeHistoryButton press")
//    }
//    
//    @objc func restorePurchaseButtonPress() {
//        print("restorePurchaseButton press")
//    }
//    
//    @objc func helpButtonPress() {
//        print("helpButton press")
//    }
//    
//    @objc func logOutButtonPress() {
//        print("logOutButton press")
//    }
//    
   
    

}

