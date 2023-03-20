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
//    var categoryArray = [CategoryList]()
       
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
    
//    func set(category: [CategoryList]) {
//        self.categoryArray = category
//    }
    
    func configureAppearance() {
            
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = Resources.Colors.Background.backgroundColor
        contentInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 7)
        
        register(FlashSaleColectionViewCell.self, forCellWithReuseIdentifier: Resources.String.Page1Controller.categoryCollectionCell)
        delegate = self
        dataSource = self
    }
}


//MARK: -UICollectionViewDataSource, UICollectionViewDelegate,
extension FlashSaleCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categoryArray.count
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.Page1Controller.categoryCollectionCell, for: indexPath) as! FlashSaleColectionViewCell
        
//        cell.latestImageView.image =
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: 174,
                      height: frame.height)
    }
}








