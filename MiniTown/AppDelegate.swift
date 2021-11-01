//
//  AppDelegate.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/15.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate  {
    
    
    func application(
        _ app: UIApplication,
        open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        var handled: Bool
        
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        
        // Handle other custom URL types.
        
        // If not handled by this app, return false.
        return false
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            SocketIOManager.sharedInstance.establishConnection()
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if error != nil || user == nil {
                    print("user : \(String(describing: user))")
                    // Show the app's signed-out state.
                } else {
                    print(user!)
                    // Show the app's signed-in state.
                }
            }
            func applicationDidBecomeActive(_ application: UIApplication) {
                SocketIOManager.shared.establishConnection()
            }
            func applicationDidEnterBackground(_ application: UIApplication) {
                SocketIOManager.shared.closeConnection()
            }
            return true
        }
        // Override point for customization after application launch.
        //        UINavigationBar.appearance().tintColor = UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)
        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 0.286, green: 0.576, blue: 0.98, alpha: 1)]
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

