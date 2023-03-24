//
//  LatestModel.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 21.03.23.
//

import Foundation
import UIKit

// MARK: - Latest
struct Latest : Codable {
    let latest : [LatestItem]
}

struct LatestItem : Codable{
    let category: String
    let name: String
    let price: Int
    let image_url: String
}


// MARK: - FlashSale
struct FlashSale: Codable {
    let flash_sale: [FlashSaleElement]
}

struct FlashSaleElement: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int
    let image_url: String
}

// MARK: - Product
struct Page2 : Codable {
    let name: String
    let description: String
    let rating: Double
    let number_of_reviews: Int
    let price: Int
    let colors: [String]
    let image_urls: [String]
}


