//
//  BrandCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit
import Foundation

final class BrandsCollectionViewCell : UICollectionViewCell {
//MARK: - PROPERTIES
    var brandsImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.image = Resources.Images.HomeController.latestImage
        return imageView
    }()
//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 9
        
        setupView(brandsImageView)
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func constraintViews() {
        NSLayoutConstraint.activate([
            brandsImageView.topAnchor.constraint(equalTo: topAnchor),
            brandsImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            brandsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            brandsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

