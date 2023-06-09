//
//  FlashSaleTitleView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit

final class FlashSaleTitleView : OnlineShopBaseView{

//MARK: - PROPERTIES
    let flashSaleTitleLabel = OSLabel(textLabel: Resources.String.Page1Controller.flashSale,
                              font: Resources.Fonts.MontserratSemiBold(with: 15),
                                      textColor: Resources.Colors.Default.defaultBlack)
    
    let flashSaleTitleViewAllButton = OSButton(with: .viewAll)
}

//MARK: - LIFECYCLE
extension FlashSaleTitleView {
    
    override func setupViews() {
        super.setupViews()
        [flashSaleTitleLabel, flashSaleTitleViewAllButton].forEach(setupView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
        
            flashSaleTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            flashSaleTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            flashSaleTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            flashSaleTitleViewAllButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            flashSaleTitleViewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

