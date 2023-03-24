//
//  OSButton.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

/*
 переименовать кнопку signIn - найти слово для google and apple
 кнопка uploudItem - такая же как на авторизации, их нужно объеденить
 изменить в кнопках баланса - убрать его, создать отдельную кнопку
 добавить еще функции с разными вводными,чтобы не писать лишего кода в контроллерах
 
 */
import UIKit

public enum OnlineShopButtonType {
    case authorization
    case uploadItem
    case profileButton
    case signInWithHelpersButton
    case location
    case viewAll
    case changePhoto
    case login
    case quantity
    case addToCart
}

final class OSButton : UIButton {
    
    private var type: OnlineShopButtonType = .uploadItem
    
     let label = UILabel()
    private let iconView = UIImageView ()
    private let vectorView = UIImageView ()
     let balance = UILabel()
    let price = UILabel()
    
    
    init(with type: OnlineShopButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func setInfo(_ title: String?, _ iconViewImage: UIImage?, _ vectorViewImage: UIImage? , _ balanceLabel: String?) {
        label.text = title
        iconView.image = iconViewImage
        vectorView.image = vectorViewImage
        balance.text = balanceLabel
    }
    
    func setIcon(_ icon: UIImage? ) {
        iconView.image = icon
    }
    
    func setTitle(_ title: String?) {
        balance.text = title
    }
}

private extension OSButton {
    
    func setupViews() {
        setupView(label)
        setupView(iconView)
        setupView(vectorView)
        setupView(balance)
        setupView(price)
    }
    
//MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        switch type {
        case .uploadItem :
            setDimensions(height: 40, width: 290)
            iconView.setDimensions(height: 12.5, width: 10)
            
            NSLayoutConstraint.activate([
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 52),
                
                label.centerYAnchor.constraint(equalTo: centerYAnchor),
                label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 40),
            ])
            
        case .profileButton:
            setDimensions(height: 40, width: 298)
            iconView.setDimensions(height: 40, width: 40)
            
            NSLayoutConstraint.activate([
                
                iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                label.centerYAnchor.constraint(equalTo: centerYAnchor),
                label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 9),
                
                vectorView.trailingAnchor.constraint(equalTo: trailingAnchor),
                vectorView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                balance.trailingAnchor.constraint(equalTo: trailingAnchor),
                balance.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
            
        case .authorization :
            setDimensions(height: 46, width: 290)
            label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       
        case .signInWithHelpersButton:
            setDimensions(height: 25, width: 148)
            
            NSLayoutConstraint.activate([
                iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                label.centerYAnchor.constraint(equalTo: centerYAnchor),
                label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 11),
            ])
        case .location:
            setDimensions(height: 10, width: 53)
            
            NSLayoutConstraint.activate([
                iconView.trailingAnchor.constraint(equalTo: trailingAnchor),
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                label.centerYAnchor.constraint(equalTo: centerYAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor),
            ])
            
        case .viewAll:
            setDimensions(height: 9, width: 37)
            
        case .changePhoto:
            setDimensions(height: 9, width: 60)
            
        case .login:
            break
            
        case .quantity:
            setDimensions(height: 22, width: 38)
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
        case .addToCart:
            setDimensions(height: 44, width: 170)
            
            NSLayoutConstraint.activate([
                
                price.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 29),
                price.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                balance.leadingAnchor.constraint(equalTo: price.trailingAnchor, constant: 3),
                balance.centerYAnchor.constraint(equalTo: centerYAnchor),
                
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -26),
                label.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
        }
    }
//MARK: - CONFIGUREAPPEARANCE
    func configureAppearance() {
        switch type {
            
        case .uploadItem:
            backgroundColor = Resources.Colors.Background.backgroundButton
            layer.cornerRadius = 15
            label.text = Resources.String.ProfileController.uploadItemButton
            label.textColor = Resources.Colors.Default.defaultWhite
            label.font = Resources.Fonts.MontserratBold(with: 14)
            iconView.image = Resources.Images.ProfileController.uploadItem
            
        case .profileButton:
            backgroundColor = .none
            label.textColor = Resources.Colors.Default.defaultBlack
            label.font = Resources.Fonts.MontserratMedium(with: 14)
            balance.textColor = Resources.Colors.Default.defaultBlack
            balance.font = Resources.Fonts.MontserratMedium(with: 14)
            
        case .authorization:
            backgroundColor = Resources.Colors.Background.backgroundButton
            layer.cornerRadius = 15
            label.textColor = Resources.Colors.Default.defaultWhite
            label.font = Resources.Fonts.MontserratBold(with: 10)
            
        case .signInWithHelpersButton:
            backgroundColor = .none
            label.textColor = Resources.Colors.Default.defaultBlack
            label.font = Resources.Fonts.MontserratMedium(with: 12)
            
        case .location:
            backgroundColor = .none
            label.textColor = Resources.Colors.Default.defaultGray
            label.font = Resources.Fonts.MontserratMedium(with: 10)
            label.text = Resources.String.Page1Controller.NavBar.location
            iconView.image = Resources.Images.Page1Controller.NavBar.locationVector
            
        case .viewAll:
            label.text = Resources.String.Page1Controller.viewAll
            label.font = Resources.Fonts.MontserratSemiBold(with: 9)
            label.textColor = Resources.Colors.Default.defaultGray
       
        case .changePhoto:
            label.text = Resources.String.ProfileController.changePhotoLabel
            label.textColor = Resources.Colors.Default.defaultGray
            label.font = Resources.Fonts.MontserratMedium(with: 8)
        case .login:
            label.text = Resources.String.Authorization.Login.login
            label.textColor = Resources.Colors.Default.defaultBlue
            label.font = Resources.Fonts.MontserratMedium(with: 10)
        case .quantity:
            backgroundColor =  Resources.Colors.Background.backgroundButton
            layer.cornerRadius = 8
            
        case .addToCart:
            backgroundColor =  Resources.Colors.Background.backgroundButton
            layer.cornerRadius = 15
            
            label.text = "ADD TO CART"
            label.textColor = Resources.Colors.Default.defaultWhite
            label.font = Resources.Fonts.MontserratSemiBold(with: 8)
            
            price.text = "$"
            price.textColor = Resources.Colors.Default.defaultWhite
            price.font = Resources.Fonts.MontserratSemiBold(with: 8)
            
            balance.textColor = Resources.Colors.Default.defaultWhite
            balance.font = Resources.Fonts.MontserratSemiBold(with: 8)
            
        }
        makeSystem(self)
    }
}
