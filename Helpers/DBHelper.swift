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
            let path = Bundle.main.path(forResource: dbName, ofType: "sqlite3")!
            let database = try Connection(path)
            self.db = database
        } catch {
            print(error)
        }
    }
    
    func getAllResumes() -> [Resume] {
        do {
            var resumes = [Resume]()
            let userResumes = try self.db.prepare(self.resumesTable.join(self.usersTable, on: K.DB.table.resumes.user_id == K.DB.table.users.id).join(self.photoTable, on: K.DB.table.resumes.id == K.DB.table.photo.resume_id).join(self.personalInfoTable, on: K.DB.table.resumes.id == K.DB.table.personal.resume_id).join(self.careerTable, on: K.DB.table.resumes.id == K.DB.table.career.resume_id).join(self.educationTable, on: K.DB.table.resumes.id == K.DB.table.edu.resume_id))
            for userResume in userResumes {
                print("Resume id: \(userResume[K.DB.table.resumes.id])")
                let resumeId = userResume[K.DB.table.resumes.id]
                let userId = userResume[K.DB.table.resumes.user_id]
                let photos = parser.parsePhoto(row: userResume)
                let personal = parser.parsePersonalInfo(row: userResume)
                let career = parser.parseCareerRow(row: userResume)
                let education = parser.parseEducationRow(row: userResume)
                let resume = Resume(id: resumeId, user_id: userId, personal_info: personal, photos: photos, career: career, education: education)
                resumes.append(resume)
            }
            return resumes
        } catch {
            print(error)
            return [Resume]()
        }
    }
//    
//    func getResumeRows() -> [ResumeRow] {
//        do {
//            let resumes = try self.db.prepare(self.resumesTable)
//            return parser.parseResumeRows(rows: resumes)
//        } catch {
//            print(error)
//            return [ResumeRow]()
//        }
//    }
//    
//    func getUsersRows() -> [UsersRow] {
//        do {
//            let users = try self.db.prepare(self.usersTable)
//            return parser.parseUsersRows(rows: users)
//        } catch {
//            print(error)
//            return [UsersRow]()
//        }
//    }
//    
//    func getPhotosRows() -> [PhotosRow] {
//        do {
//            let photos = try self.db.prepare(self.photoTable)
//            return parser.parsePhotos(rows: photos)
//        } catch {
//            print(error)
//            return [PhotosRow]()
//        }
//    }
//    
//    func getPersonalInfoRows() -> [PersonalInfoRow]{
//        do {
//            let personalInfo = try self.db.prepare(self.personalInfoTable)
//            return parser.parsePersonalInfo(rows: personalInfo)
//        } catch {
//            print(error)
//            return [PersonalInfoRow]()
//        }
//    }
//    
//    func getCareerRows() -> [CareerRow]{
//        do {
//            let career = try self.db.prepare(self.careerTable)
//            return parser.parseCareerRows(rows: career)
//        } catch {
//            print(error)
//            return [CareerRow]()
//        }
//    }
//    
//    func getEducationRows() -> [EducationRow]{
//        do {
//            let edu = try self.db.prepare(self.educationTable)
//            return parser.parseEducationRows(rows: edu)
//        } catch {
//            print(error)
//            return [EducationRow]()
//        }
//    }
}
