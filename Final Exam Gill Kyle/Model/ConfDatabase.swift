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
    
    //
    // Return a list of talks for a given conference ID
    //
    func talksForId(_ conferenceId: Int) -> [Talk] {
        do {
            let talks = try dbQueue.inDatabase { (db: Database) -> [Talk] in
                var talks = [Talk]()
                for row in try Row.fetchAll(db,
                                            "SELECT t.ID, t.Title, s.Description FROM talk t JOIN conference_talk c JOIN conf_session s WHERE t.ID=c.TalkID AND c.SessionID=s.ID AND s.ConferenceID=? ORDER BY s.Sequence, c.Sequence", arguments: [ conferenceId ]) {
                                                talks.append(Talk(row: row))
                }
                return talks
            }
            return talks
        } catch {
            return []
        }
    }
}
