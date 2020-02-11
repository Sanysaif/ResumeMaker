//
//  AppDelegate.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/8/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainCordinator:MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let window = window {
            mainCordinator = MainCoordinator(window: window)
            mainCordinator?.start()
        }
        IQKeyboardManager.shared.enable = true
        self.createCopyOfDatabaseIfNeeded()
        return true
    }
// MARK: - Defined Functions

    func createCopyOfDatabaseIfNeeded() {
        // First, test for existence.
        var success: Bool
        let fileManager = FileManager.default
        var _: Error?
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let documentsDirectory = paths[0]
        var appDBPath = URL(fileURLWithPath: documentsDirectory).appendingPathComponent("resume.sqlite3").absoluteString
        appDBPath = appDBPath.replacingOccurrences(of: "file://", with: "")
        success = fileManager.fileExists(atPath: appDBPath)
        if success {
            return
        }
        // The writable database does not exist, so copy the default to the appropriate location.
        var defaultDBPath = URL(fileURLWithPath: Bundle.main.resourcePath ?? "").appendingPathComponent("resume.sqlite3").absoluteString
        defaultDBPath = defaultDBPath.replacingOccurrences(of: "file://", with: "")
        do {
            try fileManager.copyItem(atPath: defaultDBPath, toPath: appDBPath)
            success = true
        } catch {
            print(error)
        }
    }


}

