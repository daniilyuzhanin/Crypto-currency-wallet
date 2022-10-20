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
        
        view.backgroundColor = UIColor(red: 132/255, green: 135/255, blue: 129/255, alpha: 1.0)
        listenViewModel()
        layoutVC()
    }
    
    func listenViewModel() {}
    
    func layoutVC() {}


}

