//
//  CoinTableViewCell.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 20.10.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identificator = "CustomCellTableView"
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return nameLabel
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return priceLabel
    }()
    
    private let changePriceLabel: UILabel = {
        let changePriceLabel = UILabel()
        changePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        changePriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return changePriceLabel
    }()
    
    public func configure(name: String, price: String, changePrice: String) {
        nameLabel.text = name
        priceLabel.text = price
        changePriceLabel.text = changePrice
        
        if Double(changePrice) ?? 0 > 0 {
            changePriceLabel.textColor = .green
            changePriceLabel.text = "+\(changePrice)"
        } else {
            changePriceLabel.textColor = .red
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        priceLabel.text = nil
        changePriceLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changePriceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.frame = CGRect(x: 20, y: 35, width: 80, height: 40)
        priceLabel.frame = CGRect(x: 100, y: 37, width: contentView.frame.size.width - 80, height: 20)
        changePriceLabel.frame = CGRect(x: 100, y: 57, width: contentView.frame.size.width - 80, height: 20)
    }

}
