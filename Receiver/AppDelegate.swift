//
//  AppDelegate.swift
//  Duplicater
//
//  Created by zici on 5/5/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        printFilesInSandbox()
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

    func printFilesInSandbox() {
        // 获取沙盒的根目录的 URL
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Failed to get the documents directory")
            return
        }

        // 创建文件管理器
        let fileManager = FileManager.default

        // 创建一个目录枚举器
        guard let enumerator = fileManager.enumerator(at: documentsDirectory, includingPropertiesForKeys: nil) else {
            print("Failed to create enumerator")
            return
        }

        // 遍历所有文件和目录
        for case let fileURL as URL in enumerator {
            print(fileURL.path)
        }
    }
}

