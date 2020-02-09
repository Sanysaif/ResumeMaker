//
//  MainCoordinator.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 08/02/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    private let window: UIWindow
    private var rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.isNavigationBarHidden = true
        let splash = NavigationHandler.getSplash()
        splash.coordinator = self
        rootViewController.pushViewController(splash, animated: true)
    }
    
    func startHome() {
        window.rootViewController = NavigationHandler.getHome()
    }
    
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
