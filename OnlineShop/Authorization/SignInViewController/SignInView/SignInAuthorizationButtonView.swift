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
          let button = OSButton(with: .signInWithHelpersButton)
        button.setInfo(Resources.String.Authorization.ButtonHelpers.google,
                         Resources.Images.Autorization.googleIcon,
                         nil,
                         nil)
          return button
      }()
  
      private let signInWithAppleButton : OSButton = {
          let button = OSButton(with: .signInWithHelpersButton)
          button.setInfo(Resources.String.Authorization.ButtonHelpers.apple,
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
        
        let stackView = UIStackView(arrangedSubviews: [signInWithGoogleButton , signInWithAppleButton])
        stackView.axis = .vertical
        stackView.spacing = 38
        self.setupView(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
