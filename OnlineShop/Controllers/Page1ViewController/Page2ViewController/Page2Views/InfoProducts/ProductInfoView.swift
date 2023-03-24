//
//  ProductInfoView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import UIKit

final class ProductInfoView: OnlineShopBaseView {

//MARK: - PROPERTIES    
     var productNameLabel = OSLabel(textLabel: "",
                                    font: Resources.Fonts.MontserratSemiBold(with: 17),
                                    textColor: Resources.Colors.Default.defaultBlack)
    
     var productDescriptionLabel = OSLabel(textLabel: "",
                                           font: Resources.Fonts.MontserratMedium(with: 9),
                                           textColor: Resources.Colors.Default.defaultGray)
    
    private let starImage : UIImageView = {
       let starImage = UIImageView()
        starImage.image = Resources.Images.Page2Controller.starIcon
        return starImage
    }()
    
    var productRating = OSLabel(textLabel: "",
                                font: Resources.Fonts.MontserratSemiBold(with: 9),
                                textColor: Resources.Colors.Default.defaultBlack)
    
    var productNumberOfReviewsView = OSCollectionLabelView(with: .numberOfReviews, text: "")
    
    var priceView = OSCollectionLabelView(with: .page2Price, text: "")
}

//MARK: - LIFECYCLE
extension ProductInfoView {

    override func setupViews() {
        super.setupViews()
        
        [productNameLabel, productDescriptionLabel, starImage, productRating, productNumberOfReviewsView, priceView].forEach((setupView))
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productNameLabel.widthAnchor.constraint(equalToConstant: 190),
            
            productDescriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 32),
            productDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            
            starImage.topAnchor.constraint(equalTo: productDescriptionLabel.bottomAnchor, constant: 13),
            starImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            starImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            productRating.centerYAnchor.constraint(equalTo: starImage.centerYAnchor),
            productRating.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 3),
            
            productNumberOfReviewsView.bottomAnchor.constraint(equalTo: starImage.bottomAnchor),
            productNumberOfReviewsView.leadingAnchor.constraint(equalTo: productRating.trailingAnchor, constant: 3),
        
            priceView.topAnchor.constraint(equalTo: productNameLabel.topAnchor),
            priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            priceView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}
