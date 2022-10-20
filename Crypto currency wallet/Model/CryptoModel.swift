//
//  CryptoModel.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 13.10.2022.
//

import Foundation

struct CryptoModel: Codable {
    var data: CryptoModelData
    
}

struct CryptoModelData: Codable {
    var symbol: String?
    var name: String?
    var market_data: CryptoModelMarket
    
}

struct CryptoModelMarket: Codable {
    var price_usd: Double
    var percent_change_usd_last_24_hours: Double
}

