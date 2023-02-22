//
//  NewsService.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import Foundation
import RxSwift

class NewsService {
    
    private let apiService = ApiService()
    
    func getTopHeadlines(page: Int) -> Observable<[Article]> {
        apiService.requestItems(
            with: NewsEndpoint.getTopHeadlines(page: page),
            responseKey: "articles"
        )
    }
}

