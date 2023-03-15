//
//  LogInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class LogInTextFieldView : OnlineShopBaseView {
    
    
    private let firstNameTextField = UITextField(placecholder: Resources.String.Authorization.firstName)
    
    private let passwordTextField : UITextField = {
        let imageView = UIImageView(frame: CGRect(x: -20, y: 0, width: 14, height: 14))
         imageView.image = Resources.Images.Autorization.passwordIcon
        
        let password = UITextField(placecholder: Resources.String.Authorization.password)
        password.rightViewMode = UITextField.ViewMode.always
        password.rightView = imageView
        
        return password
    }()
    
    
}
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
    }
}

