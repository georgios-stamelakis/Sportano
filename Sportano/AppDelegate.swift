//
//  AppDelegate.swift
//  Sportano
//
//  Created by Georgios Stamelakis on 15/9/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Create the MyViewController
        let myViewController = MainViewController()

        // Create the UINavigationController with MyViewController as the root view controller
        let navigationController = UINavigationController(rootViewController: myViewController)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}
