//
//  QuantityProductsView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import UIKit

final class QuantityProductsView: OnlineShopBaseView {
    //MARK: - PROPERTIES
    
    private let quantityLabel = OSLabel(textLabel: Resources.String.Page2Controller.quantity,
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
    
    var addCartButton = OSButton(with: .addToCart)
    
}

//MARK: - SETUPVIEW
extension QuantityProductsView {
    override func setupViews() {
        super.setupViews()
        
        [quantityLabel, addCartButton].forEach(setupView)
    }
    
    //MARK: - CONSTRAINTVIEWS + CONFIGURE
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
    
    //MARK: - BUTTONS TARGET
    func minusQuantityButtonTapped(_ action: Selector, with target: Any?) {
        minusQuantityButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func plusQuantityButtonTapped(_ action: Selector, with target: Any?) {
        plusQuantityButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
