//
//  Conference.swift
//  Final Exam Gill Kyle
//
//  Created by Kyle Gill on 12/19/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import Foundation
import GRDB

struct Conference : TableRecord, FetchableRecord {
    // MARK: - Properties
    var id: Int
    var abbr: String
    var description: String
    var year: Int?
    
    // MARK: - Table mapping
    static let databaseTableName = "conference"
    
    // MARK: - Field names
    static let id = "ID"
    static let abbr = "Abbr"
    static let description = "Description"
    static let year = "Year"
    
    // MARK: - Initialization
    init() {
        id = 0
        abbr = ""
        description = ""
        year = 0
    }
    
    init(row: Row) {
        id = row[Conference.id]
        abbr = row[Conference.abbr]
        description = row[Conference.description]
        year = row[Conference.year]
    }
}
