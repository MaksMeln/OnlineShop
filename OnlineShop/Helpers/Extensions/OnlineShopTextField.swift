//
//  OnlineShopTextField.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 16.03.23.
//



import UIKit

public enum OnlineShopTextFieldType {
    case authorization
    case authorizationPassword
    case searchBar
}

final class OnlineShopTextField : UITextField {
    
    private var type: OnlineShopTextFieldType = .authorization
    
    
    private var iconView = UIImageView ()
    
    
    init(with type: OnlineShopTextFieldType,placecholder text: String? ) {
        super.init(frame: .zero)
        self.type = type
        self.placeholder = text
        
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
    
    func setIcon( _ iconViewImage: UIImage?) {
        iconView.image = iconViewImage
    }
    
    
}

private extension OnlineShopTextField {
    
    func setupViews() {
        setupView(iconView)
    }
    
    //MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        switch type {
        case .authorization :
            setDimensions(height: 30, width: 290)
            
        case .searchBar:
            setDimensions(height: 24, width: 262)
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
            
        case .authorizationPassword:
            break
        }
    }
    //MARK: - CONFIGUREAPPEARANCE
    func configureAppearance() {
        switch type {
            
        case .authorization:
            backgroundColor = Resources.Colors.authorizationBackgoundTextField
            
            layer.cornerRadius = 15
            textAlignment = .center
            font = Resources.Fonts.MontserratMedium(with: 11)
            
        case .searchBar:
            backgroundColor = Resources.Colors.searchBarTextField
            
            layer.cornerRadius = 12
            textAlignment = .center
            font = Resources.Fonts.MontserratMedium(with: 9)
            textColor = Resources.Colors.defaultGray
            attributedPlaceholder = NSAttributedString(string: Resources.String.HomeController.searchBar,
                                                       attributes: [NSAttributedString.Key.foregroundColor: Resources.Colors.defaultGray])
            
            iconView.image = Resources.Images.HomeController.searchIcon
            rightViewMode = UITextField.ViewMode.always
            rightView = iconView
            
        case .authorizationPassword:
            break
        }
}
}
    
    
