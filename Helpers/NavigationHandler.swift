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
        case createResume = "sbCreateResume"
        case allResumes = "sbAllResumes"
        case yourResume = "sbYourResume"
    }
    
    public static func getSplash() -> (SplashViewController) {
        let storyBoard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: Bundle(for: self))
        let splashVC = storyBoard.instantiateViewController(withIdentifier: StoryboardID.splash.rawValue) as! SplashViewController
        return splashVC
    }
    
    public static func getHome() -> BaseNavigationController {
        let storyBoard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: Bundle(for: self))
        let initialNav = storyBoard.instantiateViewController(withIdentifier: StoryboardID.initialNavigationController.rawValue) as! BaseNavigationController
        let homeVC = storyBoard.instantiateViewController(withIdentifier: StoryboardID.home.rawValue) as! HomeViewController
        initialNav.pushViewController(homeVC, animated: false)
        return initialNav
    }
    
    
    public static func pushCreateResume(navigationController: UINavigationController?) {
        let storyBoard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: Bundle(for: self))
        let createVC = storyBoard.instantiateViewController(withIdentifier: StoryboardID.createResume.rawValue) as! CreateResumeViewController
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    public static func pushAllResumes(navigationController: UINavigationController?) {
        let storyBoard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: Bundle(for: self))
        let createVC = storyBoard.instantiateViewController(withIdentifier: StoryboardID.allResumes.rawValue) as! AllResumesViewController
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    public static func pushYourResumes(navigationController: UINavigationController?) {
        let storyBoard = UIStoryboard(name: StoryboardName.main.rawValue, bundle: Bundle(for: self))
        let yourResumeVC = storyBoard.instantiateViewController(withIdentifier: StoryboardID.yourResume.rawValue) as! YourResumeViewController
        navigationController?.pushViewController(yourResumeVC, animated: true)
    }
    
}


