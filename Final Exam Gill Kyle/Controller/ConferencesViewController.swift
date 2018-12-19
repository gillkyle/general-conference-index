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
        static let ShowBooksSegue = "ShowBooks"
    }
    
    // MARK - Properties
    var conferences = ConfDatabase.sharedConfDatabase.conferences()
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Storyboard.ShowBooksSegue {
//            if let booksVC = segue.destination as? BooksViewController {
//                if let indexPath = sender as? IndexPath {
//                    booksVC.volume = conferences[indexPath.row]
//                    booksVC.volumeId = indexPath.row + 1
//                }
//            }
//        }
//    }
    
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
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: Storyboard.ShowBooksSegue, sender: indexPath)
//    }
}
