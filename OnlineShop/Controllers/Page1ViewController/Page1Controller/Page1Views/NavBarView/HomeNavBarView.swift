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
        button.setImage(Resources.Images.Page1Controller.NavBar.navBarButton, for: .normal)
        return button
    }()
    
    private var profilePage1Photo = OSRoundedImageView(with: .page1)
    
    private let locationButton = OSButton(with: .location)
    
}

//MARK: - LIFECYCLE
extension HomeNavBarView {
    override func setupViews() {
        super.setupViews()
        
        setupView(titleLabel)
        setupView(navBarButton)
        setupView(profilePage1Photo)
        setupView(locationButton)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            navBarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            titleLabel.leadingAnchor.constraint(equalTo: navBarButton.trailingAnchor, constant: 65),
            titleLabel.centerYAnchor.constraint(equalTo: navBarButton.centerYAnchor),
            
            profilePage1Photo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            profilePage1Photo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -44),
            
            locationButton.topAnchor.constraint(equalTo: profilePage1Photo.bottomAnchor, constant: 11),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -34),
            locationButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
//MARK: - BUTTONS ACTION
    func navBarButtonAction(_ action: Selector, with target: Any?) {
        navBarButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func locationButtonAction(_ action: Selector, with target: Any?) {
        locationButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
