//
//  TalkViewController.swift
//  Final Exam Gill Kyle
//
//  Created by Kyle Gill on 12/19/18.
//  Copyright © 2018 Kyle Gill. All rights reserved.
//

import UIKit
import WebKit

class TalkViewController : UIViewController, WKNavigationDelegate {
    // MARK - Properties
    var talk = Talk()
    
    // MARK - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        
        webView.navigationDelegate = self
        let url = URL(string: talk.url)
        webView.load(URLRequest(url: url!))
//        webView.loadHTMLString(talk.url, baseURL: nil)
//        webView.loadHTMLString("https://scriptures.byu.edu/cotent/talks_ajax/\(talk.id)", baseURL: nil)
    }
}
