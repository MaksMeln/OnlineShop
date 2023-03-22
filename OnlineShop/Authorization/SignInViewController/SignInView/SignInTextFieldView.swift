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
    
    var firstNameTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.firstName)
    
    var lastNameTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.lastName)
    
    var emailTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.email)
    
    var passwordTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.password)
}

//MARK: - LIFECYCLE
extension SignInTextFieldView {
    override func setupViews() {
        super.setupViews()
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        let stackView = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField, emailTextField, passwordTextField])
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
    
    override func configureAppearance() {
        super.configureAppearance()
        passwordTextField.rightViewMode = UITextField.ViewMode.always
        passwordTextField.rightView = imageViewPassword
        
    }
    
    //MARK: - FUNC toggleShowHideAction
      func toggleShowHideAction(_ action: Selector, with target: Any?) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        imageViewPassword.isUserInteractionEnabled = true
        imageViewPassword.addGestureRecognizer(tapGestureRecognizer)
    }
}
