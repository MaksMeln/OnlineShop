//
//  Page1ViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//
/*
сделать логику на серчбар
 сделать ллогику на кнопки
 сделать логику на выбор категории
 подключить api
scrollview не прокручивается дальше safearea
 
 */

import UIKit

final class Page1ViewController : OnlineShopBaseViewController {

//MARK: - SCROLLVIEW
    private var contentCize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private lazy var scrollView = UIScrollView(frame: view.bounds,
                                               contentSize: contentCize)
    
    private lazy var contentView = UIView(contentSize: contentCize)
    
//MARK: - PROPERTIES
    
    private let navBar = HomeNavBarView()
    private let searchBar = OSTextField(with: .searchBar, placecholder: Resources.String.Page1Controller.searchBar)
    private let categoryCollection = CategoryCollectionView()
    
    private let latestTitle = LatestTitleView()
    private let latestCollectionView = LatestCollectionView()
    
    private let flashSaleTitle = FlashSaleTitleView()
    private let flashSaleCollectionView = FlashSaleCollectionView()
    
    private let brandsTitle = BrandsTitleView()
    private let brandsCollectionView = BrandsCollectionView()
}

//MARK: - LIFECYCLE
extension Page1ViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.setupView(navBar)
        contentView.setupView(searchBar)
        contentView.setupView(categoryCollection)
        
        contentView.setupView(latestTitle)
        contentView.setupView(latestCollectionView)
        
        contentView.setupView(flashSaleTitle)
        contentView.setupView(flashSaleCollectionView)
        
        contentView.setupView(brandsTitle)
        contentView.setupView(brandsCollectionView)
    }

//MARK: - CONSTRAINTVIEWS
    override func constraintViews() {
        super.constraintViews()
       
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: contentView.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 11),
            searchBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            categoryCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            categoryCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryCollection.heightAnchor.constraint(equalToConstant: 62),
            
            latestTitle.topAnchor.constraint(equalTo: categoryCollection.bottomAnchor, constant: 23),
            latestTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            latestTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            
            latestCollectionView.topAnchor.constraint(equalTo: latestTitle.bottomAnchor, constant: 5),
            latestCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            latestCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            latestCollectionView.heightAnchor.constraint(equalToConstant: 149),
            
            flashSaleTitle.topAnchor.constraint(equalTo: latestCollectionView.bottomAnchor, constant: 22),
            flashSaleTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            flashSaleTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),

            flashSaleCollectionView.topAnchor.constraint(equalTo: flashSaleTitle.bottomAnchor, constant: 5),
            flashSaleCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            flashSaleCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            flashSaleCollectionView.heightAnchor.constraint(equalToConstant: 221),

            brandsTitle.topAnchor.constraint(equalTo: flashSaleCollectionView.bottomAnchor, constant: 22),
            brandsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            brandsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),

            brandsCollectionView.topAnchor.constraint(equalTo: brandsTitle.bottomAnchor, constant: 5),
            brandsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            brandsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            brandsCollectionView.heightAnchor.constraint(equalToConstant: 149)
           ])
    }
    
//MARK: - CONFIGUREAPPEARENCE
    
    override func configureAppearence() {
        super.configureAppearence()
        
        navigationController?.navigationBar.isHidden = true
        
        navBar.navBarButtonAction(#selector(navBarButtonPress), with: self)
        navBar.locationButtonAction(#selector(locationButtonPress), with: self)
        
        categoryCollection.set(category: CategoryList.fetchData())
    }
    
    @objc func navBarButtonPress() {
        print("NavBarButton Press")
    }
    
    @objc func locationButtonPress() {
        print("LocationButton Press")
    }
}
