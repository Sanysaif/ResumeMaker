//
//  HomeViewController.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var resumeButton: ImageHeadButton!
    
    @IBOutlet weak var showAllButton: ImageHeadButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        setNavigationItem(type: .home, delegate: self)
        
        resumeButton.type = .addResume
        resumeButton.delegate = self
        showAllButton.type = .showAll
        showAllButton.delegate = self
    }
    
}

extension HomeViewController: ImageHeadButtonDelegate {
    func addResumeTapped(sender: ImageHeadButton) {
        
    }
    
    func showAllTapped(sender: ImageHeadButton) {
        
    }
}

extension HomeViewController: BarButtonItemAction {
    func settingsPressed() {
//        NavigationHandlerHome.pushMenuVC(navigationController: navigationController, delegate: self, selectedMenu: .call)
    }
}
