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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UILabel{
    func setTextSpacingBy(value: Double) {
      if let textString = self.text {
        let attributedString = NSMutableAttributedString(string: textString)
          attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText = attributedString
      }
    }
}
