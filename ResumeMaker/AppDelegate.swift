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
        return true
    }


}

