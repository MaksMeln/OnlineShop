//
//  ColorCollectionView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation
import UIKit

final class ColorCollectionView :UICollectionView {
    
//MARK: - PROPERTIES
//    var categoryArray = [CategoryList]()
           
    //MARK: - LIFECYCLE
        init() {
            let categoryLayout = UICollectionViewFlowLayout()
            categoryLayout.scrollDirection = .horizontal
            categoryLayout.minimumLineSpacing = 15
        
            super.init(frame: .zero, collectionViewLayout: categoryLayout)
            
            configureAppearance()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
//        func set(category: [CategoryList]) {
//            self.categoryArray = category
//        }
        
        func configureAppearance() {
                
            translatesAutoresizingMaskIntoConstraints = false
            showsHorizontalScrollIndicator = false
            backgroundColor = Resources.Colors.Background.backgroundColor
//            contentInset = UIEdgeInsets(top: 0, left: CategoryConstants.distanceToView, bottom: 0, right: CategoryConstants.distanceToView)
            
            register(ColorsCollectionViewCell.self, forCellWithReuseIdentifier: Resources.String.cell)
            delegate = self
            dataSource = self
        }
    }


    //MARK: -UICollectionViewDataSource, UICollectionViewDelegate,
    extension ColorCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! ColorsCollectionViewCell
            
            cell.backgroundColor =  Resources.Colors.Default.defaultGray
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: 34,
                          height: frame.height)
        }
    }
