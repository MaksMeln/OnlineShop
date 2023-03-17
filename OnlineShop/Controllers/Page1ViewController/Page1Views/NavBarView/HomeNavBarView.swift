//
//  HomeNavBarView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 15.03.23.
//

import UIKit

final class HomeNavBarView : OnlineShopBaseView {
    
    //MARK: - PROPERTIES
    private let titleLabel = TitleView()
    
    private let navBarButton: UIButton = {
        let button = UIButton()
        button.setImage(Resources.Images.Page1Controller.navBarButton, for: .normal)
        return button
    }()
    
    private var profilePhoto : UIImageView = {
        var profileImage = UIImageView()
        profileImage.image = Resources.Images.Page1Controller.profileImageHome
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        
        return profileImage
    }()
    
    private let locationButton = OSButton(with: .location)
    
    
    func navBarButtonAction(_ action: Selector, with target: Any?) {
        navBarButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func locationButtonAction(_ action: Selector, with target: Any?) {
        locationButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

//MARK: - LIFECYCLE
extension HomeNavBarView {
    override func setupViews() {
        super.setupViews()
        
        setupView(titleLabel)
        setupView(navBarButton)
        setupView(profilePhoto)
        setupView(locationButton)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            navBarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            titleLabel.leadingAnchor.constraint(equalTo: navBarButton.trailingAnchor, constant: 65),
            titleLabel.centerYAnchor.constraint(equalTo: navBarButton.centerYAnchor),
            
            profilePhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            profilePhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44),
            
            locationButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 11),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
            locationButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
