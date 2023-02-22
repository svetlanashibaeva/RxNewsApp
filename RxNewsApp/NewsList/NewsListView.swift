//
//  NewsListView.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import UIKit
import SnapKit

class NewsListView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsListView {

    func addSubviews() {
        addSubview(tableView)
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
