//
//  ColorChooseView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import UIKit

final class ColorChooseView: OnlineShopBaseView {

//MARK: - PROPERTIES
    private let colorLabel = OSLabel(textLabel: Resources.String.Page2Controller.color,
                                        font: Resources.Fonts.MontserratBold(with: 10),
                                        textColor: Resources.Colors.OtherColors.colorLabel)
    
     let colorCollectionView = ColorCollectionView()
    
}

//MARK: - LIFECYCLE
extension ColorChooseView {
    
    override func setupViews() {
        super.setupViews()
        
        [colorLabel, colorCollectionView].forEach((setupView))
    }
    
    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
           
            colorLabel.topAnchor.constraint(equalTo: topAnchor),
            colorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            colorCollectionView.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 12),
            colorCollectionView.heightAnchor.constraint(equalToConstant: 26),
            colorCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
