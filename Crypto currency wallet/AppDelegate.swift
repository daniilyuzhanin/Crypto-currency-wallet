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
    var spinner: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        spinner = UIWindow(frame: UIScreen.main.bounds)
        spinner?.rootViewController = SpinnerViewController()
        window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.rootViewController = UserSettings.userName != nil ? UINavigationController(rootViewController: Builder.buildHome()) : UINavigationController(rootViewController: Builder.buildSignIn())
        window?.makeKeyAndVisible()
        
        return true
    }
    
    


}



