//
//  SignInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit


class SignInViewController: OnlineShopBaseViewController {
    
    private let signInLabel = UILabel(text: Resources.String.Authorization.signIn,
                                      font: Resources.Fonts.MontserratSemiBold(with: 26),
                                      textColor: Resources.Colors.authorizationTitleLabel)
    
//    private let firstNameTextField = UITextField(placecholder: Resources.String.Authorization.firstName)
//
//    private let lastNameTextField = UITextField(placecholder: Resources.String.Authorization.lastName)
//
//    private let emailTextField = UITextField(placecholder: Resources.String.Authorization.email)
    
    private let signInTextField = SignInTextFieldView()
    
    private let signInWithButtonView = SignInWithButtonView()
    
    private let signInLogInView = SignInLogInView()
    
    private let signInButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.signIn, for: .normal)
        return button
    }()
    
//    private let subtitleLabelLogIn = UILabel(text: Resources.String.Authorization.subtitleLogIn,
//                                             font: Resources.Fonts.MontserratMedium(with: 10),
//                                             textColor: Resources.Colors.defaultGray)
//    
//    private let logInButton : UIButton = {
//       let button = UIButton()
//        button.setTitle(Resources.String.Authorization.logIn, for: .normal)
//        button.setTitleColor(Resources.Colors.defaultBlue, for: .normal)
//        button.titleLabel?.font = Resources.Fonts.MontserratMedium(with: 10)
//        return button
//    }()
    
//    private let signInWithGoogleButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .signInButton)
//        button.setInfo(Resources.String.Authorization.google,
//                       Resources.Images.Autorization.googleIcon,
//                       nil,
//                       nil)
//        return button
//    }()
//    
//    private let signInWithAppleButton : OnlineShopButton = {
//        let button = OnlineShopButton(with: .signInButton)
//        button.setInfo(Resources.String.Authorization.apple,
//                       Resources.Images.Autorization.appleIcon,
//                       nil,
//                       nil)
//        return button
//    }()
}


extension SignInViewController {
    
   override func setupViews() {
    super.setupViews()
       
       view.setupView(signInLabel)
       view.setupView(signInButton)
       view.setupView(signInTextField)
       view.setupView(signInLogInView)
       view.setupView(signInWithButtonView)
    }
    
    
    override func constraintViews() {
        super.constraintViews()
        
//        let stackViewTextField = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField, emailTextField, )
//        stackViewTextField.axis = .vertical
//        stackViewTextField.spacing = 35
//        view.setupView(stackViewTextField)
        
//        let stackViewLoginInfo = UIStackView(arrangedSubviews: [subtitleLabelLogIn, logInButton])
//        stackViewLoginInfo.axis = .horizontal
//        stackViewLoginInfo.spacing = 9
//        stackViewLoginInfo.heightAnchor.constraint(equalToConstant: 10).isActive = true
//        view.setupView(stackViewLoginInfo)
//        
//        let stackViewSignInButton = UIStackView(arrangedSubviews: [signInWithGoogleButton , signInWithAppleButton])
//        stackViewSignInButton.axis = .vertical
//        stackViewSignInButton.spacing = 38
//        view.setupView(stackViewSignInButton)
        
        
        
        NSLayoutConstraint.activate([
            
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInTextField.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 78),
            signInTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.topAnchor.constraint(equalTo: signInTextField.bottomAnchor, constant: 35),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInLogInView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 17),
            signInLogInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            
            signInWithButtonView.topAnchor.constraint(equalTo: signInLogInView.bottomAnchor, constant: 74),
            signInWithButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    override func configureAppearence() {
        super.configureAppearence()
    }
}
