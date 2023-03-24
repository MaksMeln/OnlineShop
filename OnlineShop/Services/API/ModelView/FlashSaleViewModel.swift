//
//  FlashSaleViewModel.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation

final class FlashSaleViewModel {
    
    private var apiService = FlashSaleAPIService()
    private var flashSaleList = [FlashSaleElement]()
    
    func fetchFlashSaleData(completion: @escaping () -> ()) {
    
        apiService.getFlashSaleData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.flashSaleList = listOf.flash_sale
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if flashSaleList.count != 0 {
            return flashSaleList.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> FlashSaleElement {
        return flashSaleList[indexPath.row]
    }
}


