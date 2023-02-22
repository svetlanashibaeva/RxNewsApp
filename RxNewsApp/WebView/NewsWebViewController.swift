//
//  NewsWebViewController.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 22.02.2023.
//

import UIKit
import WebKit

class NewsWebViewController: UIViewController {
    
    private let customView = NewsWebView()
    
    var url: URL?
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = url else { return }
        let request = URLRequest(url: url)
        
        customView.webView.load(request)
        customView.webView.navigationDelegate = self
        customView.webView.allowsBackForwardNavigationGestures = true
        customView.activityIndicator.hidesWhenStopped = true
    }
}

extension NewsWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        customView.activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        customView.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        customView.activityIndicator.stopAnimating()
    }
}

