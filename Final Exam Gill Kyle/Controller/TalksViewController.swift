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
        static let ShowTalkSegue = "ShowTalk"
    }
    
    // MARK - Properties
    var conference = Conference()
    var talks = [Talk]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Talks"
        
        updateModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowTalkSegue {
            if let talkVC = segue.destination as? TalkViewController {
                if let indexPath = sender as? IndexPath {
                    talkVC.talk = talks[indexPath.row]
                }
            }
        }
    }
    
    // MARK - Table View data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TalksCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = talks[indexPath.row].title
        cell.detailTextLabel?.text = talks[indexPath.row].speakerName
        
        return cell
    }
    
    // MARK - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowTalkSegue, sender: indexPath)
    }
    
    // MARK - Helpers
    private func updateModel() {
        talks = ConfDatabase.sharedConfDatabase.talksForId(conference.id)
    }
}
