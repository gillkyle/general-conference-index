//
//  TalksViewController.swift
//  Final Exam Gill Kyle
//
//  Created by Kyle Gill on 12/19/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit

class TalksViewController : UITableViewController {
    // MARK - Constants
    private struct Storyboard {
        static let TalksCellIdentifier = "TalkCell"
    }
    
    // MARK - Properties
    var conference = Conference()
    var talks = [Talk]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Talks"
        
        updateModel()
        print(talks)
    }
    
    // MARK - Table View data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TalksCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = talks[indexPath.row].title
        
        return cell
    }
    
    // MARK - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    // MARK - Helpers
    private func updateModel() {
        talks = ConfDatabase.sharedConfDatabase.talksForId(conference.id)
    }
}