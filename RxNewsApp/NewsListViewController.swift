//
//  NewsListViewController.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import UIKit

class NewsListViewController: UIViewController {

    private let customView = NewsListView()
    
    let service = NewsService()
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        service.getTopHeadlines(page: 1) { result in
            switch result {
            case let .success(article):
                print(article)
            default:
                return 
            }
        }
        
        
    }


}

