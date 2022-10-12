//
//  AppDelegate.swift
//  Crypto currency wallet
//
//  Created by Daniil Yuzhanin on 03.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if UserSettings.userName != nil {
            self.window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        } else {
            self.window?.rootViewController = UINavigationController(rootViewController: SignInBuilder.build())
        }
//        window?.rootViewController = Builder.build()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    


}



