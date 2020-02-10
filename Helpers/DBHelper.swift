//
//  DBHelper.swift
//  ResumeMaker
//
//  Created by Saifur on 2/10/20.
//  Copyright © 2020 Saifur Rahman. All rights reserved.
//

import Foundation
import SQLite

class DBHelper {
    init() {
        openDatabase()
//        createTable()
    }

    var db: Connection!
    let parser = DBParser()
    let photoTable = Table(K.DB.table.name.photo.rawValue)
    let personalInfoTable = Table(K.DB.table.name.personal.rawValue)
    let educationTable = Table(K.DB.table.name.edu.rawValue)
    let careerTable = Table(K.DB.table.name.career.rawValue)
    let usersTable = Table(K.DB.table.name.users.rawValue)
    let resumesTable = Table(K.DB.table.name.resumes.rawValue)

    func openDatabase() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("resume").appendingPathExtension("sqlite")
            let database = try Connection(fileURL.path)
            self.db = database
        } catch {
            print(error)
        }
    }
    
    func getData() {
        do {
            let personalInfo = try self.db.prepare(self.personalInfoTable)
            for row in personalInfo {
                print("personalInfo id : \(row[K.DB.table.personal.id])")
            }
        } catch {
            print(error)
        }
    }
    
    func getResumes() {
        do {
            let resumes = try self.db.prepare(self.resumesTable)
            parser.parseResumes(rows: resumes)
            
        } catch {
            
        }
    }
    
//    func insert(tableName: String, )

}
