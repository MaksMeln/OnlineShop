//
//  FlashSaleCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import Foundation
import UIKit

final class FlashSaleColectionViewCell : UICollectionViewCell {

//MARK: - PROPERTIES
//    var latestImageView = UIImageView()
    
    var latestImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "FlashSaleImage")
        return imageView
    }()
    
    var userIcon : UIImageView = {
        var imageView = UIImageView()
        imageView.image = Resources.Images.Page1Controller.flashSaleUserIcon
        return imageView
    }()
    
    var discountLabel = "30"
    
    var discountView = OSNameCategoryView(with: .discount)
    
    var categoryNameLabel = "Kids"
    
    var categoryView = OSNameCategoryView(with: .nameCategotyFlashSale)
    
    
    var latestNameLabel : UILabel = {
    let label = UILabel(text: "New balance sneakers",
                        font: Resources.Fonts.MontserratBold(with: 13),
                        textColor: Resources.Colors.defaultWhite)
        label.numberOfLines = 0
    return label
    }()
    
    var dollarLabel = UILabel(text: "$",
                              font: Resources.Fonts.MontserratSemiBold(with: 10),
                              textColor: Resources.Colors.defaultWhite)
        
    var priceLabel = UILabel(text: "33,00",
                             font: Resources.Fonts.MontserratSemiBold(with: 10),
                             textColor: Resources.Colors.defaultWhite)
    
    private var likeButton : UIButton = {
        var button = UIButton()
         button.setImage(Resources.Images.Page1Controller.likeIcon, for: .normal)
         return button
     }()

    private var addButton : UIButton = {
       var button = UIButton()
        button.setImage(Resources.Images.Page1Controller.addIconFlashSale, for: .normal)
        return button
    }()

//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        layer.cornerRadius = 9
        
        setupView(latestImageView)
        setupView(userIcon)
        
        setupView(discountView)
        discountView.label.text = discountLabel
        
        setupView(categoryView)
        categoryView.label.text = categoryNameLabel
        
        setupView(latestNameLabel)
        setupView(dollarLabel)
        setupView(priceLabel)
        setupView(likeButton)
        setupView(addButton)
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constraintViews() {
        NSLayoutConstraint.activate([
            latestImageView.topAnchor.constraint(equalTo: topAnchor),
            latestImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            latestImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            latestImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userIcon.topAnchor.constraint(equalTo: topAnchor, constant: 7.5),
            userIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.5),
            
            discountView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            discountView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 121),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            latestNameLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 9),
            latestNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            latestNameLabel.widthAnchor.constraint(equalToConstant: 92),
            latestNameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            dollarLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16 ),
            dollarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.5),
            
            priceLabel.bottomAnchor.constraint(equalTo: dollarLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: dollarLabel.trailingAnchor, constant: 2),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            
            likeButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -5),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

        ])
    }
}
