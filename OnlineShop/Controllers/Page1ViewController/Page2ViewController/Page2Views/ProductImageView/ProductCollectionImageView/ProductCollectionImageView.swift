//
//  ProductCollectionImageView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 24.03.23.
//

import Foundation
import UIKit

final class ProductCollectionImageView :UICollectionView {
    
//MARK: - PROPERTIES

    var myImages = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    //MARK: - LIFECYCLE
    init() {
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.scrollDirection = .horizontal
            
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = Resources.Colors.Background.backgroundColor
        
        register(ProductCollectionImageViewCell.self, forCellWithReuseIdentifier: Resources.String.cell)
    }
}
