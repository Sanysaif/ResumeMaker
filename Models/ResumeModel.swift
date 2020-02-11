//
//  Resume.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/11/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation
import SQLite

class ResumeModel {
    public let id: Int64
    public let user_id: Int64
    public var personal_info: PersonalInfoRow
    public var photos: PhotosRow
    public var education: EducationRow
    public var career: CareerRow
    
    
    init(id: Int64, user_id: Int64, personal_info: PersonalInfoRow, photos: PhotosRow, career: CareerRow, education: EducationRow) {
        self.id = id
        self.user_id = user_id
        self.personal_info = personal_info
        self.photos = photos
        self.career = career
        self.education = education
    }
}
