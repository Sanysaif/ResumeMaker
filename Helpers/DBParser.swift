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
    func parseResumes(rows: AnySequence<Row>) -> [Resume]{
        var resumes = [Resume]()
        for row in rows {
            resumes.append(Resume(id: row[K.DB.table.resumes.id]))
        }
        return resumes
    }
    
    func parsePhotos(rows: AnySequence<Row>) -> [PhotoSignature]{
        var photos = [PhotoSignature]()
        for row in rows {
            photos.append(PhotoSignature(id: row[K.DB.table.photo.id], profile_photo: row[K.DB.table.photo.photo], signature: row[K.DB.table.photo.sign], resume_id: row[K.DB.table.photo.resume_id]))
        }
        return photos
    }
    
    
    
}
