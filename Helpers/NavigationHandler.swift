//
//  NavigationHandler.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/8/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class NavigationHandler {

    enum StoryboardName: String {
        case main = "Main"
    }

    enum StoryboardID: String {
        case initialNavigationController = "sbInitialNavC"
        case splash = "sbSplash"
        case home = "sbHome"
    }
    
    public static func getInitialViewController() -> (UIViewController) {
        let storyBoard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: Bundle(for: self))
        let splashVC = storyBoard.instantiateViewController(withIdentifier: StoryboardID.splash.rawValue) as! SplashViewController
        return splashVC
    }
    
}


