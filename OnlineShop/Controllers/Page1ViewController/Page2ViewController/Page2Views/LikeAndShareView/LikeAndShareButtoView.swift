//
//  LikeAndShareButtoView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation
import UIKit

final class LikeAndShareButtoView: OnlineShopBaseView {

//MARK: - PROPERTIES
    
    let likeButton : UIButton = {
       let button = UIButton()
        button.setImage(Resources.Images.Page2Controller.likePage2Icon, for: .normal)
        button.setDimensions(height: 13, width: 15)
        return button
    }()
    
    let shareButton : UIButton = {
       let button = UIButton()
        button.setImage(Resources.Images.Page2Controller.shareIcon, for: .normal)
        button.setDimensions(height: 16, width: 13)
        return button
    }()
    
    let lineImage : UIImageView = {
       let lineImage = UIImageView()
        lineImage.image = Resources.Images.Page2Controller.line
        lineImage.setDimensions(height: 1, width: 11)
        return lineImage
    }()
    
}

//MARK: - LIFECYCLE
extension LikeAndShareButtoView {
    
    override func setupViews() {
        super.setupViews()
        
        likeButton.makeSystem(likeButton)
        shareButton.makeSystem(shareButton)
        
        [likeButton, shareButton, lineImage].forEach(setupView)
    }
    
    override func constraintViews() {
        super.constraintViews()
    
        NSLayoutConstraint.activate([
  
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            likeButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            lineImage.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 16),
            lineImage.centerXAnchor.constraint(equalTo: centerXAnchor),

            shareButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            shareButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = 14
        backgroundColor = Resources.Colors.Background.likeAndShareBackground
        setDimensions(height: 95, width: 42)
    }
    
//MARK: - BUTTONS TARGET
    func likeButtonAction(_ action: Selector, with target: Any?) {
        likeButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func shareButtonAction(_ action: Selector, with target: Any?) {
        shareButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
