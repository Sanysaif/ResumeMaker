//
//  PhotoSignature.swift
//  ResumeMaker
//
//  Created by Saifur on 2/10/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation
import SQLite

class PhotosRow {
    public var id: Int
    public var profile_photo: Blob
    public var signature: Blob
    public var resume_id: Int
    
    init(id: Int, profile_photo: Blob, signature: Blob, resume_id: Int) {
        self.id = id
        self.profile_photo = profile_photo
        self.signature = signature
        self.resume_id = resume_id
    }
}
