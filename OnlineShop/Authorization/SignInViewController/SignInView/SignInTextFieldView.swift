//
//  SignInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class SignInTextFieldView : OnlineShopBaseView {
    
    //MARK: - PROPERTIES
    var imageViewPassword : UIImageView = {
        let imageView  = UIImageView(frame: CGRect(x: -15, y: 0, width: 14, height: 14))
        imageView.image = Resources.Images.Autorization.passwordIcon
        return imageView
    }()
    
    let contentView : UIView = {
       let contentView = UIView()
        contentView.frame = CGRect(x: 0, y: 0, width: Resources.Images.Autorization.passwordIcon!.size.width, height: Resources.Images.Autorization.passwordIcon!.size.height)
        return contentView
    }()
    
    var firstNameTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.firstName)
    
    var lastNameTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.lastName)
    
    var emailTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.email)
    
    var passwordTextField = OSTextField(with: .authorization, placecholder: Resources.String.Authorization.TextField.password)
}

//MARK: - LIFECYCLE
extension SignInTextFieldView {
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
        contentView.addSubview(imageViewPassword)
        passwordTextField.rightView = contentView
        passwordTextField.rightViewMode = .always
    
    }
    
    //MARK: - FUNC toggleShowHideAction
      func toggleShowHideAction(_ action: Selector, with target: Any?) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        contentView.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(tapGestureRecognizer)
    }
}
