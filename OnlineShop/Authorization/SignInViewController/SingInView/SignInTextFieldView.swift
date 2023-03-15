//
//  SignInTextFieldView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

class SignInTextFieldView : OnlineShopBaseView {
    
    
    private let firstNameTextField = UITextField(placecholder: Resources.String.Authorization.firstName)
    
    private let lastNameTextField = UITextField(placecholder: Resources.String.Authorization.lastName)
    
    private let emailTextField = UITextField(placecholder: Resources.String.Authorization.email)
    
    
    override func setupViews() {
        super.setupViews()
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        let stackViewTextField = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField, emailTextField])
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
