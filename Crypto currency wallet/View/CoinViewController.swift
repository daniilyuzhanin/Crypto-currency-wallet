//
//  CoinViewController.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 18.10.2022.
//

import UIKit

class CoinViewController: BaseViewController {
    
    private var cryptoData: CryptoModelData?
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let symbol: UILabel = {
        let symbol = UILabel()
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        symbol.textColor = .gray
        return symbol
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return priceLabel
    }()
    
    private let priceChangeLabel: UILabel = {
        let priceChangeLabel = UILabel()
        priceChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceChangeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return priceChangeLabel
    }()
    
    init(cryptoData: CryptoModelData) {
        self.cryptoData = cryptoData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 181/255, green: 209/255, blue: 255/255, alpha: 1.0)
        
    }
    
    override func listenViewModel() {}
    
    override func layoutVC() {
        
        guard let cryptoName = cryptoData?.name,
              let cryptoPrice = cryptoData?.market_data.price_usd,
              let cryptoSymbol = cryptoData?.symbol,
              let cryptoPriceChange = cryptoData?.market_data.percent_change_usd_last_24_hours
        else { return }
        
        view.addSubview(label)
        label.text = cryptoName
        NSLayoutConstraint.activate([
                   label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               ])
        
        view.addSubview(symbol)
        symbol.text = cryptoSymbol
        NSLayoutConstraint.activate([
                    symbol.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    symbol.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
               ])
        
        view.addSubview(priceLabel)
        priceLabel.text = "\(cryptoPrice) USD"
        NSLayoutConstraint.activate([
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
               ])
        
        
        view.addSubview(priceChangeLabel)
        priceChangeLabel.text = "\(cryptoPriceChange) USD"
        
        if cryptoPriceChange > 0 {
            priceChangeLabel.textColor = UIColor(red: 7/255, green: 158/255, blue: 0/255, alpha: 1.0)
            priceChangeLabel.text = "+\(cryptoPriceChange) USD"
        } else {
            priceChangeLabel.textColor = .red
        }
        NSLayoutConstraint.activate([
            priceChangeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceChangeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
               ])
    }
    
}

