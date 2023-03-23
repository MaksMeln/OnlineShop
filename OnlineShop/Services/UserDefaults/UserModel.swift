//
//  UserModel.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 21.03.23.
//

import Foundation


struct User: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
