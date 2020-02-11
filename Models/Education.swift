//
//  Education.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/11/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation

class Education {
    public var course: String
    public var institute: String
    public var passing_year: String
    public var result: String
    public var resume_id: Int64
    
    init(course: String, institute: String, passing_year: String, result: String, resume_id: Int64) {
        self.course = course
        self.institute = institute
        self.passing_year = passing_year
        self.result = result
        self.resume_id = resume_id
    }
}
