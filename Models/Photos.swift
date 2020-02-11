//
//  Photos.swift
//  ResumeMaker
//
//  Created by Saifur Rahman on 2/11/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation
import SQLite

class Photos {
    public var profile_photo: Blob
    public var signature: Blob
    public var resume_id: Int64
    
    init(profile_photo: Blob, signature: Blob, resume_id: Int64) {
        self.profile_photo = profile_photo
        self.signature = signature
        self.resume_id = resume_id
    }
}
