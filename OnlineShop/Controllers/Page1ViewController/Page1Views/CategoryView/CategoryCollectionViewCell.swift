//
//  CategoryCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 16.03.23.
//

import Foundation
import UIKit

final class CategoryCollectionViewCell : UICollectionViewCell {

    var categoryImageView = UIImageView()

    var categoryTitle =  OSLabel(textLabel: "",
                                 font: Resources.Fonts.MontserratSemiBold(with: 8),
                                 textColor: Resources.Colors.OtherColors.cateoryTitle)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(categoryImageView)
        setupView(categoryTitle)
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constraintViews() {
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: topAnchor),
            categoryImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            categoryTitle.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 14),
            categoryTitle.centerXAnchor.constraint(equalTo: categoryImageView.centerXAnchor),
        ])
    }
}
