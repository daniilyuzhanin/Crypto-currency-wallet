//
//  HomeViewController.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import UIKit

class HomeViewController: BaseViewController  {
    
    var VM: (HomeProtocolIn & HomeProtocolOut)?
    var arr = [CryptoModel]()
    var flag = false
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeTableViewCell.self,
                           forCellReuseIdentifier: HomeTableViewCell.identificator)
        return tableView
    }()
    
    override func layoutVC() {
        
        VM?.getData()
        guard var VM = VM else { return }
        
        VM.setData = { [weak self] result in

            self?.arr.append(result)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        
        createNavBar()
        
        let rightButton = createButton(imageName: "arrow.right.to.line.compact", selector: #selector(tapButton))
        let leftButton = createButton(imageName: "arrow.up.and.down", selector: #selector(sortButton))
        
        let customTitleView = createTitleView()
        
        navigationItem.rightBarButtonItems = [rightButton, leftButton]
        navigationItem.titleView = customTitleView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    
    @objc
    private func tapButton() {
        UserSettings.userName = nil
        let loginVC = Builder.buildSignIn()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc
    private func sortButton() {

        if flag {
            arr.sort { $0.data.market_data.price_usd ?? 0 < $1.data.market_data.price_usd ?? 0 }
            flag = false
        } else {
            arr.sort { $0.data.market_data.price_usd ?? 0 > $1.data.market_data.price_usd ?? 0 }
            flag = true
        }
        tableView.reloadData()
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identificator,
                                                 for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell() }
        
        cell.configure(
            name: arr[indexPath.row].data.symbol ?? "",
            price: "\(arr[indexPath.row].data.market_data.price_usd ?? 0)$",
            changePrice: "\(arr[indexPath.row].data.market_data.percent_change_usd_last_24_hours ?? 0)$")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let category = arr[indexPath.row].data
        let vc = CoinViewController(cryptoData: category)
        guard let cryptoName = category.name,
              let cryptoSymbol = category.symbol
        else { return }
        
        vc.title = "\(cryptoName)(\(cryptoSymbol))"
        
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController {
    
    func createNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 143/255, green: 165/255, blue: 201/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

    }
    
    func createTitleView() -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let navLabel = UILabel()
        navLabel.text = "Wallet"
        navLabel.frame = CGRect(x: 120, y: 10, width: 220, height: 20)
        navLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(navLabel)
        
        return view
    }
    
    func createButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(
            UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate),
            for: .normal)
        button.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
    
}
