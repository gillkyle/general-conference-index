//
//  ScriptureDatabase.swift
//  Final Exam Gill Kyle
//
//  Created by Kyle Gill on 12/19/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation
import GRDB

class ConfDatabase {
    // MARK: - Constants
    struct Constant {
        static let fileName = "core.23"
        static let fileExtension = "db"
    }
    
    // MARK: - Properties
    var dbQueue: DatabaseQueue!
    
    // MARK: - Singleton
    static let sharedConfDatabase = ConfDatabase()
    
    fileprivate init() {
        dbQueue = try? DatabaseQueue(path: Bundle.main.path(forResource: Constant.fileName,
                                                            ofType: Constant.fileExtension)!)
    }
    
    // MARK: - Queries and Helpers
    
    //
    // Return a list of Conferences
    //
    func conferences() -> [Conference] {
        do {
            let conferences = try dbQueue.inDatabase { (db: Database) -> [Conference] in
                var conferences = [Conference]()
                for row in try Row.fetchAll(db,
                                            "SELECT ID, Abbr, Description, Year FROM conference ORDER BY IssueDate DESC", arguments: [ ]) {
                                                conferences.append(Conference(row: row))
                }
                return conferences
            }
            return conferences
        } catch {
            return []
        }
    }
}
