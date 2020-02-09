//
//  CreateResumeTableViewCell.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

protocol UploadPhotoDelegate {
    func uploadPhotoSignal(fieldId: String)
}

class CreateResumeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var resumeCollectionView: UICollectionView?
    private let xibName:String = "CreateResumeTableViewCell"
    var delegate: UploadPhotoDelegate?
    
    var section: ResumeSection? {
        didSet {
            guard let section = section else {
                return
            }
            leftImageView.image = UIImage(named: section.sectionLeftImage)
            rightImageView.image = UIImage(named: section.sectionRightImage)
            midLabel.text = section.sectionTitle
            if section.expanded {
                    let layout = UICollectionViewFlowLayout()
                    layout.scrollDirection = UICollectionView.ScrollDirection.vertical
                    resumeCollectionView = UICollectionView(frame: CGRect(x: 0, y: 90, width: self.frame.width, height: CGFloat(section.fields.count * 100)), collectionViewLayout: layout)
                    resumeCollectionView?.backgroundColor = .white
                    self.containerView.addSubview(resumeCollectionView!)
                    NSLayoutConstraint.activate([
                        resumeCollectionView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                        resumeCollectionView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                        resumeCollectionView!.topAnchor.constraint(equalTo: self.topContainerView.bottomAnchor)
                    ])
                    resumeCollectionView!.register(CreateResumeTextfieldWithLabelCollectionViewCell.self, forCellWithReuseIdentifier: "ridCreateResumeTextfieldWithLabel")
                    resumeCollectionView!.delegate = self
                    resumeCollectionView!.dataSource = self
                
            } else {
                    resumeCollectionView?.frame.size.height = 0
            }
            self.layoutIfNeeded()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        let bundle = Bundle(for: CreateResumeTableViewCell.self)
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
                midLabel.font = .bold17
            }
        }
    }
}

extension CreateResumeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let expanded = self.section?.expanded, expanded {
            return self.section?.fields.count ?? 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CreateResumeTextfieldWithLabelCollectionViewCell()
        if collectionView == self.resumeCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ridCreateResumeTextfieldWithLabel", for: indexPath) as! CreateResumeTextfieldWithLabelCollectionViewCell
            cell.field = self.section?.fields[indexPath.row]
            cell.uploadImageView.tag = indexPath.row + 1
            if let field = self.section?.fields[indexPath.row], field.type == .image {
                cell.uploadImageView.isUserInteractionEnabled = true
                cell.uploadImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(upload(_:))))
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @objc func upload(_ sender: UITapGestureRecognizer) {
        let view = sender.view
        if let tag = view?.tag, let fieldId = section?.fields[tag - 1].id{
            self.delegate?.uploadPhotoSignal(fieldId: fieldId)
        }
    }
}
