//
//  ProfileButtonView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

final class ProfileButtonView: OnlineShopBaseView {
    
    //MARK: - PROPERTIES(BUTTON)
    let tradeStoreButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.tradeStore,
                       Resources.Images.ProfileController.tableIcon,
                       Resources.Images.ProfileController.vector,
                       nil)
        return button
    }()
    
    let paymentMethodButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.paymentMethod,
                       Resources.Images.ProfileController.tableIcon,
                       Resources.Images.ProfileController.vector,
                       nil)
        return button
    }()
    
    let balanceButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.balance,
                       Resources.Images.ProfileController.tableIcon,
                       nil,
                       Resources.String.ProfileController.ProfileButton.balanceData)
        return button
    }()
    
    let tradeHistoryButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.tradeHistory,
                       Resources.Images.ProfileController.tableIcon,
                       Resources.Images.ProfileController.vector,
                       nil)
        return button
    }()
    
    let restorePurchaseButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.restorePurchase,
                       Resources.Images.ProfileController.restorePurchase,
                       Resources.Images.ProfileController.vector,
                       nil)
        return button
    }()
    
    let helpButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.help,
                       Resources.Images.ProfileController.help,
                       nil,
                       nil)
        return button
    }()
    
    let logOutButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .profileButton)
        button.setInfo(Resources.String.ProfileController.ProfileButton.logOut,
                       Resources.Images.ProfileController.logOut,
                       nil,
                       nil)
        return button
    }()
    
    //MARK: - CONFIGURATION
    override func constraintViews() {
        super.constraintViews()
        
        let stackViewButton = UIStackView(arrangedSubviews: [tradeStoreButton,paymentMethodButton, balanceButton, tradeHistoryButton, restorePurchaseButton, helpButton, logOutButton])
        stackViewButton.axis = .vertical
        stackViewButton.spacing = 20
        self.setupView(stackViewButton)
        
        NSLayoutConstraint.activate([
            stackViewButton.topAnchor.constraint(equalTo: topAnchor),
            stackViewButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackViewButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewButton.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    //MARK: - FUNC profileButtonAction
    func profileButtonAction(button: OnlineShopButton, _ action: Selector, with target: Any?) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}
