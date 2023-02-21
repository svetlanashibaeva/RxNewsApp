//
//  Article.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 08.02.2023.
//

import Foundation
import ObjectMapper

struct Article: Equatable {
    let title: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date?
    let sourceName: String?
    let formattedDate: String
}

extension Article: ImmutableMappable {
    
    init(map: Map) throws {
        let dateFormatterToDate = DateFormatter()
        dateFormatterToDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateTransform = DateFormatterTransform(dateFormatter: dateFormatterToDate)
        
        title = try? map.value("title")
        url = try map.value("url")
        urlToImage = try? map.value("urlToImage")
        publishedAt = try? map.value("publishedAt", using: dateTransform)
        sourceName = try? map.value("source.name")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        formattedDate = dateFormatter.string(from: publishedAt ?? Date())
    }
}
