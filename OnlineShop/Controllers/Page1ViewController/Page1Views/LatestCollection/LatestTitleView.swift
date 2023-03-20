//
//  LatestTitleView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit

final class LatestTitleView : OnlineShopBaseView{
//MARK: - PROPERTIES
    let latestTitleLabel = OSLabel(textLabel: Resources.String.Page1Controller.latest,
                              font: Resources.Fonts.MontserratSemiBold(with: 15),
                                   textColor: Resources.Colors.Default.defaultBlack)
    
    let latestTitleViewAllButton = OSButton(with: .viewAll)
}

//MARK: - LIFECYCLE
extension LatestTitleView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(latestTitleLabel)
        setupView(latestTitleViewAllButton)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
        
            latestTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            latestTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            latestTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            latestTitleViewAllButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            latestTitleViewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

