//
//  CreateResumeViewController.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit
import SQLite

class CreateResumeViewController: UIViewController {
    
    @IBOutlet weak var resumeTableView: UITableView!
    @IBOutlet weak var saveButton: UIButton!
    
    var selectedFieldIdForImage: String?
    let dbHelper = DBHelper()
    let parser = DBParser()
    
    var sections = [
        ResumeSection(sectionId: "0001", sectionTitle: "Photo & Signature", sectionLeftImage: "photo", sectionRightImage: "pen", expanded: true, fields: [ResumeField(id: "0001", type: .image, fieldTitle: "Upload Profile Photo(Tap on the Image)", textfieldValue: ""),
            ResumeField(id: "0002", type: .image, fieldTitle: "Upload Signature(Tap on the Image)", textfieldValue: "")]),
        ResumeSection(sectionId: "0002", sectionTitle: "Personal Info", sectionLeftImage: "profile", sectionRightImage: "pen", expanded: false, fields: [ResumeField(id: "0003", type: .text, fieldTitle: "Name", textfieldValue: ""),
            ResumeField(id: "0004", type: .text, fieldTitle: "Fathers Name", textfieldValue: ""),
            ResumeField(id: "0005", type: .text, fieldTitle: "Mothers Name", textfieldValue: ""),
            ResumeField(id: "0006", type: .text, fieldTitle: "Date of Birth", textfieldValue: "")]),
        ResumeSection(sectionId: "0003", sectionTitle: "Education", sectionLeftImage: "grad", sectionRightImage: "pen", expanded: false, fields: [ResumeField(id: "0007", type: .text, fieldTitle: "Course",  textfieldValue: ""),
            ResumeField(id: "0008", type: .text, fieldTitle: "Institute", textfieldValue: ""),
            ResumeField(id: "0009", type: .text, fieldTitle: "Passing Year", textfieldValue: ""),
            ResumeField(id: "0010", type: .text, fieldTitle: "CGPA/Percentage",  textfieldValue: "")]),
        ResumeSection(sectionId: "0004", sectionTitle: "Career Summary", sectionLeftImage: "briefcase", sectionRightImage: "pen", expanded: false, fields: [ResumeField(id: "0011", type: .text, fieldTitle: "Company Name", textfieldValue: ""),
            ResumeField(id: "0012", type: .text, fieldTitle: "Company Address", textfieldValue: ""),
            ResumeField(id: "0013", type: .text, fieldTitle: "Designation", textfieldValue: ""),
            ResumeField(id: "0014", type: .text, fieldTitle: "Starting time", textfieldValue: "")])]
    
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
        view.endEditing(true)
        let name = self.sections[1].fields[0].textfieldValue
        if name.count > 0 {
            let user = User(name: name)
            if let user_id = dbHelper.insertUser(user: user) {
                let resume = Resume(uid: user_id)
                if let resume_id = dbHelper.insertResume(resume: resume) {
                    // TO DO
                }
            } else {
                self.showAlert(title: "Error", message: "Could not insert user", completionHandler: nil)
            }
        } else {
            self.showAlert(title: "Empty name field", message: "You can't save a resume without a name", completionHandler: nil)
        }
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
            cell.topContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(expandCollapse(_:))))
            cell.delegate = self
            cell.sectionDelegate = self
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

extension CreateResumeViewController: UploadPhotoDelegate {
    func uploadPhotoSignal(fieldId: String) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            self.selectedFieldIdForImage = fieldId
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
}

extension CreateResumeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.selectedFieldIdForImage = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let id = self.selectedFieldIdForImage {
            for section in sections {
                for field in section.fields {
                    if field.id == id {
                        field.pickedImage = image
                        self.resumeTableView.reloadData()
                        self.dismiss(animated: true, completion: nil)
                        break
                    }
                }
            }
        } else{
            print("Something went wrong")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
extension CreateResumeViewController: SectionValueChangedProtocol {
    func sectionValueChanged(section: ResumeSection?) {
        if let sentSection = section {
            for idx in 0...self.sections.count - 1 {
                if self.sections[idx].sectionId == sentSection.sectionId {
                    self.sections[idx] = sentSection
                }
            }
        }
    }
}
