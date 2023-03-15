//
//  SignInLogInView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class SignInLogInView : OnlineShopBaseView {
    
    
    private let subtitleLabelLogIn = UILabel(text: Resources.String.Authorization.subtitleLogIn,
                                             font: Resources.Fonts.MontserratMedium(with: 10),
                                             textColor: Resources.Colors.defaultGray)
    
    private let logInButton : UIButton = {
        let button = UIButton()
        button.setTitle(Resources.String.Authorization.logIn, for: .normal)
        button.setTitleColor(Resources.Colors.defaultBlue, for: .normal)
        button.titleLabel?.font = Resources.Fonts.MontserratMedium(with: 10)
        return button
    }()
}


extension SignInLogInView {
    override func setupViews() {
        super.setupViews()
    }
    
    override func constraintViews() {
        super.constraintViews()
        let stackViewLoginInfo = UIStackView(arrangedSubviews: [subtitleLabelLogIn, logInButton])
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
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    
    func logInButtonAction(_ action: Selector, with target: Any?) {
        logInButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
