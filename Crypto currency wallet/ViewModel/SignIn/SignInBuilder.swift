//
//  Builder.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 10.10.2022.
//

import Foundation
import UIKit

final class SignInBuilder {
    static func build() -> UIViewController {
        let view = SignInViewController()
        let VM = SignInViewModel()
        view.VM = VM
        
        return view
    }
    
}
