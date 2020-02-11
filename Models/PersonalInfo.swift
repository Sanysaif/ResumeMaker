//
//  PersonalInfo.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/11/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation

class PersonalInfo {
    public var name: String
    public var fathers_name: String
    public var mothers_name: String
    public var dob: String
    public var resume_id: Int64
    
    init(name: String, fathers_name: String, mothers_name: String, dob: String, resume_id: Int64) {
        self.name = name
        self.fathers_name = fathers_name
        self.mothers_name = mothers_name
        self.dob = dob
        self.resume_id = resume_id
    }
}
