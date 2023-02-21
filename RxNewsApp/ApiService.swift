//
//  ApiService.swift
//  RxNewsApp
//
//  Created by Света Шибаева on 09.02.2023.
//

import Foundation
import ObjectMapper
import RxSwift
import RxCocoa

class ApiService {
    
    func requestItems<T: BaseMappable>(with endpoint: EndpointProtocol, responseKey: String? = nil) -> Observable<[T]> {
        
        request(endpoint: endpoint)
            .map { json -> [T] in
                let objects: Any?
                
                if let responseKey = responseKey {
                    let json = (json as? [String : Any]) ?? [:]
                    objects = json[responseKey]
                } else {
                    objects = json
                }
                
                guard let parsedObjects = Mapper<T>(context: nil).mapArray(JSONObject: objects) else {
                    throw MyError.parseError
                }
                return parsedObjects
            }
    }
    
    private func request(endpoint: EndpointProtocol) -> Observable<Any> {
        guard let url = buildUrl(with: endpoint) else {
            return .error(MyError.urlError)
        }
        
        return URLSession.shared.rx.json(url: url)
    }
    
    private func buildUrl(with endpoint: EndpointProtocol) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.params.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        return urlComponents.url
    }
}

