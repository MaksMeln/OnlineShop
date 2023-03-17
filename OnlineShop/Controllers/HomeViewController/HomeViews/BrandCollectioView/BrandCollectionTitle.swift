//
//  BrandCollectionTitle.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit

final class BrandsTitleView : OnlineShopBaseView{
//MARK: - PROPERTIES
    let brandsTitleLabel = UILabel(text: Resources.String.HomeController.brands,
                              font: Resources.Fonts.MontserratSemiBold(with: 15),
                              textColor: Resources.Colors.defaultBlack)
    
    let brandsTitleViewAllButton = OnlineShopButton(with: .viewAll)
}

//MARK: - LIFECYCLE
extension BrandsTitleView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(brandsTitleLabel)
        setupView(brandsTitleViewAllButton)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
        
            brandsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            brandsTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            brandsTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            brandsTitleViewAllButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            brandsTitleViewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor),
           
        ])
    }
}
