//
//  DetailViewController.swift
//  WhiteHousePetititons
//
//  Created by TALHA AYAR on 17.08.2019.
//  Copyright © 2019 Talha Ayar. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var item: Petition?
    var webView : WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        view = webView
        guard let detailItem = item else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
    }
    

}
