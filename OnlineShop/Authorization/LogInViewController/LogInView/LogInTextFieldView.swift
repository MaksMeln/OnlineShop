//
//  LogInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class LoginTextFieldView : OnlineShopBaseView {
//MARK: - PROPERTIES
    
    let firstNameTextField = OSTextField(with: .authorization,
                                         placecholder: Resources.String.Authorization.TextField.firstName)
    
    let passwordTextField : OSTextField = {
        let password =  OSTextField(with: .authorization,
                                    placecholder: Resources.String.Authorization.TextField.password)
        password.setIcon(Resources.Images.Autorization.passwordIcon)
        return password
    }()
}

//MARK: - CONSTRAINVIEWS
extension LoginTextFieldView {
   
    override func constraintViews() {
        super.constraintViews()
        
        let stackView = UIStackView(arrangedSubviews: [firstNameTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 35
        self.setupView(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
//MARK: - FUNC toggleShowHideAction
    func toggleShowHideAction(_ action: Selector, with target: Any?) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        passwordTextField.iconView.isUserInteractionEnabled = true
        passwordTextField.iconView.addGestureRecognizer(tapGestureRecognizer)
    }
}
