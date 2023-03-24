//
//  Page2ViewController.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 23.03.23.
//

import UIKit

final class Page2ViewController : OnlineShopBaseViewController {
    
    //MARK: - PROPERTIES
    
    var page2Element : Page2?
    
    private let backButton : UIButton = {
        let button = UIButton()
        button.setImage(Resources.Images.Page2Controller.backButton, for: .normal)
        return button
    }()
    
    private var productCollectionImageView = ProductCollectionImageView()
    
    private let likeAndShareButton = LikeAndShareButtoView()
    
    private let productPageControllerCollectonView = ProductPageControllerCollectonView()
    
    private let productInfoView = ProductInfoView()
    
    private let chooseColorView = ColorChooseView()
    
    private let quantityProductsView = QuantityProductsView()
    
    private var counter : Double = 0
}

//MARK: - LIFECYCLE
extension Page2ViewController {
    
    override func setupViews() {
        super.setupViews()
        
        [backButton, productCollectionImageView, quantityProductsView, chooseColorView, productInfoView, likeAndShareButton, productPageControllerCollectonView ].forEach(view.setupView)
    }
    
    //MARK: - CONSTRAINTVIEWS + CONFIGUREAPPEARANCE
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11),
            
            productCollectionImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            productCollectionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productCollectionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -53),
            productCollectionImageView.heightAnchor.constraint(equalToConstant: 280),
            
            productPageControllerCollectonView.topAnchor.constraint(equalTo: productCollectionImageView.bottomAnchor, constant: 35),
            productPageControllerCollectonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            productPageControllerCollectonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            productPageControllerCollectonView.heightAnchor.constraint(equalToConstant: 50),
            
            productInfoView.topAnchor.constraint(equalTo: productPageControllerCollectonView.bottomAnchor, constant: 28),
            productInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            productInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            chooseColorView.topAnchor.constraint(equalTo: productInfoView.bottomAnchor, constant: 17),
            chooseColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            chooseColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            chooseColorView.heightAnchor.constraint(equalToConstant: 50),
            
            quantityProductsView.topAnchor.constraint(equalTo: chooseColorView.bottomAnchor, constant: 21),
            quantityProductsView.heightAnchor.constraint(equalToConstant: 172),
            quantityProductsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quantityProductsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            likeAndShareButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 226),
            likeAndShareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        navigationController?.navigationBar.isHidden = true
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        quantityProductsView.minusQuantityButtonTapped(#selector(minusButtonTapped), with: self)
        quantityProductsView.plusQuantityButtonTapped(#selector(plusButtonTapped), with: self)
        
        parseJSON()
        setDelegate()
    }
    
    func setDelegate() {
        productCollectionImageView.delegate = self
        productCollectionImageView.dataSource = self
        
        productPageControllerCollectonView.delegate = self
        productPageControllerCollectonView.dataSource = self
    }
    
    //MARK: - BUTTONS TARGET
    @objc func backButtonTapped() {
        print("tap")
    }
    
    @objc func minusButtonTapped() {
        let value = Double(productInfoView.priceView.label.text!)!
        if counter != value {
            counter -= value
            quantityProductsView.addCartButton.balance.text = String(counter)
        } else {
            quantityProductsView.addCartButton.balance.text = String(value)
        }
    }
    
    @objc func plusButtonTapped() {
        counter += Double(productInfoView.priceView.label.text!)!
        quantityProductsView.addCartButton.balance.text = String(counter)
    }
    
    
    //MARK: - PARSEJSON
    func parseJSON() {
        
        let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239")
        
        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            
            (data, response, error) in
            guard let data = data, error == nil else {
                
                return
            }
            var cList : Page2?
            do {
                cList = try JSONDecoder().decode(Page2.self, from: data)
            }
            catch {
                print("error json decoder")
            }
            self.page2Element = cList
            DispatchQueue.main.async {
                let price = self.page2Element?.price
                let rating = self.page2Element?.rating
                let numberOfReviews = self.page2Element?.number_of_reviews
                
                self.productInfoView.productNameLabel.text = self.page2Element?.name
                self.productInfoView.productDescriptionLabel.text = self.page2Element?.description
                self.productInfoView.productRating.text = String(rating!)
                self.productInfoView.productNumberOfReviewsView.label.text = String(numberOfReviews!)
                self.productInfoView.priceView.label.text = String(price!)
                self.quantityProductsView.addCartButton.balance.text = String(Double(price!))
            }
        })
        task.resume()
    }
}


//MARK: - EXTENSION UICollectionViewDelegate, UICollectionViewDataSource
extension Page2ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.productCollectionImageView {
            return 3
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.productCollectionImageView  {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! ProductCollectionImageViewCell
            let image = self.productPageControllerCollectonView.myImages[indexPath.row]
            
            cell.productImageView.image = image
            
            return cell
            
        } else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! ProductPageControllerCollectonViewCell
            
            let image = self.productPageControllerCollectonView.myImages[indexPath.row]
            cell.chooseProductImageView.image = image
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

//MARK: - EXTENSION UICollectionViewDelegateFlowLayout
extension Page2ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.productCollectionImageView {
            return CGSize(width: 328, height: 279)
        } else {
            return CGSize(width: 65, height: 38)
        }
    }
}
