//
//  LogInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class LogInTextFieldView : OnlineShopBaseView {
//MARK: - PROPERTIES
    
    let firstNameTextField = OSTextField(with: .authorization,
                                         placecholder: Resources.String.Authorization.firstName)
    
    let passwordTextField : OSTextField = {
        let password =  OSTextField(with: .authorization,
                                    placecholder: Resources.String.Authorization.password)
        password.setIcon(Resources.Images.Autorization.passwordIcon)
        return password
    }()
}

//MARK: - CONSTRAINVIEWS
extension LogInTextFieldView {
   
    override func constraintViews() {
        super.constraintViews()
        
        let stackViewTextField = UIStackView(arrangedSubviews: [firstNameTextField, passwordTextField])
        stackViewTextField.axis = .vertical
        stackViewTextField.spacing = 35
        self.setupView(stackViewTextField)
        
        NSLayoutConstraint.activate([
            stackViewTextField.topAnchor.constraint(equalTo: topAnchor),
            stackViewTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackViewTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
//MARK: - FUNC toggleShowHideAction
    func toggleShowHideAction(_ action: Selector, with target: Any?) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        passwordTextField.iconView.isUserInteractionEnabled = true
        passwordTextField.iconView.addGestureRecognizer(tapGestureRecognizer)
    }
}
