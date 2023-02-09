//
//  NewsListViewController.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import UIKit

class NewsListViewController: UIViewController {

    private let customView = NewsListView()
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        customView.tableView.dataSource = self
    }


}

