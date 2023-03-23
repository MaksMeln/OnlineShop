//
//  OSLabel.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//

import UIKit

final class OSLabel : UILabel {
    
    init(textLabel: String, font: UIFont? , textColor: UIColor?) {
        super.init(frame: .zero)
        
        self.text = textLabel
        self.font = font
        self.textColor = textColor
        self.numberOfLines = 0
    
        
        
        
        func addCharacterSpacing(kernValue: Double = 3) {
            if let labelText = text, labelText.isEmpty == false {
                let attributedString = NSMutableAttributedString(string: labelText)
                attributedString.addAttribute(.kern,
                                              value: kernValue,
                                              range: NSRange(location: 0, length: attributedString.length - 1))
                attributedText = attributedString
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
