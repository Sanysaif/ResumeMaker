//
//  Constants.swift
//  ResumeMaker
//
//  Created by Saifur on 2/10/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit
import SQLite

struct K {
    struct DB {
        struct table {
            public enum name: String {
                case photo = "photos"
                case personal = "personal_info"
                case edu = "education"
                case career = "career"
                case users = "users"
                case resumes = "resumes"
            }
            struct photo {
                static let id = Expression<Int>("photos.photos_id")
                static let photo = Expression<Blob>("photos.profile_photo")
                static let sign = Expression<Blob>("photos.signature")
                static let resume_id = Expression<Int>("photos.resume_id")
            }
            struct personal {
                static let id = Expression<Int>("personal_info.personal_info_id")
                static let name = Expression<String>("personal_info.name")
                static let fName = Expression<String>("personal_info.fathers_name")
                static let mName = Expression<String>("personal_info.mothers_name")
                static let dob = Expression<String>("personal_info.dob")
                static let resume_id = Expression<Int>("personal_info.resume_id")
            }
            
            struct edu {
                static let id = Expression<Int>("education.education_id")
                static let course = Expression<String>("education.course")
                static let institute = Expression<String>("education.institute")
                static let passYear = Expression<String>("education.passing_year")
                static let result = Expression<String>("education.result")
                static let resume_id = Expression<Int>("education.resume_id")
            }
            
            struct career {
                static let id = Expression<Int>("career.career_id")
                static let cName = Expression<String>("career.company_name")
                static let address = Expression<String>("career.company_address")
                static let des = Expression<String>("career.designation")
                static let start = Expression<String>("career.starting_time")
                static let resume_id = Expression<Int>("career.resume_id")
            }
            
            struct resumes {
                static let id = Expression<Int>("resumes.id")
                static let user_id = Expression<Int>("resumes.user_id")
            }
            
            struct users {
                static let id = Expression<Int>("users.user_id")
                static let name = Expression<String>("users.name")
            }
        }
    }
}
