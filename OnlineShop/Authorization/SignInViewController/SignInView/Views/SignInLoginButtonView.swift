//
//  SignInLoginButtonView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class SignInLoginButtonView : OnlineShopBaseView {
// MARK: - PROPERTIES
    private let subtitleLabelLogin = OSLabel(textLabel: Resources.String.Authorization.subtitleLogIn,
                                             font: Resources.Fonts.MontserratMedium(with: 10),
                                             textColor: Resources.Colors.Default.defaultGray)
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle(Resources.String.Authorization.logIn, for: .normal)
        button.setTitleColor(Resources.Colors.Default.defaultBlue, for: .normal)
        button.titleLabel?.font = Resources.Fonts.MontserratMedium(with: 10)
        return button
    }()
}

//MARK: - CONFIGURE
extension SignInLoginButtonView {
    
    override func constraintViews() {
        super.constraintViews()
        let stackViewLoginInfo = UIStackView(arrangedSubviews: [subtitleLabelLogin, loginButton])
        stackViewLoginInfo.axis = .horizontal
        stackViewLoginInfo.spacing = 9
        stackViewLoginInfo.heightAnchor.constraint(equalToConstant: 10).isActive = true
        self.setupView(stackViewLoginInfo)
        
        NSLayoutConstraint.activate([
            stackViewLoginInfo.topAnchor.constraint(equalTo: topAnchor),
            stackViewLoginInfo.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackViewLoginInfo.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewLoginInfo.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }

//MARK: - BUTTON TARGET
    func loginButtonAction(_ action: Selector, with target: Any?) {
        loginButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
