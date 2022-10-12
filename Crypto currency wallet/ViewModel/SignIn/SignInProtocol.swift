//
//  SignInProtocol.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import Foundation

protocol SignInProtocolIn {
    func checkLogin(login: String, password: String)
}

protocol SignInProtocolOut {
    var getFlag: (Bool) -> Void { get set }
}

