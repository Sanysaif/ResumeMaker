//
//  ResumeSection.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation


class ResumeSection {
    public let sectionTitle: String
    public let sectionLeftImage: String
    public let sectionRightImage: String
    public var expanded: Bool
    public var fields: [ResumeField]
    
    init(sectionTitle: String, sectionLeftImage: String, sectionRightImage: String, expanded: Bool, fields: [ResumeField]) {
        self.sectionTitle = sectionTitle
        self.sectionLeftImage = sectionLeftImage
        self.sectionRightImage = sectionRightImage
        self.expanded = expanded
        self.fields = fields
    }
}
