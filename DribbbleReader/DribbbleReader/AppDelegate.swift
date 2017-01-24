//
//  AppDelegate.swift
//  DribbbleReader
//
//  Created by Jeff on 21/12/2016.
//  Copyright © 2016 Jeff. All rights reserved.
//

import UIKit
import XCGLogger

let log: XCGLogger? = {
    #if DEBUG
        let log = XCGLogger.default
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        dateFormatter.locale = Locale.current
        log.dateFormatter = dateFormatter

        if let consoleDestination: ConsoleDestination = log.destination(withIdentifier: XCGLogger.Constants.baseConsoleDestinationIdentifier) as? ConsoleDestination {
            let xcodeColorsLogFormatter: XcodeColorsLogFormatter = XcodeColorsLogFormatter()
            xcodeColorsLogFormatter.colorize(level: .verbose, with: .lightGrey)
            xcodeColorsLogFormatter.colorize(level: .debug, with: .cyan)
            xcodeColorsLogFormatter.colorize(level: .info, with: .purple)
            xcodeColorsLogFormatter.colorize(level: .warning, with: .orange)
            xcodeColorsLogFormatter.colorize(level: .error, with: .red)
            xcodeColorsLogFormatter.colorize(level: .severe, with: .white, on: .red)
            consoleDestination.formatters = [xcodeColorsLogFormatter]
        }

        log.setup(level: .verbose, showThreadName: true, showLevel: false, showFileNames: true, showLineNumbers: true)

        return log
    #else
        return nil
    #endif
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        do {
            try R.validate()
        } catch {
            log?.debug(error)
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

