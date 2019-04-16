//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Simon McNeil on 2019-04-16.
//  Copyright © 2019 SimonMcNeil. All rights reserved.
//

import WebKit
import UIKit


class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displays the HTML file using the webview
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
