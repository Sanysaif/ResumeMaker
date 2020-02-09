//
//  ResumeFields.swift
//  ResumeMaker
//
//  Created by Saifur on 2/9/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit

public enum ResumeFieldType {
    case text
    case image
}

class ResumeField {
    public var id: String
    public var fieldTitle: String
    public var placeholder: String
    public var textfieldValue: String
    public var pickedImage: UIImage?
    public var type: ResumeFieldType
    
    init(id: String, type: ResumeFieldType, fieldTitle: String, placeholder: String, textfieldValue: String) {
        self.id = id
        self.type = type
        self.fieldTitle = fieldTitle
        self.placeholder = placeholder
        self.textfieldValue = textfieldValue
    }
}
