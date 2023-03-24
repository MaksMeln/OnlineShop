//
//  ChooseProductCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 23.03.23.
//

import Foundation
import UIKit

final class ProductPageControllerCollectonViewCell : UICollectionViewCell {
    
//MARK: - PROPERTIES
    
    var chooseProductImageView = UIImageView()
        
//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(chooseProductImageView)
        chooseProductImageView.clipsToBounds = true
        chooseProductImageView.layer.cornerRadius = 6
        chooseProductImageView.layer.borderWidth = 1
        chooseProductImageView.layer.borderColor = Resources.Colors.OtherColors.borderCollectionProducr.cgColor

        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        NSLayoutConstraint.activate([
            chooseProductImageView.topAnchor.constraint(equalTo: topAnchor),
            chooseProductImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            chooseProductImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chooseProductImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

