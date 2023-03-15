//
//  SignInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit


final class SignInViewController: OnlineShopBaseViewController {

//MARK: - PROPERTIES
    private let signInLabel = UILabel(text: Resources.String.Authorization.signIn,
                                      font: Resources.Fonts.MontserratSemiBold(with: 26),
                                      textColor: Resources.Colors.authorizationTitleLabel)
    
    private let signInTextFieldView = SignInTextFieldView()
    
    private let signInWithButtonView = SignInWithButtonView()
    
    private let signInLogInView = SignInLogInView()
    
    private let signInButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.signIn, for: .normal)
        return button
    }()
}

//MARK: - LIFECYCLE
extension SignInViewController {
    
   override func setupViews() {
    super.setupViews()
       
       view.setupView(signInLabel)
       view.setupView(signInButton)
       view.setupView(signInTextFieldView)
       view.setupView(signInLogInView)
       view.setupView(signInWithButtonView)
    }
    
    override func constraintViews() {
        super.constraintViews()
                
        NSLayoutConstraint.activate([
            
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInTextFieldView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 78),
            signInTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.topAnchor.constraint(equalTo: signInTextFieldView.bottomAnchor, constant: 35),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInLogInView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 17),
            signInLogInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            
            signInWithButtonView.topAnchor.constraint(equalTo: signInLogInView.bottomAnchor, constant: 74),
            signInWithButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
    }
}
