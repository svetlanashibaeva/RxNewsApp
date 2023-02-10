//
//  NewsCellModel.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import UIKit

struct NewsCellModel {
    
    let cellIdentifier = "NewsCell"
    
//    let article = Article
    
    func configureCell(_ cell: UITableViewCell) {
        guard let cell = cell as? NewsCell else { return }
        
//        cell.titleLabel = article
    }
}
