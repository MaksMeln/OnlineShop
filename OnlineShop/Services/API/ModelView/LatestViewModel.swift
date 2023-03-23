//
//  LatestViewModel.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 21.03.23.
//

import Foundation

final class LatestViewModel {
    
    private var apiService = LatestAPIService()
    private var latestList = [LatestItem]()
    
    func fetchLatestData(completion: @escaping () -> ()) {
    
        apiService.getPopularMoviesData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.latestList = listOf.latest
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if latestList.count != 0 {
            return latestList.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> LatestItem {
        return latestList[indexPath.row]
    }
}

