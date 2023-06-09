//
//  BrandCollectionTitle.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit

final class BrandsTitleView : OnlineShopBaseView{
//MARK: - PROPERTIES
    let brandsTitleLabel = OSLabel(textLabel: Resources.String.Page1Controller.brands,
                              font: Resources.Fonts.MontserratSemiBold(with: 15),
                                   textColor: Resources.Colors.Default.defaultBlack)
    
    let brandsTitleViewAllButton = OSButton(with: .viewAll)
}

//MARK: - LIFECYCLE
extension BrandsTitleView {
    
    override func setupViews() {
        super.setupViews()
        [brandsTitleLabel, brandsTitleViewAllButton].forEach(setupView)
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
