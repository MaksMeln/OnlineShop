//
//  HomeTitleLabelView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class TitleView: OnlineShopBaseView {
    
    private let firstTitleLabel = OSLabel(textLabel: Resources.String.Page1Controller.NavBar.firstTitle,
                                          font: Resources.Fonts.MontserratBold(with: 20),
                                          textColor: Resources.Colors.Default.defaultBlack)
    
    private let secondTitleLabel = OSLabel(textLabel: Resources.String.Page1Controller.NavBar.secondTitle,
                                          font: Resources.Fonts.MontserratBold(with: 20),
                                           textColor: Resources.Colors.Background.backgroundButton)

    override func constraintViews() {
        super.constraintViews()
        
        let stackView = UIStackView(arrangedSubviews: [firstTitleLabel, secondTitleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 6
        self.setupView(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
