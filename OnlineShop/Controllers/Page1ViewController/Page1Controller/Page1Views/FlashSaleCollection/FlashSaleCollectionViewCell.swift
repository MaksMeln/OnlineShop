//
//  FlashSaleCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import Foundation
import UIKit

final class FlashSaleColectionViewCell : UICollectionViewCell {

//MARK: - PROPERTIES
    
    var flashSaleImage = UIImageView()
    
    var userIcon : UIImageView = {
        var imageView = UIImageView()
        imageView.image = Resources.Images.Page1Controller.flashSaleUserIcon
        return imageView
    }()
    
    var discountView : OSCollectionLabelView =  {
        var view = OSCollectionLabelView(with: .discount, text: "")
        view.label.text = ""
        return view
    }()
      
    var categoryView : OSCollectionLabelView =  {
        var view = OSCollectionLabelView(with: .nameCategotyFlashSale, text: "")
        view.label.text = ""
        return view
    }()
    
    var flashSaleNameLabel = OSLabel(textLabel: "",
                        font: Resources.Fonts.MontserratBold(with: 13),
                                     textColor: Resources.Colors.Default.defaultWhite)
    
    var priceView : OSCollectionLabelView =  {
        var view = OSCollectionLabelView(with: .flashSalePrice, text: "")
        view.label.text = ""
        return view
    }()
    
    private var likeButton : UIButton = {
        var button = UIButton()
        button.setImage(Resources.Images.Page1Controller.ButtonCollection.likeButton, for: .normal)
         return button
     }()

    private var addButton : UIButton = {
       var button = UIButton()
        button.setImage(Resources.Images.Page1Controller.ButtonCollection.addFlashSaleBtn, for: .normal)
        return button
    }()

//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        layer.cornerRadius = 11
        
        [flashSaleImage, userIcon,
         discountView, categoryView, priceView, flashSaleNameLabel, likeButton, addButton].forEach(setupView)
        
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - CONSTRAINTS
    func constraintViews() {
        NSLayoutConstraint.activate([
            flashSaleImage.topAnchor.constraint(equalTo: topAnchor),
            flashSaleImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            flashSaleImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            flashSaleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userIcon.topAnchor.constraint(equalTo: topAnchor, constant: 7.5),
            userIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.5),
            
            discountView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            discountView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 121),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            flashSaleNameLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 9),
            flashSaleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            flashSaleNameLabel.widthAnchor.constraint(equalToConstant: 92),
            flashSaleNameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            priceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16 ),
            priceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.5),
                        
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            
            likeButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -5),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
// MARK: - FUNC FROM CELL
    func setCellWithValuesOfFlashSale(_ flashSale : FlashSaleElement) {
        updateUI(name: flashSale.name, category: flashSale.category, price: flashSale.price, discount: flashSale.discount, image: flashSale.image_url)
    }
    
    private func updateUI(name: String?, category: String?, price: Double?, discount: Int?,  image: String?) {
        
        self.flashSaleNameLabel.text = name
        self.priceView.label.text = String(price!)
        self.categoryView.label.text = category
        self.discountView.label.text = String(discount!)
        
        guard let flashSaleString = image else { return }

        self.flashSaleImage.image = nil
        
        guard let latestImageURL = URL(string: flashSaleString) else {
            self.flashSaleImage.image = UIImage(named: "noImageAvailable")
            return
        }
        
        getImageDataFrom(url: latestImageURL)
    }

    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.flashSaleImage.clipsToBounds = true
                    self.flashSaleImage.contentMode = .scaleToFill
                    self.flashSaleImage.layer.cornerRadius = 11
                    self.flashSaleImage.image = image
                }
            }
        }.resume()
    }
}
