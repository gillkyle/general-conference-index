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
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    // MARK - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        view.addSubview(webView)
        webView.navigationDelegate = self
        let url = URL(string: talk.url)
        webView.load(URLRequest(url: url!))
//        webView.loadHTMLString(talk.url, baseURL: nil)
//        webView.loadHTMLString("https://scriptures.byu.edu/cotent/talks_ajax/\(talk.id)", baseURL: nil)
        view.addSubview(myActivityIndicator)
    }
    
    // show indicator
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // Start Activity Indicator
        print("start load")
        myActivityIndicator.startAnimating()
    }
    
    // hide indicator
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("end load")
        myActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("error")
        myActivityIndicator.stopAnimating()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
