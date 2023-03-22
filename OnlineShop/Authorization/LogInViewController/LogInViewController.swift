//
//  LoginViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//
import UIKit


final class LoginViewController: OnlineShopBaseViewController {
    
    //MARK: - PROPERTIES
    var iconClick = true
    
    private let loginLabel = OSLabel(textLabel: Resources.String.Authorization.Title.welcomeBack,
                                     font: Resources.Fonts.MontserratSemiBold(with: 26),
                                     textColor: Resources.Colors.Authorization.authorizationTitleLabel)
    
    private let loginTextFieldView = LoginTextFieldView()
    
    private let loginButton : OSButton = {
        let button = OSButton(with: .authorization)
        button.setTitle(Resources.String.Authorization.Login.login, for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    private var errorLabel = OSLabel(textLabel: "",
                                     font:  Resources.Fonts.MontserratSemiBold(with: 10),
                                     textColor: Resources.Colors.Background.diskountBackground)

}

//MARK: - LIFECYCLE
extension LoginViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(loginLabel)
        view.setupView(loginTextFieldView)
        view.setupView(loginButton)
        view.setupView(errorLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextFieldView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 78),
            loginTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: loginTextFieldView.bottomAnchor, constant: 40),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: loginTextFieldView.bottomAnchor, constant: 100),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        loginTextFieldView.toggleShowHideAction(#selector(imageTaapped(tapGestureRecognizer:)), with: self)
    }
    
    //MARK: - @OBJC FUNC imageTaapped
    @objc func imageTaapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        if iconClick {
            iconClick = false
            loginTextFieldView.passwordTextField.isSecureTextEntry = false
        } else {
            iconClick = true
            loginTextFieldView.passwordTextField.isSecureTextEntry = true
        }
    }
    
//MARK: - LOGIN AUTHORIZATION
    
    private func findUserDataBase(name: String) -> User? {
        let dataBase = DataBase.shared.users
        print(dataBase)
        
        for user in dataBase {
            if user.firstName == name {
                return user
            }
        }
        return nil
    }
    
    @objc func loginTapped() {
    
        let firstName = loginTextFieldView.firstNameTextField.text ?? ""
        let password = loginTextFieldView.passwordTextField.text ?? ""
        let user = findUserDataBase(name: firstName)
        
        if user == nil {
            errorLabel.text = Resources.String.Authorization.Error.userNotExist
        } else if user?.password == password {
            let tabBarController = TabBarController()
            
            view.window?.rootViewController = tabBarController
            view.window?.makeKeyAndVisible()
            
            guard let activeUser = user else {return}
            DataBase.shared.saveActiveUser(user: activeUser)
        }
        else {
            errorLabel.text = Resources.String.Authorization.Error.password
        }
    }
}
