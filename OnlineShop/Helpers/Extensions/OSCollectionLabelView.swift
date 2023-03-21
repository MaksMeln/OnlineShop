//
//  OSCollectionLabelView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//
import UIKit

public enum OSCollectionLabelViewType {
    case nameCategoryLatest
    case nameCategotyFlashSale
    case discount
    case latestPrice
    case flashSalePrice
}

final class OSCollectionLabelView : UIView {
    
    var type: OSCollectionLabelViewType = .nameCategoryLatest
    
    var label = UILabel()
    var discountLabel = UILabel()
    var flashSalePriceLabel = UILabel()
    var latestPriceLabel = UILabel()
    
    
    
    init(with type: OSCollectionLabelViewType, text labelText : String?) {
        super.init(frame: .zero)
        self.type = type
        self.label.text = labelText
        
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

private extension OSCollectionLabelView {
    
    func setupViews() {
        setupView(label)
        setupView(discountLabel)
        setupView(latestPriceLabel)
        setupView(flashSalePriceLabel)
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
            
        case .latestPrice:
            NSLayoutConstraint.activate([
                
                latestPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                latestPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: latestPriceLabel.trailingAnchor, constant: 1)
            ])
            
        case .flashSalePrice:
            NSLayoutConstraint.activate([
                
                flashSalePriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                flashSalePriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: flashSalePriceLabel.trailingAnchor, constant: 2)
            ])
        
        }
    }
    //MARK: - CONFIGUREAPPEARANCE
    func configureAppearance() {
        switch type {
            
        case .nameCategoryLatest:
            backgroundColor = Resources.Colors.Background.categoryNameBackground.withAlphaComponent(0.85)
            layer.cornerRadius = 5
            
            label.textAlignment = .center
            label.font = Resources.Fonts.MontserratSemiBold(with: 6)
            label.textColor = Resources.Colors.Default.defaultBlack
        
        case .nameCategotyFlashSale:
            backgroundColor = Resources.Colors.Background.categoryNameBackground.withAlphaComponent(0.85)
            layer.cornerRadius = 8.5
            
            label.textAlignment = .center
            label.font = Resources.Fonts.MontserratSemiBold(with: 9)
            label.textColor = Resources.Colors.Default.defaultBlack
            
        case .discount:
            backgroundColor = Resources.Colors.Background.diskountBackground
            layer.cornerRadius = 9
            
            label.font = Resources.Fonts.MontserratBold(with: 10)
            label.textColor = Resources.Colors.Default.defaultWhite
            
            discountLabel.text = Resources.String.Page1Controller.discount
            discountLabel.font = Resources.Fonts.MontserratSemiBold(with: 10)
            discountLabel.textColor = Resources.Colors.Default.defaultWhite
            
        case .flashSalePrice:
            label.font = Resources.Fonts.MontserratSemiBold(with: 10)
            label.textColor = Resources.Colors.Default.defaultWhite
            
            flashSalePriceLabel.text = "$"
            flashSalePriceLabel.font =  Resources.Fonts.MontserratSemiBold(with: 10)
            flashSalePriceLabel.textColor = Resources.Colors.Default.defaultWhite
            
        case .latestPrice:
            label.font = Resources.Fonts.MontserratSemiBold(with: 7)
            label.textColor = Resources.Colors.Default.defaultWhite
            
            latestPriceLabel.text = "$"
            latestPriceLabel.font = Resources.Fonts.MontserratSemiBold(with: 7)
            latestPriceLabel.textColor = Resources.Colors.Default.defaultWhite
        }
    }
}

