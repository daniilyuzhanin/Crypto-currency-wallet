//
//  SignInViewModel.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//
import UIKit
import Foundation

final class SignInViewModel: SignInProtocolIn, SignInProtocolOut {
    
    var getFlag: (Bool) -> Void = { _ in }
    
    func checkLogin(login: String, password: String) {
        Network.checkLogin(login: login, password: password) { [weak self] flag in
            self?.getFlag(flag)
        }
    }
    
}

