//
//  UIButton + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//


import UIKit

public enum OnlineShopButtonType {
    case registration
    case uploadItem
    case profileButton
}

class OnlineShopButton : UIButton {
    
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

private extension OnlineShopButton {
    
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
            
            
        case .registration :
            break
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
            
        case .registration:
            break
        }
        makeSystem(self)
    }
    
}

