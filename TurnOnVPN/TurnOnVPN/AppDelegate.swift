
//
//  AppDelegate.swift
//  TurnOnVPN
//
//  Created by Jeff on 30/11/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
                
//        if let splitViewController = window?.rootViewController as? UISplitViewController {
//            splitViewController.preferredDisplayMode = .allVisible
//        }
        
        ThemeManager.sharedManager.activateTheme()
        
        return true
    }
    
//    func splitViewController(
//        _ splitViewController: UISplitViewController,
//        collapseSecondary secondaryViewController:UIViewController,
//        onto primaryViewController:UIViewController
//        ) -> Bool {
//        if let secondaryAsNavController = secondaryViewController
//            as? UINavigationController {
//            if let _ = secondaryAsNavController.topViewController {
//                // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//                return true
//            }
//        }
//        return false
//    }

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

