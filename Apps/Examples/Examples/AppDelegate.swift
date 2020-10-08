//
//  AppDelegate.swift
//  Examples
//
//  Created by Eidinger, Marco on 7/16/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import UIKit
import SwiftUI
import FioriSwiftUICore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        do {
//            let stylesheet = try JSONDecoder().decode(StyleSheet.self, from: jsonData)
            try StyleCache.upsertStyles(["h1": AnyViewModifier { $0.modifier(PurpleText())}])
            
            
        } catch {
            print(error)
        }
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

struct PurpleText: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.purple)
    }
}
