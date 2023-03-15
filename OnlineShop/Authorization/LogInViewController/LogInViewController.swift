//
//  LogInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit
import FirebaseAuth


final class LogInViewController: OnlineShopBaseViewController {
    
//MARK: - PROPERTIES
    var iconClick = true
    
    private let logInLabel = UILabel(text: Resources.String.Authorization.welcomeBack,
                                     font: Resources.Fonts.MontserratSemiBold(with: 26),
                                     textColor: Resources.Colors.authorizationTitleLabel)
    
    private let logInTextFieldView = LogInTextFieldView()
    
    private let logInButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.logIn, for: .normal)
        button.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        return button
    }()
    
   private var errorLabel : UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .red
        return label
    }()
}

//MARK: - LIFECYCLE
extension LogInViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(logInLabel)
        view.setupView(logInTextFieldView)
        view.setupView(logInButton)
        
        errorLabel.alpha = 0
    }
        
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            logInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            logInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInTextFieldView.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 78),
            logInTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInButton.topAnchor.constraint(equalTo: logInTextFieldView.bottomAnchor, constant: 35),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        logInTextFieldView.toggleShowHideAction(#selector(imageTaapped(tapGestureRecognizer:)), with: self)
    }
    
//MARK: - @OBJC FUNC imageTaapped
    @objc func imageTaapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if iconClick {
            iconClick = false
            logInTextFieldView.passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            logInTextFieldView.passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func logInTapped() {
        
        print("LogInbutton")
//        let firstName = logInTextFieldView.firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        let password = logInTextFieldView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        // Signing in the user
////        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
////        Auth.auth().signIn(with: firstName: firstName, password: password) { (result, error) in
//
//            if error != nil {
//                // Couldn't sign in
//                self.errorLabel.text = error!.localizedDescription
//                self.errorLabel.alpha = 1
//            }
//            else {
//                let tabBarController = TabBarController()
//
//                view.window?.rootViewController = tabBarController
//                view.window?.makeKeyAndVisible()
//            }
        }
    }
    
//}
