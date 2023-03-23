//
//  LatestCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import Foundation
import UIKit

final class LatestCollectionViewCell : UICollectionViewCell {
    
//MARK: - PROPERTIES
    
    var latestImageView = UIImageView()
    
    var categoryView = OSCollectionLabelView(with: .nameCategoryLatest, text: "")
   
    var latestNameLabel = OSLabel(textLabel: "",
                                  font: Resources.Fonts.MontserratSemiBold(with: 9),
                                  textColor: Resources.Colors.Default.defaultWhite)
        
    var priceView = OSCollectionLabelView(with: .latestPrice, text: "")
    
    private var addButton : UIButton = {
        var button = UIButton()
        button.setImage(Resources.Images.Page1Controller.ButtonCollection.addLatestBtn, for: .normal)
        return button
    }()
    
    
//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 9
        
        setupView(latestImageView)
        setupView(categoryView)
        
        setupView(latestNameLabel)
        setupView(priceView)
        setupView(addButton)
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        NSLayoutConstraint.activate([
            latestImageView.topAnchor.constraint(equalTo: topAnchor),
            latestImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            latestImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            latestImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 91),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            
            latestNameLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 4),
            latestNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
//            latestNameLabel.widthAnchor.constraint(equalToConstant: 75),
//            latestNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            priceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            priceView.leadingAnchor.constraint(equalTo: latestNameLabel.leadingAnchor),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
        ])
    }

// MARK: - FUNC FROM CELL
    func setCellWithValuesOfLatest(_ latest:LatestItem) {
        updateUI(name: latest.name, category: latest.category, price: latest.price, image: latest.image_url)
    }
    
    private func updateUI(name: String?, category: String?, price: Int?, image: String?) {
        
        self.latestNameLabel.text = name
        self.priceView.label.text = String(price!)
        self.categoryView.label.text = category
        
        guard let latestString = image else { return }

        self.latestImageView.image = nil
        
        guard let latestImageURL = URL(string: latestString) else {
            self.latestImageView.image = UIImage(named: "noImageAvailable")
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
                    self.latestImageView.clipsToBounds = true
                    self.latestImageView.layer.cornerRadius = 9
                    self.latestImageView.image = image
                }
            }
        }.resume()
    }
}
