//
//  HomeViewController.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.color = .black
        spinner.style = .large
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Sign In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    override func layoutVC() {
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home VIEW DID LOAD")
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true

        view.backgroundColor = .red
    }
    
    @objc
    private func tapButton() {
        UserSettings.userName = nil
        let loginVC = SignInBuilder.build()
        
        self.navigationController?.pushViewController(loginVC, animated: true)

    }


}
