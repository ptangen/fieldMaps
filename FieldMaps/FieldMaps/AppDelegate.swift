//
//  AppDelegate.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let statusBarBackground = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 20))


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // set nav bar colors
        let navigationBarAppearance = UINavigationBar.appearance()
        let newformaOrange = UIColor(colorLiteralRed: 236/255, green: 152/255, blue: 35/255, alpha: 1.0)
        navigationBarAppearance.tintColor = newformaOrange
        navigationBarAppearance.barTintColor = newformaOrange
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        let allProjectsViewControllerInst = AllProjectsViewController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            let backgroundGray = UIColor(colorLiteralRed: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
            window.backgroundColor = backgroundGray
            let navigationController = UINavigationController(rootViewController: allProjectsViewControllerInst)
            navigationController.view.addSubview(statusBarBackground)
            navigationController.navigationBar.tintColor = UIColor.white
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

