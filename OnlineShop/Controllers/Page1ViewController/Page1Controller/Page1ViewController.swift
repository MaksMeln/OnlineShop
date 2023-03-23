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
 */

import UIKit

final class Page1ViewController : OnlineShopBaseViewController {
    
    //MARK: - SCROLLVIEW
    private var contentCize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    private lazy var scrollView = OSScrollView(frame: view.bounds,
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
    
//MARK: - CONFIGUREAPPEARENCE + LOADFETCHDATA
    override func configureAppearence() {
        super.configureAppearence()
        
        navigationController?.navigationBar.isHidden = true
        
        navBar.navBarButtonAction(#selector(navBarButtonPress), with: self)
        navBar.locationButtonAction(#selector(locationButtonPress), with: self)
        
        categoryCollection.set(category: CategoryList.fetchData())
        loadFetchData()
    }

    
    private func loadFetchData() {
        latestCollectionView.latestModel.fetchLatestData { [weak self] in
            self?.latestCollectionView.delegate = self
            self?.latestCollectionView.dataSource = self
            self?.latestCollectionView.reloadData()
        }
        flashSaleCollectionView.flashSaleModel.fetchFlashSaleData { [weak self] in
            self?.flashSaleCollectionView.delegate = self
            self?.flashSaleCollectionView.dataSource = self
            self?.flashSaleCollectionView.reloadData()
        }
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
    }
    
//MARK: - BUTTONS TARGET
    @objc func navBarButtonPress() {
        print("NavBarButton Press")
    }
    
    @objc func locationButtonPress() {
        print("LocationButton Press")
    }
}

//MARK: - EXTENSION UICollectionViewDelegate, UICollectionViewDataSource
extension Page1ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.latestCollectionView {
            return  latestCollectionView.latestModel.numberOfRowsInSection(section: section)
            
        } else if  collectionView == self.flashSaleCollectionView {
            return flashSaleCollectionView.flashSaleModel.numberOfRowsInSection(section: section)
            
        } else if collectionView == self.brandsCollectionView {
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.latestCollectionView {
            let latestCell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! LatestCollectionViewCell
            
            let latest = latestCollectionView.latestModel.cellForRowAt(indexPath: indexPath)
            latestCell.setCellWithValuesOfLatest(latest)
            return latestCell
            
        } else if collectionView == self.flashSaleCollectionView  {
            let flashSaleCell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! FlashSaleColectionViewCell
            
            let flashSale = flashSaleCollectionView.flashSaleModel.cellForRowAt(indexPath: indexPath)
            flashSaleCell.setCellWithValuesOfFlashSale(flashSale)
            
            return flashSaleCell
            
        } else {
            let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! BrandsCollectionViewCell
            return brandCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = Page2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - EXTENSION UICollectionViewDelegateFlowLayout
extension Page1ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.latestCollectionView {
            return CGSize(width: 114,
                          height: latestCollectionView.frame.height)
            
        } else if collectionView == self.flashSaleCollectionView {
            return CGSize(width: 174,
                          height: flashSaleCollectionView.frame.height)
        } else {
            return CGSize(width: 114,
                          height: brandsCollectionView.frame.height)
        }
    }
}
