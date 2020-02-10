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
                case photo = "Photo & Signature"
                case personal = "Personal Info"
                case edu = "Education"
                case career = "Career Summary"
                case users = "users"
                case resumes = "resumes"
            }
            struct photo {
                static let id = Expression<Int>("id")
                static let photo = Expression<Blob>("Upload Profile Photo(Tap on the Image)")
                static let sign = Expression<Blob>("Upload Signature(Tap on the Image)")
            }
            struct personal {
                static let id = Expression<Int>("id")
                static let name = Expression<String>("Name")
                static let fName = Expression<String>("Fathers Name")
                static let mName = Expression<String>("Mothers Name")
                static let dob = Expression<String>("Date of Birth")
            }
            
            struct edu {
                static let id = Expression<Int>("id")
                static let course = Expression<String>("Course")
                static let institute = Expression<String>("Institute")
                static let passYear = Expression<String>("Passing Year")
                static let cgpa = Expression<String>("CGPA/Percentage")
            }
            
            struct career {
                static let id = Expression<Int>("id")
                static let cName = Expression<String>("Company Name")
                static let address = Expression<String>("Company Address")
                static let des = Expression<String>("Designation")
                static let start = Expression<String>("Starting time")
            }
            
            struct users {
                static let id = Expression<Int>("id")
                static let name = Expression<String>("name")
            }
            
            struct resumes {
                static let id = Expression<Int>("id")
                static let uid = Expression<Int>("user_id")
            }
        }
    }
}
