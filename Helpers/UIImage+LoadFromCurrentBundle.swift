//
//  UIImage+LoadFromCurrentBundle.swift
//  GhostCall
//
//  Created by Saifur on 1/15/20.
//  Copyright © 2020 Kickback Apps. All rights reserved.
//

import UIKit

//MARK: - Load Image From Bundle UIImage extensions
struct WrappedBundleImage: _ExpressibleByImageLiteral {
    let image: UIImage?

    init(imageLiteralResourceName name: String) {
        let bundle = Bundle.main
        image = UIImage(named: name, in: bundle, compatibleWith: nil)
    }
}

extension UIImage {
    static func loadFromCurrentBundle(_ wrappedImage: WrappedBundleImage) -> UIImage? {
        return wrappedImage.image
    }
}
