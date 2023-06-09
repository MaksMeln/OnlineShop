//
//  String + ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 21.03.23.
//

import Foundation

extension String {
    
    enum ValidTypes {
        case name
        case email
        case password
    }
    
    enum Regex: String {
        case name =  "[А-Яа-яA-Za-z]{1,}"
        case email = "[a-zA-Z0-9._]+@[a-zA-Z0-9]+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }
    
    func isValid(validType : ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .name:
            regex = Regex.name.rawValue
        case .email :
            regex = Regex.email.rawValue
        case .password :
            regex = Regex.password.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
