//
//  ProductImageViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 23.03.23.
//

import Foundation
import UIKit

final class ProductImageViewCell : UICollectionViewCell {
    
//MARK: - PROPERTIES
    
    var productImageView = UIImageView()
    
        
//MARK: - LIFECYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(productImageView)
        productImageView.clipsToBounds = true
        productImageView.layer.cornerRadius = 6
        productImageView.layer.borderWidth = 1
        productImageView.layer.borderColor = Resources.Colors.OtherColors.borderCollectionProducr.cgColor

        
        constraintViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - CONSTRAINTVIEWS
    func constraintViews() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

// MARK: - FUNC FROM CELL
//    func setCellWithValuesOfLatest(_ latest:LatestItem) {
//        updateUI(image: latest.image_url)
//    }
//
//    private func updateUI(image: String?) {
//
//        guard let latestString = image else { return }
//
//        self.latestImageView.image = nil
//
//        guard let latestImageURL = URL(string: latestString) else {
//            self.latestImageView.image = UIImage(named: "noImageAvailable")
//            return
//        }
//
//        getImageDataFrom(url: latestImageURL)
//    }
//
//
//    private func getImageDataFrom(url: URL) {
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error != nil { return }
//
//            guard let data = data else { return }
//
//            DispatchQueue.main.async {
//                if let image = UIImage(data: data) {
//                    self.latestImageView.clipsToBounds = true
//                    self.latestImageView.layer.cornerRadius = 9
//                    self.latestImageView.image = image
//                }
//            }
//        }.resume()
//    }
}

