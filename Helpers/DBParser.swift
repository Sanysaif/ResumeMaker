//
//  DBParser.swift
//  ResumeMaker
//
//  Created by Saifur on 2/10/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import UIKit
import SQLite

class DBParser {
    
    func parsePhoto(row: Row) -> PhotosRow {
        return PhotosRow(id: row[K.DB.table.photo.id], profile_photo: row[K.DB.table.photo.photo], signature: row[K.DB.table.photo.sign], resume_id: row[K.DB.table.photo.resume_id])
    }
    
    func parsePersonalInfo(row: Row) -> PersonalInfoRow {
       return PersonalInfoRow(id: row[K.DB.table.personal.id], name: row[K.DB.table.personal.name], fathers_name: row[K.DB.table.personal.fName], mothers_name: row[K.DB.table.personal.mName], dob: row[K.DB.table.personal.dob], resume_id: row[K.DB.table.personal.resume_id])
    }
    
    func parseCareerRow(row: Row) -> CareerRow {
        return CareerRow(id: row[K.DB.table.career.id], company_name: row[K.DB.table.career.cName], company_address: row[K.DB.table.career.address], designation: row[K.DB.table.career.des], starting_time: row[K.DB.table.career.start], resume_id: row[K.DB.table.career.resume_id])
    }
    
    func parseEducationRow(row: Row) -> EducationRow {
        return EducationRow(id: row[K.DB.table.edu.id], course: row[K.DB.table.edu.course], institute: row[K.DB.table.edu.institute], passing_year: row[K.DB.table.edu.passYear], result: row[K.DB.table.edu.result], resume_id: row[K.DB.table.edu.resume_id])
    }
}
