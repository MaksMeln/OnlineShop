//
//  ColorCollectionView.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation
import UIKit

final class ColorCollectionView :UICollectionView {
    
    //MARK: - PROPERTIES
    private var page2Element : Page2?
    
    var colorsProducts = [String]()
    var backgroundColors = [UIColor]()
    var colors = [UIColor(hexString: "#ffffff"), UIColor(hexString: "#b5b5b5"), UIColor(hexString: "#000000"),]
    
    //MARK: - LIFECYCLE
    init() {
        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.scrollDirection = .horizontal
        categoryLayout.minimumLineSpacing = 15
        
        
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
        
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        backgroundColor = Resources.Colors.Background.backgroundColor
        
        
        register(ColorsCollectionViewCell.self, forCellWithReuseIdentifier: Resources.String.cell)
        delegate = self
        dataSource = self
        
        parseJSON()
    }
    
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
                let colors = self.page2Element?.colors
                let colorui = UIColor(hexString: "EBEBEB")
                //                print("colorui \(colorui)")
                
                for color in colors! {
                    let backgroundCOLOR = UIColor(hexString: color)
                    //                    print("backgroundcolor\(backgroundCOLOR)")
                    self.backgroundColors.append(backgroundCOLOR)
                    //                    print(self.backgroundColors)
                    
                }
                
                self.colorsProducts = colors!
                //                print(self.colorsProducts)
            }
        })
        task.resume()
    }
}


//MARK: -UICollectionViewDataSource, UICollectionViewDelegate,
extension ColorCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Resources.String.cell, for: indexPath) as! ColorsCollectionViewCell
        
        let color = colors[indexPath.row]
        
        cell.backgroundColor = color

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 34,
                      height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorsCollectionViewCell {
            cell.layer.borderColor = Resources.Colors.OtherColors.borderCollectionProducr.cgColor
            cell.layer.borderWidth = 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ColorsCollectionViewCell else { return }
        cell.layer.borderColor = .none
        cell.layer.borderWidth = 0
    }
}
