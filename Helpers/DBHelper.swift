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
    let dbName = "resume"
    let photoTable = Table(K.DB.table.name.photo.rawValue)
    let personalInfoTable = Table(K.DB.table.name.personal.rawValue)
    let educationTable = Table(K.DB.table.name.edu.rawValue)
    let careerTable = Table(K.DB.table.name.career.rawValue)
    let usersTable = Table(K.DB.table.name.users.rawValue)
    let resumesTable = Table(K.DB.table.name.resumes.rawValue)

    func openDatabase() {
        do {
//            let path = Bundle.main.path(forResource: dbName, ofType: "sqlite3")!
//            let database = try Connection(path)
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("resume").appendingPathExtension("sqlite3")
            let database = try Connection(fileURL.path)

            self.db = database
        } catch {
            print(error)
        }
    }
    
    func getAllResumes() -> [ResumeModel] {
        do {
            var resumes = [ResumeModel]()
            let userResumes = try self.db.prepare(self.resumesTable.join(self.usersTable, on: K.DB.table.comparing.resumes.user_id == K.DB.table.comparing.users.id).join(self.photoTable, on: K.DB.table.comparing.resumes.id == K.DB.table.comparing.photo.resume_id).join(self.personalInfoTable, on: K.DB.table.comparing.resumes.id == K.DB.table.comparing.personal.resume_id).join(self.careerTable, on: K.DB.table.comparing.resumes.id == K.DB.table.comparing.career.resume_id).join(self.educationTable, on: K.DB.table.comparing.resumes.id == K.DB.table.comparing.edu.resume_id))
            for userResume in userResumes {
                print("Resume id: \(userResume[K.DB.table.resumes.id])")
                let resumeId = userResume[K.DB.table.resumes.id]
                let userId = userResume[K.DB.table.resumes.user_id]
                let photos = parser.parsePhoto(row: userResume)
                let personal = parser.parsePersonalInfo(row: userResume)
                let career = parser.parseCareerRow(row: userResume)
                let education = parser.parseEducationRow(row: userResume)
                let resume = ResumeModel(id: resumeId, user_id: userId, personal_info: personal, photos: photos, career: career, education: education)
                resumes.append(resume)
            }
            return resumes
        } catch {
            print(error)
            return [ResumeModel]()
        }
    }
    
    func insertUser(user: User) -> Int64? {
        do {
            let insert = self.usersTable.insert(K.DB.table.users.name <- user.name)
            let rowid = try db.run(insert)
            let insertedUser = try self.db.prepare(self.usersTable.filter(K.DB.table.users.id == rowid))
            return rowid
        } catch {
            print(error)
        }
        return nil
    }
    
    func insertResume(resume: Resume) -> Int64? {
        do {
            let insert = self.resumesTable.insert(K.DB.table.resumes.user_id <- resume.uid)
            let rowid = try db.run(insert)
            let insertedResume = try self.db.prepare(self.resumesTable.filter(K.DB.table.resumes.id == rowid))
            return rowid
        } catch {
            print(error)
        }
        return nil
    }
}
