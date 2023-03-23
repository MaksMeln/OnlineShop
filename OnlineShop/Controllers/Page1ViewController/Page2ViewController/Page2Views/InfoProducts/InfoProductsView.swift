//
//  InfoProductsView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import UIKit

final class InfoProductsView: OnlineShopBaseView {

//MARK: - PROPERTIES
     var productNameLabel = OSLabel(textLabel: "New balance Sneakers",
                                    font: Resources.Fonts.MontserratSemiBold(with: 17),
                                    textColor: Resources.Colors.Default.defaultBlack)
    
     var productDescriptionLabel = OSLabel(textLabel: "Feature waterproof, fire, air resistant shoes.all changed when the country of fire attacked",
                                           font: Resources.Fonts.MontserratMedium(with: 9),
                                           textColor: Resources.Colors.Default.defaultGray)
    
    private let starImage : UIImageView = {
       let starImage = UIImageView()
        starImage.image = Resources.Images.Page2Controller.starIcon
        return starImage
    }()
    
    var productRating = OSLabel(textLabel: "3.9",
                                font: Resources.Fonts.MontserratSemiBold(with: 9),
                                textColor: Resources.Colors.Default.defaultBlack)
    
    var productNumberOfReviews = OSLabel(textLabel: "( 4000 reviews )",
                                         font: Resources.Fonts.MontserratSemiBold(with: 9),
                                         textColor: Resources.Colors.Default.defaultGray)
    
    var priceLabel = OSLabel(textLabel: "$ 22,50",
                             font: Resources.Fonts.MontserratSemiBold(with: 14),
                             textColor: Resources.Colors.Default.defaultBlack)
}

//MARK: - LIFECYCLE
extension InfoProductsView {

    override func setupViews() {
        super.setupViews()
        setupView(productNameLabel)
        setupView(productDescriptionLabel)
        setupView(starImage)
        setupView(productRating)
        setupView(productNumberOfReviews)
        setupView(priceLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productNameLabel.widthAnchor.constraint(equalToConstant: 190),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 12),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            
            starImage.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 13),
            starImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            starImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            
            productRating.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            productRating.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 3),
            
            productNumberOfReviews.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            productNumberOfReviews.leadingAnchor.constraint(equalTo: productRating.trailingAnchor, constant: 3),
        
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
