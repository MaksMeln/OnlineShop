//
//  LogInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit


final class LogInViewController: OnlineShopBaseViewController {
    
//MARK: - PROPERTIES
    var iconClick = true
    
    private let logInLabel = UILabel(text: Resources.String.Authorization.welcomeBack,
                                     font: Resources.Fonts.MontserratSemiBold(with: 26),
                                     textColor: Resources.Colors.authorizationTitleLabel)
    
    private let logInTextFieldView = LogInTextFieldView()
    
    private let logInButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.logIn, for: .normal)
        return button
    }()
}

//MARK: - LIFECYCLE
extension LogInViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(logInLabel)
        view.setupView(logInTextFieldView)
        view.setupView(logInButton)
    }
        
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            logInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            logInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInTextFieldView.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 78),
            logInTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInButton.topAnchor.constraint(equalTo: logInTextFieldView.bottomAnchor, constant: 35),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        logInTextFieldView.toggleShowHideAction(#selector(imageTaapped(tapGestureRecognizer:)), with: self)
    }
    
//MARK: - @OBJC FUNC imageTaapped
    @objc func imageTaapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if iconClick {
            iconClick = false
            logInTextFieldView.passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            logInTextFieldView.passwordTextField.isSecureTextEntry = true
        }
    }
}

