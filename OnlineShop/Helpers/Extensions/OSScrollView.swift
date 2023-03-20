//
//  OSScrollView+ ext.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 18.03.23.
//

import UIKit


final class OSScrollView : UIScrollView {
    
    init(frame: CGRect, contentSize: CGSize) {
        super.init(frame: .zero)
        
        self.backgroundColor = Resources.Colors.Background.backgroundColor
        self.frame = frame
        self.showsVerticalScrollIndicator = false
        self.contentSize = contentSize
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
