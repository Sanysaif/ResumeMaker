//
//  CreateResumeViewController.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class CreateResumeViewController: UIViewController {
    
    @IBOutlet weak var resumeTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    
    let sections = [
        ResumeSection(sectionTitle: "Photo & Signature", sectionLeftImage: "photo", sectionRightImage: "pen", expanded: true, fields: [ResumeField(fieldTitle: "Profile Photo", placeholder: "Enter Profile Photo URL", textfieldValue: ""),
            ResumeField(fieldTitle: "Signature", placeholder: "Enter Signature URL", textfieldValue: "")]),
        ResumeSection(sectionTitle: "Personal Info", sectionLeftImage: "profile", sectionRightImage: "pen", expanded: true, fields: [ResumeField(fieldTitle: "Name", placeholder: "Enter Name", textfieldValue: ""),
            ResumeField(fieldTitle: "Fathers Name", placeholder: "Enter Fathers Name", textfieldValue: ""),
            ResumeField(fieldTitle: "Mothers Name", placeholder: "Enter Mothers Name", textfieldValue: ""),
            ResumeField(fieldTitle: "Date of Birth", placeholder: "dd/MM/yyyy", textfieldValue: "")]),
        ResumeSection(sectionTitle: "Education", sectionLeftImage: "grad", sectionRightImage: "pen", expanded: true, fields: [ResumeField(fieldTitle: "Course", placeholder: "Enter Course", textfieldValue: ""),
            ResumeField(fieldTitle: "Institute", placeholder: "Enter Institute", textfieldValue: ""),
            ResumeField(fieldTitle: "Passing Year", placeholder: "Enter Passing Year", textfieldValue: ""),
            ResumeField(fieldTitle: "CGPA/Percentage", placeholder: "Enter CGPA/Percentage", textfieldValue: "")]),
        ResumeSection(sectionTitle: "Career Summary", sectionLeftImage: "briefcase", sectionRightImage: "pen", expanded: true, fields: [ResumeField(fieldTitle: "Company Name", placeholder: "Enter Company Name", textfieldValue: ""),
            ResumeField(fieldTitle: "Company Address", placeholder: "Enter Company Address", textfieldValue: ""),
            ResumeField(fieldTitle: "Designation", placeholder: "Enter Designation", textfieldValue: ""),
            ResumeField(fieldTitle: "Starting time", placeholder: "Enter Starting time", textfieldValue: "")])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setNavigationItem(type: .createResume, delegate: self)
        
        saveButton.titleLabel?.textColor = .white
        saveButton.titleLabel?.font = .bold16
        
        resumeTableView.rowHeight = UITableView.automaticDimension
        resumeTableView.estimatedRowHeight = 90
        resumeTableView.allowsSelection = false
        resumeTableView.delegate = self
        resumeTableView.dataSource = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:))))
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
    }
    
}

extension CreateResumeViewController: BarButtonItemAction {
    func addPhotoPressed() {
        
    }
}

extension CreateResumeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = CreateResumeTableViewCell()
        if tableView == self.resumeTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "ridCreateResume", for: indexPath) as! CreateResumeTableViewCell
            cell.section = sections[indexPath.row]
            cell.topContainerView.tag = indexPath.row + 1
            cell.topContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(expandCollapse)))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.row].expanded {
            return 90.0 + CGFloat(sections[indexPath.row].fields.count * 100)
        } else {
            return 90.0
        }
    }
    
    @objc func expandCollapse(_ sender: UITapGestureRecognizer) {
        let view = sender.view
        if let tag = view?.tag {
            sections[tag - 1].expanded = !sections[tag - 1].expanded
            self.resumeTableView.reloadData()
        }
    }
    
}
