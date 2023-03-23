//
//  FlashSaleCollectionView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import Foundation
import UIKit

final class FlashSaleCollectionView: UICollectionView {
//MARK: - PROPERTIES
    var flashSaleModel = FlashSaleViewModel()
       
//MARK: - LIFECYCLE
    init() {
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.scrollDirection = .horizontal
        categoryLayout.minimumLineSpacing = 9
        
    
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
        contentInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 7)
        
        register(FlashSaleColectionViewCell.self, forCellWithReuseIdentifier: Resources.String.cell)
    }
}
