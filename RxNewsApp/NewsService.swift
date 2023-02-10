//
//  NewsService.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import Foundation

class NewsService {
    
    private let apiService = ApiService()
    
    func getTopHeadlines(page: Int, completion: @escaping (Result<[Article], Error>) -> ()) {
        apiService.requestItems(
            with: NewsEndpoint.getTopHeadlines(page: page),
            responseKey: "articles",
            completion: completion
        )
    }
}

