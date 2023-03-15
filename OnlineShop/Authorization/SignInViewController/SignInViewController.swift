//
//  SignInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit
import FirebaseAuth
import Firebase


final class SignInViewController: OnlineShopBaseViewController {
    
    var iconClick = true
    //MARK: - PROPERTIES
    private let signInLabel = UILabel(text: Resources.String.Authorization.signIn,
                                      font: Resources.Fonts.MontserratSemiBold(with: 26),
                                      textColor: Resources.Colors.authorizationTitleLabel)
    
    private let signInTextFieldView = SignInTextFieldView()
    
    private let signInWithButtonView = SignInAuthorizationButtonView()
    
    private let signInLogInView = SignInLogInView()
    
    private let signInButton : OnlineShopButton = {
        let button = OnlineShopButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.signIn, for: .normal)
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return button
    }()
    
    var errorLabel : UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .red
        return label
    }()
}

//MARK: - LIFECYCLE
extension SignInViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(signInLabel)
        view.setupView(signInButton)
        view.setupView(signInTextFieldView)
        view.setupView(signInLogInView)
        view.setupView(signInWithButtonView)
        view.setupView(errorLabel)
        
        errorLabel.alpha = 0
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInTextFieldView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 78),
            signInTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInButton.topAnchor.constraint(equalTo: signInTextFieldView.bottomAnchor, constant: 35),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signInLogInView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 17),
            signInLogInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            
            signInWithButtonView.topAnchor.constraint(equalTo: signInLogInView.bottomAnchor, constant: 74),
            signInWithButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: signInLogInView.bottomAnchor, constant: 20),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        signInTextFieldView.toggleShowHideAction(#selector(imageTaapped(tapGestureRecognizer:)), with: self)
    }
    
    //MARK: - @@objc FUNC imageTaapped
    @objc func imageTaapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if iconClick {
            iconClick = false
            signInTextFieldView.passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            signInTextFieldView.passwordTextField.isSecureTextEntry = true
        }
    }
}


//MARK: - CONFIGURE SIGNIN FIREBASE
extension SignInViewController {
    
    func validateFields() -> String? {
        
        if signInTextFieldView.firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signInTextFieldView.lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signInTextFieldView.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signInTextFieldView.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        let cleanedPassword = signInTextFieldView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }
    
    @objc func signUpTapped() {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            let firstName = signInTextFieldView.firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = signInTextFieldView.lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = signInTextFieldView.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = signInTextFieldView.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let tabBarController = TabBarController()
        
        view.window?.rootViewController = tabBarController
        view.window?.makeKeyAndVisible()
    }
}
