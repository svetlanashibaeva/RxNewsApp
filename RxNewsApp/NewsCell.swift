//
//  NewsCell.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    
    static let reuseId = "NewsCell"
    
    let imageNewsView = UIImageView()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let sourceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsCell {
    func configure() {
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        dateLabel.textColor = .white
        dateLabel.numberOfLines = 1
        
        sourceLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        sourceLabel.textColor = .white
        sourceLabel.numberOfLines = 1
    }
    
    func addSubviews() {
        [imageNewsView, titleLabel, dateLabel, sourceLabel].forEach(addSubview)
    }
    
    func makeConstraints() {
        imageNewsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }
        
        sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(sourceLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}
