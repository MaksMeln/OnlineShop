//
//  SignInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class SignInTextFieldView : OnlineShopBaseView {

//MARK: - PROPERTIES
    let imageViewPassword : UIImageView = {
       let imageView  = UIImageView(frame: CGRect(x: -20, y: 0, width: 14, height: 14))
       imageView.image = Resources.Images.Autorization.passwordIcon
       return imageView
   }()
    
    let firstNameTextField = OSTextField(with: .authorization,
                                         placecholder:Resources.String.Authorization.firstName)
    
     let lastNameTextField = OSTextField(with: .authorization,
                                         placecholder:Resources.String.Authorization.lastName)
    
     let emailTextField = OSTextField(with: .authorization,
                                      placecholder:Resources.String.Authorization.email)
    
    let passwordTextField : OSTextField = {
        let password =  OSTextField(with: .authorization, placecholder: Resources.String.Authorization.password)
        password.setIcon(Resources.Images.Autorization.passwordIcon)
        return password
    }()
}

//MARK: - LIFECYCLE
extension SignInTextFieldView {
    override func setupViews() {
        super.setupViews()
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        let stackViewTextField = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField, emailTextField, passwordTextField])
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
        passwordTextField.addGestureRecognizer(tapGestureRecognizer)
    }
}
