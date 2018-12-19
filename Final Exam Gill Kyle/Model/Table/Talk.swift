//
//  Talk.swift
//  Final Exam Gill Kyle
//
//  Created by Kyle Gill on 12/19/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation
import GRDB

struct Talk : TableRecord, FetchableRecord {
    // MARK: - Properties
    var id: Int
    var title: String
    var description: String
    
    // MARK: - Table mapping
    static let databaseTableName = "conference_talk"
    
    // MARK: - Field names
    static let id = "ID"
    static let title = "Title"
    static let description = "Description"
    
    // MARK: - Initialization
    init() {
        id = 0
        title = ""
        description = ""
    }
    
    init(row: Row) {
        id = row[Talk.id]
        title = row[Talk.title]
        description = row[Talk.description]
    }
}
