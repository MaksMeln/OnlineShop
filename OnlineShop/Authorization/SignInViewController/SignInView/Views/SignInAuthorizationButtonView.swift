//
//  SignInWithButtonView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class SignInAuthorizationButtonView : OnlineShopBaseView {
    
//MARK: - PROPERTISE
    private let signInWithGoogleButton : OSButton = {
          let button = OSButton(with: .signInButton)
          button.setInfo(Resources.String.Authorization.google,
                         Resources.Images.Autorization.googleIcon,
                         nil,
                         nil)
          return button
      }()
  
      private let signInWithAppleButton : OSButton = {
          let button = OSButton(with: .signInButton)
          button.setInfo(Resources.String.Authorization.apple,
                         Resources.Images.Autorization.appleIcon,
                         nil,
                         nil)
          return button
      }()
}

//MARK: - LIFECYCLE
extension SignInAuthorizationButtonView {
    
    override func constraintViews() {
        super.constraintViews()
        
        let stackViewSignInButton = UIStackView(arrangedSubviews: [signInWithGoogleButton , signInWithAppleButton])
        stackViewSignInButton.axis = .vertical
        stackViewSignInButton.spacing = 38
        self.setupView(stackViewSignInButton)
        
        NSLayoutConstraint.activate([
            stackViewSignInButton.topAnchor.constraint(equalTo: topAnchor),
            stackViewSignInButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackViewSignInButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewSignInButton.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
