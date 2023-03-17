//
//  LatestCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import Foundation
import UIKit

final class LatestCollectionViewCell : UICollectionViewCell {

//MARK: - PROPERTIES
//    var latestImageView = UIImageView()
    
    var latestImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = Resources.Images.Page1Controller.latestImage
        return imageView
    }()
    
    var categoryNameLabel = "Games"
    
    var categoryView = OSNameCategoryView(with: .nameCategoryLatest)
    
    
    var latestNameLabel : UILabel = {
    let label = UILabel(text: "PlayStation 5 console",
                        font: Resources.Fonts.MontserratSemiBold(with: 9),
                        textColor: Resources.Colors.defaultWhite)
        label.numberOfLines = 0
    return label
    }()
        
    var priceLabel = UILabel(text: "$ 90,000",
                             font: Resources.Fonts.MontserratSemiBold(with: 7),
                             textColor: Resources.Colors.defaultWhite)
    
   private var addButton : UIButton = {
       var button = UIButton()
        button.setImage(Resources.Images.Page1Controller.addIcon, for: .normal)
        return button
    }()

//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 9
        
        setupView(latestImageView)
        
        setupView(categoryView)
        categoryView.label.text = categoryNameLabel
        
        setupView(latestNameLabel)
        setupView(priceLabel)
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
            
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 91),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            
            latestNameLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 4),
            latestNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            latestNameLabel.widthAnchor.constraint(equalToConstant: 75),
            latestNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            priceLabel.leadingAnchor.constraint(equalTo: latestNameLabel.leadingAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        
        ])
    }
}
