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
//    private let homeNavController: HomeNavController
//    private let networkManager = NetworkManager()
//    fileprivate var currentUser:CurrentUser?
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
//        homeNavController = Home.getHomeNavController()
//
//        rootViewController.pushViewController(Auth.getInitialViewController(), animated: true)
//        Auth.delegate = self
        rootViewController.isNavigationBarHidden = true
    }
    
    func setupStart() {
        rootViewController = UINavigationController()
//        rootViewController.pushViewController(Auth.getInitialViewController(), animated: true)
//        Auth.delegate = self
        rootViewController.isNavigationBarHidden = true
    }
    
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
