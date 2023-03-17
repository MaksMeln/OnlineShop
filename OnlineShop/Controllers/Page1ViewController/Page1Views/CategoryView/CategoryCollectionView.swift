//
//  CategoryCollectionView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 16.03.23.
//

import Foundation
import UIKit

class CategoryCollectionView: UICollectionView {
//MARK: - PROPERTIES
    var categoryArray = [CategoryList]()
       
//MARK: - LIFECYCLE
    init() {
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.scrollDirection = .horizontal
        categoryLayout.minimumLineSpacing = 10
    
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        
        configureAppearance()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(category: [CategoryList]) {
        self.categoryArray = category
    }
    
    func configureAppearance() {
            
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = Resources.Colors.backgroundColor
        contentInset = UIEdgeInsets(top: 0, left: CategoryConstants.distanceToView, bottom: 0, right: CategoryConstants.distanceToView)
        
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Resources.String.Page1Controller.categoryCollectionCell)
        delegate = self
        dataSource = self
    }
}


//MARK: -UICollectionViewDataSource, UICollectionViewDelegate,
extension CategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.Page1Controller.categoryCollectionCell, for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryImageView.image = categoryArray[indexPath.row].categoryIcon
        cell.categoryTitle.text = categoryArray[indexPath.row].categoryTitle
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: CategoryConstants.categoryItemWidth,
                      height: frame.height)
    }
}
