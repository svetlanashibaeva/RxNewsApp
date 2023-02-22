//
//  NewsWebView.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 22.02.2023.
//

import UIKit
import WebKit
import SnapKit

class NewsWebView: UIView {
    
    let webView = WKWebView()
    let activityIndicator = UIActivityIndicatorView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsWebView {
    
    func configure() {
        activityIndicator.style = .medium
    }

    func addSubviews() {
        addSubview(webView)
        webView.addSubview(activityIndicator)
    }
    
    func makeConstraints() {
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(webView)
        }
    }
}
