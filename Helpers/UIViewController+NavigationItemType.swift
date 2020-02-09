//
//  UIViewController+NavigationItemTypeHome.swift
//  GhostCall
//
//  Created by Saifur on 1/15/20.
//  Copyright © 2020 Kickback Apps. All rights reserved.
//

import UIKit

@objc protocol BarButtonItemAction: class {
    @objc func settingsPressed()
}

extension UIViewController {
    enum NavigationItemType: String {
        case home = "ResumeMaker"
    }
    
    fileprivate enum BarButtonType {
        case back
        case settings
    }
    
    fileprivate func getBarButton(type: BarButtonType, delegate: BarButtonItemAction?) -> (UIBarButtonItem){
        switch type {
        case .back:
            let customBackBarButton = UIBarButtonItem(image: UIImage.loadFromCurrentBundle(#imageLiteral(resourceName: "left-arrow")), style: .plain, target: navigationController, action: #selector(UINavigationController.popViewController(animated:)))
            customBackBarButton.imageInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
            return customBackBarButton
        case .settings:
            let settings = UIBarButtonItem(image: #imageLiteral(resourceName: "cog"), style: .plain, target: self, action: #selector(delegate?.settingsPressed))
            return settings
        }
    }
    
    func setNavigationItem(type: NavigationItemType, delegate: BarButtonItemAction?) {
        switch type {
        case .home:
            navigationItem.title = type.rawValue
            navigationItem.rightBarButtonItem = getBarButton(type: .settings, delegate: delegate)
            navigationItem.leftBarButtonItem = nil

        }
    }
}
