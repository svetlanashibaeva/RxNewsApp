//
//  RxDataSourceProtocol.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 16.02.2023.
//

import Foundation
import RxDataSources

protocol RxDataSourcesProtocol {
    typealias Section = SectionModel<String, TableCellModelProtocol>
    
    func reloadDataSource() -> RxTableViewSectionedReloadDataSource<Section>
}

extension RxDataSourcesProtocol {
    
    func reloadDataSource() -> RxTableViewSectionedReloadDataSource<Section> {
        return RxTableViewSectionedReloadDataSource<Section> { _, tableView, indexPath, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: element.cellIdentifier)!
            element.configureCell(cell)
            return cell
        }
    }
}
