//
//  FlashSaleAPIService.swift
//  OnlineShop
//
//  Created by Максим Мельничук on 22.03.23.
//

import Foundation

final class FlashSaleAPIService {
    
    private var dataTask: URLSessionDataTask?
    
    func getFlashSaleData(completion: @escaping (Result<FlashSale, Error>) -> Void) {
        
        let flashSaleURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        
        guard let url = URL(string: flashSaleURL) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FlashSale.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
