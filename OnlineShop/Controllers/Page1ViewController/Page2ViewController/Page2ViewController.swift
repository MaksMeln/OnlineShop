//
//  Page2ViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 23.03.23.
//

import UIKit

final class Page2ViewController : OnlineShopBaseViewController {

//MARK: - PROPERTIES
    private let backButton : UIButton = {
        let button = UIButton()
        button.setImage(Resources.Images.Page2Controller.backButton, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var page2imageView : UIImageView = {
       var imageView = UIImageView()
        imageView.setDimensions(height: 279, width: 328)
        return imageView
    }()
    
    private let likeAndShareButton = LikeAndShareButtoView()
    
    private let collectionImageView = ProductImageView()
    
    private let productPage2Info = InfoProductsView()
    
    private let chooseColorView = ColorChooseView()
    
    private let quantityProductsView = QuantityProductsView()
    
  
}

//MARK: - LIFECYCLE
extension Page2ViewController {
    
    override func setupViews() {
        super.setupViews()
        
        page2imageView.image = ProductImageView().imageProduc.image
//        backButton.
        view.setupView(backButton)
        view.setupView(page2imageView)
        view.setupView(quantityProductsView)
        view.setupView(chooseColorView)
        view.setupView(productPage2Info)
        view.setupView(likeAndShareButton)
        view.setupView(collectionImageView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11),
            
            page2imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            page2imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            collectionImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            collectionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            collectionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            collectionImageView.heightAnchor.constraint(equalToConstant: 50),
            
            productPage2Info.topAnchor.constraint(equalTo: collectionImageView.bottomAnchor, constant: 28),
            productPage2Info.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            productPage2Info.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            chooseColorView.topAnchor.constraint(equalTo: productPage2Info.bottomAnchor, constant: 17),
            chooseColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            chooseColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            quantityProductsView.heightAnchor.constraint(equalToConstant: 172),
            quantityProductsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            quantityProductsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quantityProductsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            likeAndShareButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 226),
            likeAndShareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func backButtonTapped() {
//        let vc = Page1ViewController()
//        view.window?.rootViewController = vc
//        view.window?.makeKeyAndVisible()
        print("tap")
    }
    
}

