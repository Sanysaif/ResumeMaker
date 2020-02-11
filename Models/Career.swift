//
//  Career.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/11/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation

class Career {
    public var company_name: String
    public var company_address: String
    public var designation: String
    public var starting_time: String
    public var resume_id: Int64
    
    init(company_name: String, company_address: String, designation: String, starting_time: String, resume_id: Int64) {
        self.company_name = company_name
        self.company_address = company_address
        self.designation = designation
        self.starting_time = starting_time
        self.resume_id = resume_id
    }
}
