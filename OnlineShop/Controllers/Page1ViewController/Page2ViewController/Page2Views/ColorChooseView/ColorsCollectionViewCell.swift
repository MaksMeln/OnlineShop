//
//  ColorsCollectionViewCell.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation
import UIKit

final class ColorsCollectionViewCell : UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 9
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

