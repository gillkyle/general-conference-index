//
//  ConferencesViewController.swift
//  Final Exam Gill Kyle
//
//  Created by Kyle Gill on 12/19/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//
import UIKit

class ConferencesViewController : UITableViewController {
    // MARK - Constants
    private struct Storyboard {
        static let ConferenceCellIdentifier = "ConferenceCell"
        static let ShowTalksSegue = "ShowTalks"
    }
    
    // MARK - Properties
    var conferences = ConfDatabase.sharedConfDatabase.conferences()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowTalksSegue {
            if let talksVC = segue.destination as? TalksViewController {
                if let indexPath = sender as? IndexPath {
                    talksVC.conference = conferences[indexPath.row]
                    // talksVC.conferenceId = indexPath.row + 1
                }
            }
        }
    }
    
    // MARK - Table View data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conferences.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ConferenceCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = conferences[indexPath.row].abbr
        
        return cell
    }
    
    // MARK - Table View delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.ShowTalksSegue, sender: indexPath)
    }
}
