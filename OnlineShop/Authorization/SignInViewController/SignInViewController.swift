//
//  SignInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

/*
 переход на logInController через navigationcontroller
 добавление вех View на отдельный SignInView
 разобраться с error
 */

final class SignInViewController: OnlineShopBaseViewController {
    
    var iconClick = true
//MARK: - SCROLLVIEW
    
    private var contentCize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    private lazy var scrollView = OSScrollView(frame: view.bounds,
                                               contentSize: contentCize)
    private lazy var contentView = UIView(contentSize: contentCize)
 
//MARK: - PROPERTIES
    private let signInLabel = OSLabel(textLabel: Resources.String.Authorization.Title.signIn,
                                      font: Resources.Fonts.MontserratSemiBold(with: 26),
                                      textColor: Resources.Colors.Authorization.authorizationTitleLabel)
    
    private let signInTextFieldView = SignInTextFieldView()
    
    private let signInWithButtonView = SignInAuthorizationButtonView()
    
    private let signInLoginView = SignInLoginButtonView()
    
    private let signInButton : OSButton = {
        let button = OSButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.Title.signIn, for: .normal)
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        return button
    }()
    
    private var errorLabel = OSLabel(textLabel: "",
                                     font:  Resources.Fonts.MontserratSemiBold(with: 10),
                                     textColor: Resources.Colors.Background.diskountBackground)

//MARK: - VALIDTYPE
    let firstNameValidType: String.ValidTypes = .name
    let lastNameValidType: String.ValidTypes = .name
    let emailValueType : String.ValidTypes = .email
    let passwordValueType : String.ValidTypes = .password
    
    deinit {
        removeKeyboardNotification()
    }
}

//MARK: - LIFECYCLE
extension SignInViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.setupView(signInLabel)
        contentView.setupView(signInButton)
        contentView.setupView(signInTextFieldView)
        contentView.setupView(signInLoginView)
        contentView.setupView(signInWithButtonView)
        contentView.setupView(errorLabel)
       
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            signInLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 155),
            signInLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            signInTextFieldView.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 78),
            signInTextFieldView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            signInButton.topAnchor.constraint(equalTo: signInTextFieldView.bottomAnchor, constant: 35),
            signInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            signInLoginView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 17),
            signInLoginView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            
            signInWithButtonView.topAnchor.constraint(equalTo: signInLoginView.bottomAnchor, constant: 74),
            signInWithButtonView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: signInLoginView.bottomAnchor, constant: 20),
            errorLabel.widthAnchor.constraint(equalToConstant: 200),
            errorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        signInTextFieldView.toggleShowHideAction(#selector(imageTaapped(tapGestureRecognizer:)), with: self)
        signInLoginView.loginButtonAction(#selector(logInButtonPress), with: self)
        
        registerKeyboardNotification()
        setupDelegate()
        
    }
    
//    MARK: - @@objc FUNC imageTaapped
    @objc func imageTaapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if iconClick {
            iconClick = true
            signInTextFieldView.passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = false
            signInTextFieldView.passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func logInButtonPress() {
        let vc = LoginViewController()
//                navigationController?.pushViewController(vc, animated: true)
        
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    private func setupDelegate() {
        
        signInTextFieldView.firstNameTextField.delegate = self
        signInTextFieldView.lastNameTextField.delegate = self
        signInTextFieldView.emailTextField.delegate = self
        signInTextFieldView.passwordTextField.delegate = self
    }
}

//MARK: - EXTENSION KEYBOARD SHOW HIDE
extension SignInViewController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
}


// MARK: - EXTENSION SETTEXTFIELD
extension SignInViewController : UITextFieldDelegate {
    
    private func setTextField(textField: UITextField, validType: String.ValidTypes , wrongMessage : String, string: String, range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        
        if result.isValid(validType: validType) {}
        else {
            errorLabel.text = wrongMessage
            errorLabel.textColor = .red
        }
    }

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case signInTextFieldView.firstNameTextField :
            setTextField(textField: signInTextFieldView.firstNameTextField,
                         validType: firstNameValidType,
                         wrongMessage: Resources.String.Authorization.Error.name,
                         string: string,
                         range: range)
            
        case signInTextFieldView.lastNameTextField :
            setTextField(textField: signInTextFieldView.lastNameTextField,
                         validType: lastNameValidType,
                         wrongMessage: Resources.String.Authorization.Error.name,
                         string: string,
                         range: range)
            
        case signInTextFieldView.emailTextField :
            setTextField(textField: signInTextFieldView.emailTextField,
                         validType: emailValueType,
                         wrongMessage: Resources.String.Authorization.Error.email,
                         string: string,
                         range: range)
        case signInTextFieldView.passwordTextField :
            setTextField(textField: signInTextFieldView.passwordTextField,
                         validType: passwordValueType,
                         wrongMessage: Resources.String.Authorization.Error.password,
                         string: string,
                         range: range)
        default :
            break
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        signInTextFieldView.firstNameTextField.resignFirstResponder()
        signInTextFieldView.lastNameTextField.resignFirstResponder()
        signInTextFieldView.emailTextField.resignFirstResponder()
        signInTextFieldView.passwordTextField.resignFirstResponder()
     
        return true
    }
}

//MARK: - BUTTON SIGNUP TAPPED
extension SignInViewController {
    
         private func findUserDataBase(userFirrstName: String, userLastName: String, userEmail: String, userPassword: String) -> User? {
            let dataBase = DataBase.shared.users
           
             for user in dataBase {
                if user.firstName == userFirrstName &&
                    user.lastName == userLastName &&
                    user.password == userPassword &&
                    user.email == userEmail {
                    return user
                }
            }
            return nil
        }
    
    @objc func signUpTapped() {
        let firstNameText = signInTextFieldView.firstNameTextField.text ?? ""
        let lastNameText = signInTextFieldView.lastNameTextField.text ?? ""
        let emailText = signInTextFieldView.emailTextField.text ?? ""
        let passwordText = signInTextFieldView.passwordTextField.text ?? ""
        let user = findUserDataBase(userFirrstName: firstNameText, userLastName: lastNameText, userEmail: emailText, userPassword: passwordText)
        
        if firstNameText.isValid(validType: firstNameValidType) &&
            lastNameText.isValid(validType: lastNameValidType) &&
            emailText.isValid(validType: emailValueType) &&
            passwordText.isValid(validType: passwordValueType) &&
            user == nil
        {
            DataBase.shared.saveUser(firstName: firstNameText,
                                     lastName: lastNameText,
                                     email: emailText,
                                     password: passwordText)
            errorLabel.text = Resources.String.Authorization.Error.registrationSucces
            
            let tabBarController = TabBarController()
            
            view.window?.rootViewController = tabBarController
            view.window?.makeKeyAndVisible()
            
        } else if user != nil {
            errorLabel.text = Resources.String.Authorization.Error.userExists
        } else {
            errorLabel.text = Resources.String.Authorization.Error.registrationError
        }
    }
}
