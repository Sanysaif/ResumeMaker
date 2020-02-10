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
            resumes.append(Resume(id: row[K.DB.table.resumes.id], user_id: row[K.DB.table.resumes.uid]))
        }
        return resumes
    }
}
