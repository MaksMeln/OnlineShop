//
//  ProductCollectionImageViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 24.03.23.
//

import Foundation
import UIKit

final class ProductCollectionImageViewCell : UICollectionViewCell {
    
//MARK: - PROPERTIES
    
    var productImageView = UIImageView()
        
//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(productImageView)
        productImageView.clipsToBounds = true
       
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

