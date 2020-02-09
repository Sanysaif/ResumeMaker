//
//  CreateResumeTextfieldWithLabelCollectionViewCell.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class CreateResumeTextfieldWithLabelCollectionViewCell: UICollectionViewCell {
    
    private let xibName:String = "CreateResumeTextfieldWithLabelCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var uploadImageView: UIImageView!
    
    
    var field : ResumeField? {
        didSet {
            guard let field = field else {
                return
            }
            switch field.type {
            case .image:
                self.uploadImageView.isHidden = false
                self.textField.isHidden = true
                if let image = field.pickedImage {
                    self.uploadImageView.image = image
                }
            case .text:
                self.uploadImageView.isHidden = true
                self.textField.isHidden = false
                self.textField.placeholder = field.placeholder
                self.textField.text = field.textfieldValue
            }
            self.titleLabel.text = field.fieldTitle
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
        let bundle = Bundle(for: CreateResumeTextfieldWithLabelCollectionViewCell.self)
        let xibArray = bundle.loadNibNamed(xibName, owner: self, options: nil)
        if((xibArray) != nil){
            let xibView:UIView! = xibArray?[0] as? UIView
            if(xibView != nil){
                addSubview(xibView)
                xibView.frame = self.bounds
                xibView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
                xibView.backgroundColor = .white
                xibView.layer.cornerRadius = 8.0
                clipsToBounds = true
            }
        }
    }
}
