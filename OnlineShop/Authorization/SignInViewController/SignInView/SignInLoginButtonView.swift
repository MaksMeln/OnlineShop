//
//  SignInLoginButtonView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class SignInLoginButtonView : OnlineShopBaseView {
// MARK: - PROPERTIES
    private let subtitleLabelLogin = OSLabel(textLabel: Resources.String.Authorization.Login.subtitleLogin,
                                             font: Resources.Fonts.MontserratMedium(with: 10),
                                             textColor: Resources.Colors.Default.defaultGray)
    
    private let loginButton = OSButton(with: .login)
}

//MARK: - CONFIGURE
extension SignInLoginButtonView {
    
    override func constraintViews() {
        super.constraintViews()
        
        let stackView = UIStackView(arrangedSubviews: [subtitleLabelLogin, loginButton])
        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        self.setupView(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }

//MARK: - BUTTON TARGET
    func loginButtonAction(_ action: Selector, with target: Any?) {
        loginButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
