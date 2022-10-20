//
//  HomeProtocol.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 13.10.2022.
//

import Foundation

protocol HomeProtocolIn {
    func getData()
}

protocol HomeProtocolOut {
    var setText: (CryptoModel) -> Void { get set }
}
