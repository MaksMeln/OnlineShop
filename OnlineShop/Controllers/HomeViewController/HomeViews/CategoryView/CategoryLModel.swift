//
//  CategoryList.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 16.03.23.
//

import UIKit

struct CategoryList {
        
//MARK: - PROPERTIES
    var categoryIcon : UIImage
    var categoryTitle : String
    
   static func fetchData() -> [CategoryList] {
        var categoryList = [CategoryList]()
        categoryList = Resources.CategoryCollection.collectionArray
        
        return categoryList
    }
}

struct CategoryConstants {
    static let distanceToView: CGFloat = 15
    static let categoryminimumLineSpacing: CGFloat = 10
    static let categoryItemWidth = (UIScreen.main.bounds.width - (CategoryConstants.distanceToView * 2) - (CategoryConstants.categoryminimumLineSpacing / 6)) / 7
}

