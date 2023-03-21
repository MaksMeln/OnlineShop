//
//  LogInViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//
import UIKit


final class LogInViewController: OnlineShopBaseViewController {
    
    //MARK: - PROPERTIES
    var iconClick = true
    
    private let logInLabel = OSLabel(textLabel: Resources.String.Authorization.welcomeBack,
                                     font: Resources.Fonts.MontserratSemiBold(with: 26),
                                     textColor: Resources.Colors.Authorization.authorizationTitleLabel)
    
    private let logInTextFieldView = LogInTextFieldView()
    
    private let logInButton : OSButton = {
        let button = OSButton(with: .authorization)
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
        view.setupView(errorLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            logInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 155),
            logInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInTextFieldView.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 78),
            logInTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: logInTextFieldView.bottomAnchor, constant: 40),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logInButton.topAnchor.constraint(equalTo: logInTextFieldView.bottomAnchor, constant: 100),
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
    
    @objc func logInTapped() {
    
        let firstName = logInTextFieldView.firstNameTextField.text ?? ""
        let password = logInTextFieldView.passwordTextField.text ?? ""
        let user = findUserDataBase(name: firstName)
        
        if user == nil {
            errorLabel.text = "User not found"
        } else if user?.password == password {
            let tabBarController = TabBarController()
            
            view.window?.rootViewController = tabBarController
            view.window?.makeKeyAndVisible()
            
            guard let activeUser = user else {return}
            DataBase.shared.saveActiveUser(user: activeUser)
        }
        else {
            errorLabel.text = "Wrong password"
        }
    }
}
