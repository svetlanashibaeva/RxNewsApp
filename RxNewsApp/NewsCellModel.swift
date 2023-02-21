//
//  NewsCellModel.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import UIKit

struct NewsCellModel: TableCellModelProtocol {
    
    let cellIdentifier = NewsCell.reuseId
    
    let article: Article
    
    func configureCell(_ cell: UITableViewCell) {
        guard let cell = cell as? NewsCell else { return }
        
        cell.titleLabel.text = article.title
        cell.sourceLabel.text = article.sourceName
        cell.dateLabel.text = article.formattedDate
        cell.imageNewsView.set(imageURL: article.urlToImage)
    }
}
