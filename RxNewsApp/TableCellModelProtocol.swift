//
//  TableCellModelProtocol.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import UIKit

protocol TableCellModelProtocol {
    var cellIdentifier: String { get }
    func configureCell(_ cell: UITableViewCell)
}
