//
//  AllResumesViewController.swift
//  ResumeMaker
//
//  Created by Saifur on 2/10/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

class AllResumesViewController: UIViewController {
    
    
    @IBOutlet weak var allResumesTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        allResumesTableView.delegate = self
        allResumesTableView.dataSource = self
    }
}

extension AllResumesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = AllResumesTableViewCell()
        if tableView == allResumesTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "ridAllResumes", for: indexPath) as! AllResumesTableViewCell
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
