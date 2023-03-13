//
//  UIButton + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//


import UIKit

public enum OnlineShopButtonType {
    case uploadItem
    case registration
    
}

class OnlineShopButton : UIButton {
    
    private var type: OnlineShopButtonType = .uploadItem
    
    private let label = UILabel()
    private let iconView = UIImageView ()
    
    
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
    
    func setInfo(_ title: String?, _ image: UIImage?) {
        label.text = title
        iconView.image = image
    }
}

private extension OnlineShopButton {
    
    func setupViews() {
        setupView(label)
        setupView(iconView)
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
            label.textColor = Resources.Colors.defaultWhite
            label.font = Resources.Fonts.MontserratBold(with: 14)
            label.textAlignment = .center
            
        case .registration:
           break
    
        }
        makeSystem(self)
    }
    
}

