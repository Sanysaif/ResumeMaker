//
//  SplashViewController.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/8/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    weak var coordinator: MainCoordinator?

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.coordinator?.startHome()
        }
        
    }
    
}
