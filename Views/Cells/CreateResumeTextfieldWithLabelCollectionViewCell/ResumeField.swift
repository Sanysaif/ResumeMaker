//
//  ResumeFields.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation

class ResumeField {
    public let fieldTitle: String
    public let placeholder: String
    public let textfieldValue: String
    
    init(fieldTitle: String, placeholder: String, textfieldValue: String) {
        self.fieldTitle = fieldTitle
        self.placeholder = placeholder
        self.textfieldValue = textfieldValue
    }
}
