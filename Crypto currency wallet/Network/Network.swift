//
//  Network.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import UIKit

final class Network {
    
    static func checkLogin(login: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            if login == "Admin@aston.com" && password == "Admin" {
                UserSettings.userName = login
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    static func getData(completion: @escaping (Result<CryptoModel, Error>) -> Void) {
        (UIApplication.shared.delegate as? AppDelegate)?.spinner?.makeKeyAndVisible()
        
        let urlPath = [
            "btc",
            "eth",
            "tron",
            "luna",
            "polkadot",
            "dogecoin",
            "tether",
            "stellar",
            "cardano",
            "xrp"
        ]
        
        let group = DispatchGroup()
        
        urlPath.map {
            guard let url = URL(string: "https://data.messari.io/api/v1/assets/\($0)/metrics") else {
                return
            }
                        
            group.enter()
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                defer {
                    group.leave()
                }
                guard let data = data else {return}
                
                do {
                    let tracks = try JSONDecoder().decode(CryptoModel.self, from: data)
                    completion(.success(tracks))
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
                
                
            })
            
            task.resume()
        }
        
        group.notify(queue: .main) {
            // update user interface
            (UIApplication.shared.delegate as? AppDelegate)?.window?.makeKeyAndVisible()
        }
    }
}
