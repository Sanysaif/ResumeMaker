//
//  ImageHeadButton.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

protocol ImageHeadButtonDelegate {
    func addResumeTapped(sender: ImageHeadButton)
    func showAllTapped(sender: ImageHeadButton)
}

public enum ImageHeadType: String {
    case addResume = "Add Resume"
    case showAll = "Show All"
}

class ImageHeadButton: UIButton {

    
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var buttonTitleLabel: UILabel!
    @IBOutlet weak var imageHeadView: UIView!
    @IBOutlet weak var headImageView: UIImageView!
    
    let xibName:String = "ImageHeadButton"
    var delegate: ImageHeadButtonDelegate?
    
    var type: ImageHeadType? {
        didSet {
            guard let type = type else {
                return
            }
            switch type {
            case .addResume:
                headImageView.image = UIImage.loadFromCurrentBundle(#imageLiteral(resourceName: "resume"))
                buttonTitleLabel.text = type.rawValue
            case .showAll:
                headImageView.image = UIImage.loadFromCurrentBundle(#imageLiteral(resourceName: "paperplane"))
                buttonTitleLabel.text = type.rawValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let bundle = Bundle(for: ImageHeadButton.self)
        let xibArray = bundle.loadNibNamed(xibName, owner: self, options: nil)
        if((xibArray) != nil){
            let xibView:UIView! = xibArray?[0] as? UIView
            if(xibView != nil){
                addSubview(xibView)
                xibView.frame = self.bounds
                xibView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
                xibView.backgroundColor = .clear
                buttonContainerView.backgroundColor = .white
                buttonContainerView.layer.cornerRadius = 10.0
                buttonContainerView.clipsToBounds = true
                buttonContainerView.layer.borderColor = UIColor.blueish.cgColor
                buttonContainerView.layer.borderWidth = 3.0
                imageHeadView.layer.cornerRadius = imageHeadView.frame.height / 2
                imageHeadView.layer.borderWidth = 2.0
                imageHeadView.layer.borderColor = UIColor.blueish.cgColor
                imageHeadView.backgroundColor = .white
                imageHeadView.clipsToBounds = true
                imageHeadView.layoutSubviews()
                buttonTitleLabel.font = .bold17
                buttonTitleLabel.textColor = .blueish
                xibView.isUserInteractionEnabled = true
                buttonTitleLabel.isUserInteractionEnabled = true
                buttonContainerView.isUserInteractionEnabled = true
                imageHeadView.isUserInteractionEnabled = true
                headImageView.isUserInteractionEnabled = true
                self.isUserInteractionEnabled = true
                xibView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.buttonTapped)))
            }
        }
    }
    
    @objc func buttonTapped() {
        guard let type = type else {
            return
        }
        switch type {
        case .addResume:
            self.delegate?.addResumeTapped(sender: self)
        case .showAll:
            self.delegate?.showAllTapped(sender: self)
        }
    }
}
