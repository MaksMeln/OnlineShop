//
//  LogInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class LogInTextFieldView : OnlineShopBaseView {
//MARK: - PROPERTIES
    let imageViewPassword : UIImageView = {
       let imageView  = UIImageView(frame: CGRect(x: -20, y: 0, width: 14, height: 14))
       imageView.image = Resources.Images.Autorization.passwordIcon
       return imageView
   }()
    
     let firstNameTextField = UITextField(placecholder: Resources.String.Authorization.firstName)
    
     let passwordTextField = UITextField(placecholder: Resources.String.Authorization.password)
 
}

//MARK: - LIFECYCLE
extension LogInTextFieldView {
    override func setupViews() {
        super.setupViews()
        
    }
    
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
