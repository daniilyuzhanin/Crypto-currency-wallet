//
//  HomeViewModel.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 13.10.2022.
//

import UIKit

final class HomeViewModel: HomeProtocolIn, HomeProtocolOut {
    var setText: (CryptoModel) -> Void = { _ in }
    
    func getData() {

        Network.getData { [weak self] result in
            switch result {
                case .success(let cryptoModel):
                    self?.setText(cryptoModel)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    
}
}
