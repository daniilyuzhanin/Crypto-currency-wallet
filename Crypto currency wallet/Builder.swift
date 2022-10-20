//
//  Builder.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import Foundation
import UIKit

final class Builder {
    static func buildSignIn() -> UIViewController {
        let view = SignInViewController()
        let VM = SignInViewModel()
        view.VM = VM
        return view
    }
    
    static func buildHome() -> UIViewController {
        let view = HomeViewController()
        let VM = HomeViewModel()
        view.VM = VM
        return view
    }
    
}
