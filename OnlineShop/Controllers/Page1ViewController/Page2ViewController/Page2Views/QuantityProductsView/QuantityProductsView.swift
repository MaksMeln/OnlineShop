//
//  QuantityProductsView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import UIKit

final class QuantityProductsView: OnlineShopBaseView {
//MARK: - PROPERTIES
    private let quantityLabel = OSLabel(textLabel: "Quantity:",
                                        font: Resources.Fonts.MontserratSemiBold(with: 9),
                                        textColor: Resources.Colors.Default.defaultGray)
    
    let minusQuantityButton : OSButton = {
        let button = OSButton(with: .quantity)
        button.setIcon(Resources.Images.Page2Controller.minusIcon)
        return button
    }()
    
    let plusQuantityButton : OSButton = {
        let button = OSButton(with: .quantity)
        button.setIcon(Resources.Images.Page2Controller.plusIcon)
        return button
    }()
    
    var addCartButton : OSButton = {
        let button = OSButton(with: .addToCart)
        button.setTitle("#2,500")
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        setupView(quantityLabel)
        setupView(addCartButton)
    }
    
    
//MARK: - CONSTRAINTVIEWS
    override func constraintViews() {
        super.constraintViews()
        
        let buttonStackView = UIStackView(arrangedSubviews: [minusQuantityButton, plusQuantityButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 24
        setupView(buttonStackView)
        
        NSLayoutConstraint.activate([
        quantityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
        quantityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
        
        buttonStackView.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 11),
        buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 21),
         
        addCartButton.topAnchor.constraint(equalTo: topAnchor, constant: 19),
        addCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    
        layer.cornerRadius = 27
        backgroundColor = Resources.Colors.Background.quantityBackground
    }
}
