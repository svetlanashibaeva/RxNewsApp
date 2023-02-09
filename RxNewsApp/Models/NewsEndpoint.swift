//
//  NewsEndpoint.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import Foundation

enum NewsEndpoint {
    case getTopHeadlines(page: Int)
}

extension NewsEndpoint: EndpointProtocol {
    
    var host: String {
        return "newsapi.org"
    }
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    var params: [String : String] {
        switch self {
        case let .getTopHeadlines(page):
            let params = ["category": "entertainment", "page": "\(page)", "pageSize": "20"]
            return params
        }
    }
    
    var headers: [String : String] {
        ["X-Api-Key": "fb58c0e298be462692fbcae752d5fd8d"]
    }
}
