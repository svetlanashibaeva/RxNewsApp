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
    
    let imageNewsView = WebImageView()
    let opacityView = UIView()
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

//    override func prepareForReuse() {
//        imageNewsView.set(imageURL: nil)
//    }
}

private extension NewsCell {
    
    func configure() {
        
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        dateLabel.textColor = .white
        dateLabel.numberOfLines = 1
        
        sourceLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        sourceLabel.textColor = .white
        sourceLabel.numberOfLines = 1
        
        opacityView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        imageNewsView.contentMode = .scaleAspectFill
    }
    
    func addSubviews() {
        [imageNewsView, opacityView, titleLabel, dateLabel, sourceLabel].forEach(contentView.addSubview)
    }
    
    func makeConstraints() {
        opacityView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        imageNewsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
        }
        
        sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(sourceLabel.snp.bottom).offset(5)
            make.bottom.left.right.equalToSuperview().inset(16)
        }
    }
}
