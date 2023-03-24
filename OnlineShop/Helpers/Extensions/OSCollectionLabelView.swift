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
    case page2Price
    case numberOfReviews
}

final class OSCollectionLabelView : UIView {
    
    var type: OSCollectionLabelViewType = .nameCategoryLatest
    
    var label = UILabel()
    var discountLabel = UILabel()
    var priceLabel = UILabel()
    var leftBracket = UILabel()
    var rightBracket = UILabel()
    
    
    
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
        setupView(priceLabel)
        setupView(leftBracket)
        setupView(rightBracket)
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
                
                priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 1)
            ])
            
        case .flashSalePrice:
            NSLayoutConstraint.activate([
                
                priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 2)
            ])
        
        case .page2Price :
            NSLayoutConstraint.activate([
                priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 2)
            ])
            
        case .numberOfReviews :
            NSLayoutConstraint.activate([
                leftBracket.bottomAnchor.constraint(equalTo: bottomAnchor),
                leftBracket.leadingAnchor.constraint(equalTo: leadingAnchor),
                
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: leftBracket.trailingAnchor, constant: 1),
                
                rightBracket.bottomAnchor.constraint(equalTo: bottomAnchor),
                rightBracket.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 1)
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
            
            priceLabel.text = "$"
            priceLabel.font =  Resources.Fonts.MontserratSemiBold(with: 10)
            priceLabel.textColor = Resources.Colors.Default.defaultWhite
            
        case .latestPrice:
            label.font = Resources.Fonts.MontserratSemiBold(with: 7)
            label.textColor = Resources.Colors.Default.defaultWhite
            
            priceLabel.text = "$"
            priceLabel.font = Resources.Fonts.MontserratSemiBold(with: 7)
            priceLabel.textColor = Resources.Colors.Default.defaultWhite
        case .page2Price:
            label.font = Resources.Fonts.MontserratBold(with: 13)
            label.textColor = Resources.Colors.Default.defaultBlack
            
            priceLabel.text = "$"
            priceLabel.font = Resources.Fonts.MontserratBold(with: 13)
            priceLabel.textColor = Resources.Colors.Default.defaultBlack
            
        case .numberOfReviews:
            label.font = Resources.Fonts.MontserratSemiBold(with: 9)
            label.textColor = Resources.Colors.Default.defaultGray
            
            leftBracket.text = "("
            leftBracket.font = Resources.Fonts.MontserratSemiBold(with: 9)
            leftBracket.textColor = Resources.Colors.Default.defaultGray
            
            rightBracket.text = "reviews )"
            rightBracket.font = Resources.Fonts.MontserratSemiBold(with: 9)
            rightBracket.textColor = Resources.Colors.Default.defaultGray
        }
    }
}

