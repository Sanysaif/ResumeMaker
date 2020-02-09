//
//  UIViewController+Extensino.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

var vSpinner : UIView?
let ai = UIActivityIndicatorView.init(style: .whiteLarge)

extension UIViewController {
    public func showAlert(title: String, message: String, completionHandler:  (() -> Void)? ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { (action) in
            if let completionHandler = completionHandler {
                completionHandler()
            }
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 20.0/255.0, green: 22.0/255.0, blue: 31.0/255.0, alpha: 0.5)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            ai.stopAnimating()
            ai.removeFromSuperview()
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
