//
//  ProfileButtonView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

class ProfileButtonView: OnlineShopBaseView {
  
     let tradeStoreButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.tradeStore,
                       Resources.Images.ProfileController.tableIcon,
                       Resources.Images.ProfileController.vector,
                       nil)
//        button.addTarget(self, action: #selector(tradeStoreButtonPress), for: .touchUpInside)
        return button
    }()
    
    private let paymentMethodButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.paymentMethod,
                       Resources.Images.ProfileController.tableIcon,
                       Resources.Images.ProfileController.vector,
                       nil)
        button.addTarget(self, action: #selector(paymentMethodButtonPress), for: .touchUpInside)
        return button
    }()
    
    private let balanceButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.balance,
                       Resources.Images.ProfileController.tableIcon,
                       nil,
                       Resources.String.ProfileController.ProfileButton.balanceData)
        button.addTarget(self, action: #selector(balanceButtonPress), for: .touchUpInside)
        return button
    }()
    
    
    private let tradeHistoryButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.tradeHistory,
                       Resources.Images.ProfileController.tableIcon,
                       Resources.Images.ProfileController.vector,
                       nil)
        button.addTarget(self, action: #selector(tradeHistoryButtonPress), for: .touchUpInside)
        return button
    }()
    
    private let restorePurchaseButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.restorePurchase,
                       Resources.Images.ProfileController.restorePurchase,
                       Resources.Images.ProfileController.vector,
                       nil)
        button.addTarget(self, action: #selector(restorePurchaseButtonPress), for: .touchUpInside)
        return button
    }()
    
    private let helpButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.help,
                       Resources.Images.ProfileController.help,
                       nil,
                       nil)
        button.addTarget(self, action: #selector(helpButtonPress), for: .touchUpInside)
        return button
    }()
    
    private let logOutButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.logOut,
                       Resources.Images.ProfileController.logOut,
                       nil,
                       nil)
        button.addTarget(self, action: #selector(logOutButtonPress), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
       
        
    }
    
    
    override func constraintViews() {
        let stackViewButton = UIStackView(arrangedSubviews: [tradeStoreButton,paymentMethodButton, balanceButton, tradeHistoryButton, restorePurchaseButton, helpButton, logOutButton])
        stackViewButton.axis = .vertical
        stackViewButton.spacing = 20
        self.setupView(stackViewButton)
        
    }
    
    override func configureAppearance() {
       
    }
    
    
    
    @objc func tradeStoreButtonPress() {
        print("tradeStoreButton press")
    }
    
    @objc func paymentMethodButtonPress() {
        print("paymentMethodButton press")
    }
    
    @objc func balanceButtonPress() {
        print("balanceButton press")
    }
    
    @objc func tradeHistoryButtonPress() {
        print("tradeHistoryButton press")
    }
    
    @objc func restorePurchaseButtonPress() {
        print("restorePurchaseButton press")
    }
    
    @objc func helpButtonPress() {
        print("helpButton press")
    }
    
    @objc func logOutButtonPress() {
        print("logOutButton press")
    }
    
    
}


