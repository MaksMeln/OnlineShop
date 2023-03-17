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
    case signInButton
    case location
    case viewAll
}

class OSButton : UIButton {
    
    private var type: OnlineShopButtonType = .uploadItem
    
    private let label = UILabel()
    private let iconView = UIImageView ()
    private let vectorView = UIImageView ()
    private let balance = UILabel()
    
    
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
}

private extension OSButton {
    
    func setupViews() {
        setupView(label)
        setupView(iconView)
        setupView(vectorView)
        setupView(balance)
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
        case .signInButton:
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
        }
    }
    //MARK: - CONFIGUREAPPEARANCE
    func configureAppearance() {
        switch type {
            
        case .uploadItem:
            backgroundColor = Resources.Colors.backgroundButton
            layer.cornerRadius = 15
            
            label.text = Resources.String.ProfileController.uploadItemButton
            label.textColor = Resources.Colors.defaultWhite
            label.font = Resources.Fonts.MontserratBold(with: 14)
            iconView.image = Resources.Images.ProfileController.uploadItem
            
        case .profileButton:
            backgroundColor = .none
            
            label.textColor = Resources.Colors.defaultBlack
            label.font = Resources.Fonts.MontserratMedium(with: 14)
            balance.textColor = Resources.Colors.defaultBlack
            balance.font = Resources.Fonts.MontserratMedium(with: 14)
            
        case .authorization:
            backgroundColor = Resources.Colors.backgroundButton
            layer.cornerRadius = 15
            
            label.textColor = Resources.Colors.defaultWhite
            label.font = Resources.Fonts.MontserratBold(with: 10)
            
        case .signInButton:
            backgroundColor = .none
            
            label.textColor = Resources.Colors.defaultBlack
            label.font = Resources.Fonts.MontserratMedium(with: 12)
        case .location:
            backgroundColor = .none
            
            label.textColor = Resources.Colors.defaultGray
            label.font = Resources.Fonts.MontserratMedium(with: 10)
            label.text = Resources.String.HomeController.NavBar.location
            
            
            iconView.image = Resources.Images.HomeController.locationVector
        case .viewAll:
            label.text = Resources.String.HomeController.viewAll
            label.font = Resources.Fonts.MontserratSemiBold(with: 9)
            label.textColor = Resources.Colors.defaultGray
        }
        makeSystem(self)
    }
    
}

