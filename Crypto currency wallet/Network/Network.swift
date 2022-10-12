//
//  Network.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import Foundation

final class Network {
    
    static func checkLogin(login: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            if login == "1" && password == "1" {
                UserSettings.userName = login
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
