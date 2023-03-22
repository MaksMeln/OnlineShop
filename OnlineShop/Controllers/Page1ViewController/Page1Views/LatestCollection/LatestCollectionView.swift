//
//  LatestCollectionView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import Foundation
import UIKit

final class LatestCollectionView: UICollectionView {
//MARK: - PROPERTIES
    
    private var latestModel = LatestViewModel()
    
//MARK: - LIFECYCLE
    init() {
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.scrollDirection = .horizontal
        categoryLayout.minimumLineSpacing = 12
    
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        
        configureAppearance()
        loadLatestData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
            
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = Resources.Colors.Background.backgroundColor
        contentInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
        
        register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: Resources.String.Page1Controller.categoryCollectionCell)
    }
    
    private func loadLatestData() {
        latestModel.fetchLatestData { [weak self] in
            self?.dataSource = self
            self?.reloadData()
            self?.delegate = self
        }
    }
}


//MARK: -UICollectionViewDataSource, UICollectionViewDelegate,
extension LatestCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestModel.numberOfRowsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.Page1Controller.categoryCollectionCell, for: indexPath) as! LatestCollectionViewCell

        let latest = latestModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOfLatest(latest)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114,
                      height: frame.height)
    }
    
}
