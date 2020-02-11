//
//  Resume.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/11/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation
import SQLite

class Resume {
    public let id: Int
    public let user_id: Int
    public var personal_info: PersonalInfoRow
    public var photos: PhotosRow
    public var education: EducationRow
    public var career: CareerRow
    
    
    init(id: Int, user_id: Int, personal_info: PersonalInfoRow, photos: PhotosRow, career: CareerRow, education: EducationRow) {
        self.id = id
        self.user_id = user_id
        self.personal_info = personal_info
        self.photos = photos
        self.career = career
        self.education = education
    }
}
