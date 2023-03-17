//
//  OSNameCategoryView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//
import UIKit

public enum OSNameCategoryViewType {
    case nameCategoryLatest
    case nameCategotyFlashSale
    case discount
}

final class OSNameCategoryView : UIView {
    
    var type: OSNameCategoryViewType = .nameCategoryLatest
    
    var label = UILabel()
    var discountLabel = UILabel()
    
    init(with type: OSNameCategoryViewType) {
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
}

private extension OSNameCategoryView {
    
    func setupViews() {
        setupView(label)
        setupView(discountLabel)
    }
    
    //MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        switch type {
        case .nameCategoryLatest:
            NSLayoutConstraint.activate([
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            ])
            
        case .nameCategotyFlashSale:
            NSLayoutConstraint.activate([
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            ])
       
            
        case .discount:
            NSLayoutConstraint.activate([
                
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                
                discountLabel.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 0),
                discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
                discountLabel.centerYAnchor.constraint(equalTo: label.centerYAnchor)
            ])
        }
    }
    //MARK: - CONFIGUREAPPEARANCE
    func configureAppearance() {
        switch type {
            
        case .nameCategoryLatest:
            backgroundColor = Resources.Colors.categoryNameBackground.withAlphaComponent(0.85)
            layer.cornerRadius = 5
            
            label.textAlignment = .center
            label.font = Resources.Fonts.MontserratSemiBold(with: 6)
            label.textColor = Resources.Colors.defaultBlack
        
        case .nameCategotyFlashSale:
            backgroundColor = Resources.Colors.categoryNameBackground.withAlphaComponent(0.85)
            layer.cornerRadius = 8.5
            
            label.textAlignment = .center
            label.font = Resources.Fonts.MontserratSemiBold(with: 9)
            label.textColor = Resources.Colors.defaultBlack
            
        case .discount:
            backgroundColor = Resources.Colors.diskountBackground
            layer.cornerRadius = 9
            
            label.font = Resources.Fonts.MontserratBold(with: 10)
            label.textColor = Resources.Colors.defaultWhite
            
            discountLabel.text = Resources.String.HomeController.discount
            discountLabel.font = Resources.Fonts.MontserratSemiBold(with: 10)
            discountLabel.textColor = Resources.Colors.defaultWhite
        }
    }
}

