//
//  NewsListViewController.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class NewsListViewController: UIViewController, RxDataSourcesProtocol {

    private let customView = NewsListView()
    
    private let disposeBag = DisposeBag()
    
    private let service = NewsService()
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureRx()
    }
}

private extension NewsListViewController {
    
    func configureRx() {
        var page = 1
        var isListEnded = false
        let cellModelsRelay = BehaviorRelay<[TableCellModelProtocol]>(value: [])
        
        let didScrollToBottom = customView.tableView.rx.willBeginDragging
            .withUnretained(customView.tableView)
            .flatMapLatest { tableView, _ -> Observable<Void> in
                tableView.rx.didScroll
                    .filter { [weak tableView] _ in
                        guard let tableView = tableView else { return false }
                        return (tableView.contentOffset.y + tableView.bounds.height) > (tableView.contentSize.height - 500)
                    }
                    .take(1)
            }
        
        let requestResult = didScrollToBottom
            .startWith(())
            .flatMapFirst { [weak self] _ -> Observable<Event<[Article]>> in
                guard let self = self, !isListEnded else { return .empty() }
                
                return self.service.getTopHeadlines(page: page)
                    .materialize()
            }
                
        requestResult
            .compactMap { event -> [TableCellModelProtocol]? in
                guard let articles = event.element else { return nil }
                
                return articles.map { article in
                    NewsCellModel(article: article)
                }
            }
            .do(onNext: { cellModels in
                isListEnded = cellModels.isEmpty
                page += 1
            })
            .withLatestFrom(cellModelsRelay) { newCellModels, cellModels in
                return cellModels + newCellModels
            }
            .bind(to: cellModelsRelay)
            .disposed(by: disposeBag)
                
        cellModelsRelay
                .map { [Section(model: "Articles", items: $0)] }
                .bind(to: customView.tableView.rx.items(dataSource: reloadDataSource()))
                .disposed(by: disposeBag)
        
        customView.tableView.rx.itemSelected
            .bind(with: customView.tableView) { tableView, indexPath in
                tableView.deselectRow(at: indexPath, animated: true)
            }
            .disposed(by: disposeBag)
        
        customView.tableView.rx.modelSelected(TableCellModelProtocol.self)
            .compactMap { cellModel -> NewsWebViewController? in
                guard let article = (cellModel as? NewsCellModel)?.article else { return nil }
                
                let controller = NewsWebViewController()
                controller.url = URL(string: article.url)
                return controller
            }
            .bind(with: self) { base, webVC in
                base.navigationController?.pushViewController(webVC, animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    func configureUI() {
        customView.tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        title = "Top news"
    }
}

