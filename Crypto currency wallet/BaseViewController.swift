//
//  ViewController.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 03.10.2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 242/255, green: 222/255, blue: 166/255, alpha: 0.5
        )
        listenViewModel()
        layoutVC()
    }
    
    func listenViewModel() {}
    
    func layoutVC() {}


}

