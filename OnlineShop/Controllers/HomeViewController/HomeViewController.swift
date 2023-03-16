//
//  HomeViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 13.03.23.
//
/*
 searchbar делать используя textfield
 
 */


import UIKit

final class HomeViewController : OnlineShopBaseViewController {
    
    private let navBar = HomeNavBarView()
    
    private let searchBar = OnlineShopTextField(with: .searchBar, placecholder: Resources.String.HomeController.searchBar)
    
    private let categoryCollection = CategoryCollectionView()
    
}


extension HomeViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(navBar)
        view.setupView(searchBar)
        view.setupView(categoryCollection)
    }
    
    override func constraintViews() {
        super.constraintViews()
       
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 11),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            categoryCollection.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30),
            categoryCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollection.heightAnchor.constraint(equalToConstant: 62),
            
           ])
    }
    
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
